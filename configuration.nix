{ pkgs, lib, inputs, ... }:
let
	android_setup = {
		programs.adb.enable = true;
		users.users.sny.extraGroups = [ "adbusers" ];
	};

	wm_base = {
		services = {
				power-profiles-daemon.enable = true;
				udisks2.enable = true;
		};

		programs = {
			light.enable = true;
			dconf.enable = true;
		};

	};

	x11_setup = {
		services.xserver = {
			enable = true;
			xkb = {
				options = "grp:caps_toggle,compose:rctrl";
				layout = "us,ru";
			};
			excludePackages = [ pkgs.xterm ];
			wacom.enable = true;
			displayManager.startx.enable = true;
		};
	
		programs.dconf.enable = true;
	
		services.xserver.libinput = {
			enable = true;
			mouse = {
				accelProfile = "flat";
			};
			touchpad = {
				accelProfile = "flat";
				disableWhileTyping = false;
			};
		};
	};

	doas_setup = {
		security = {
			doas = {
				enable = true;
				extraRules = [{
					users = [ "sny" ];
					keepEnv = true;
					persist = true;
				}];
			};
			sudo.enable = false;
		};
	};

	nvim_ed = { programs.neovim.enable = true; };

	locale = {
		i18n = {
			defaultLocale = "en_US.UTF-8";
			supportedLocales = [ "ru_RU.UTF-8/UTF-8" "en_US.UTF-8/UTF-8" ];
			extraLocaleSettings = {
				LC_ADDRESS = "ru_RU.UTF-8";
				LC_IDENTIFICATION = "ru_RU.UTF-8";
				LC_MEASUREMENT = "ru_RU.UTF-8";
				LC_MONETARY = "ru_RU.UTF-8";
				LC_NAME = "ru_RU.UTF-8";
				LC_NUMERIC = "ru_RU.UTF-8";
				LC_PAPER = "ru_RU.UTF-8";
				LC_TELEPHONE = "ru_RU.UTF-8";
				LC_TIME = "ru_RU.UTF-8";
				LC_MESSAGES = "en_US.UTF-8";
			}; 
		};

		console = {
			earlySetup = true;
			font = "ter-v24n";
			packages = [ pkgs.terminus_font ];
			useXkbConfig = true; # use xkbOptions in tty.
		};
	};

	fonts = {
		fonts.packages = with pkgs; [
			noto-fonts
			noto-fonts-cjk
			noto-fonts-emoji
			liberation_ttf
			fira-code
			fira-code-symbols
			fira-mono
			font-awesome
			jetbrains-mono
			nerdfonts
			mplus-outline-fonts.githubRelease
			dina-font
			proggyfonts
			corefonts
		];
	};

	sys_utils = {
		environment.systemPackages = with pkgs; [
			fd rsync tree
			git wget curl
			bat file
			p7zip unzip rar unrar
			htop hwinfo
			tmux
			pciutils
			psmisc
			hdparm
			inxi
		];
	};

	steam_setup = {
		programs.steam = {
			enable = true;
			remotePlay.openFirewall = true;
			dedicatedServer.openFirewall = true;
		};
	};

	db_setup = {
		services = {
			mysql = {
				enable = true;
				package = pkgs.mariadb;
			};
		};
		environment.systemPackages = [ pkgs.mysql-workbench ];
	};

	mpv_setup = {
		environment.systemPackages = with pkgs; [ mpv ];
		nixpkgs.overlays = [
			(self: super: {
				mpv = super.mpv.override {
					scripts = with self.mpvScripts ; [
						quality-menu mpris sponsorblock mpv-playlistmanager
					];
				};
			})
		];
	};
in {
	nix = {
		settings = {
			experimental-features = [ "nix-command" "flakes" ];
			auto-optimise-store = true;
		};
		nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
		registry = {
			n.flake = inputs.nixpkgs;
		};
	};

	nixpkgs.config.allowUnfree = true;
	documentation.dev.enable = true;

	imports = [
		nvim_ed
		android_setup
		x11_setup
		wm_base
		locale
		doas_setup
		fonts
		sys_utils
		steam_setup
		# db_setup
		mpv_setup
		./hardware
		./user.nix
		inputs.home-manager.nixosModule
	];

	system.stateVersion = "23.11";
}
