{ pkgs, ... }:
let
	awesome_wm = {
		xsession.windowManager = {
			awesome = {
				enable = true;
				luaModules = with pkgs.luaPackages; [];
			};
		};

		home.file.".xinitrc" = {
			text = ''
				exec dbus-launch --exit-with-session --sh-syntax awesome -c ${builtins.toString ./awesome/rc.lua} --search ${builtins.toString ./awesome}
			'';
		};
	};

	base_pkgs = {
		home.packages = with pkgs; [
		    kitty kitty-themes
		    glib
		    networkmanagerapplet
		    blueman
		    i3lock-color
		    flashfocus
		];
	};

	x11_pkgs = {
		home.packages = with pkgs; [
    		xdragon
    		xclip
    		xdg-utils
    		ueberzug
    		unclutter-xfixes
    		picom warpd
		];
	};
in {
	imports = [
		awesome_wm
		base_pkgs
		x11_pkgs
	];
}
