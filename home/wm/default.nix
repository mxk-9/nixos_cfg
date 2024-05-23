{ pkgs, ... }:
let
	base_pkgs = {
		home.packages = with pkgs; [
		    kitty kitty-themes
		    glib
		    networkmanagerapplet
		    blueman
			xdotool
			xorg.xwininfo
		];
	};

	x11_pkgs = {
		imports = [ base_pkgs ];
		home.packages = with pkgs; [
			xdragon
			xclip
			xdg-utils
			ueberzug
			unclutter-xfixes
			picom
			warpd
		];
	};

	awesome_wm = {
		imports = [ x11_pkgs ];
		xsession.windowManager = {
			awesome = {
				enable = true;
				luaModules = with pkgs.luaPackages; [];
			};
		};

		home.file.".xinitrc" = let
			awm = /home/sny/nixos-cfg/home/wm/awesome;
		in {
			text = "exec dbus-launch --exit-with-session --sh-syntax awesome -c ${awm}/rc.lua --search ${awm}";
		};

		home.packages = with pkgs; [
		    i3lock-color
		];
	};

	i3_wm = {
		imports = [
			x11_pkgs
			./i3wm
		];

		home.packages = with pkgs; [
			i3lock-color
			maim
		];

		home.file.".xinitrc".text = "
		rm /home/sny/.zsh_history
		exec dbus-launch --exit-with-session --sh-syntax i3
		";
	};
in {
	imports = [
		# awesome_wm
		i3_wm
		./themes.nix
	];
}
