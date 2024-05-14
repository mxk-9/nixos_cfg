{ pkgs, ... }:
{
	home.packages = with pkgs; [
		chromium
		thunderbird
		discord
		telegram-desktop
		remmina
		qbittorrent
		tor-browser-bundle-bin
	];
}
