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
				dbus = {
					enable = true;
					packages = [ pkgs.blueman ];
				};
		};

		programs = {
			light.enable = true;
			dconf.enable = true;
		};

		systemd.packages = [ pkgs.blueman ];
	};

	x11_setup = {
		# Enable the X11 windowing system.
		services.xserver = {
			enable = true;
			xkb = {
				options = "grp:caps_toggle,compose:rctrl";
				layout = "us,ru";
			};
			# desktopManager.xterm.enable = false;
			excludePackages = [ pkgs.xterm ];
			wacom.enable = true;
			displayManager = {
				startx.enable = true;
			};
		};
	
		programs.dconf.enable = true;
	
		# Enable touchpad support (enabled default in most desktopManager).
		services.xserver.libinput = {
			enable = true;
			mouse = {
				# disabling acceleration
				accelProfile = "flat";
			};
			touchpad = {
				accelProfile = "flat";
				disableWhileTyping = false;
			};
		};
	};

	nvim_ed = {
		programs.neovim.enable = true;
	};

	helix_ed = {
		environment.systemPackages = [ pkgs.helix ];
	};

	# defEd = helix_ed;
	defEd = nvim_ed;
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
		defEd
		android_setup
		x11_setup
		wm_base
		./hardware
		./packages
		./fonts.nix
		./locale.nix
		./user.nix
		./doas.nix
		# ./virt-manager.nix
		inputs.home-manager.nixosModule
	];

	system.stateVersion = "23.11";
}

