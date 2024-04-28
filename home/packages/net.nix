{ pkgs, ... }:
{
	home.packages = with pkgs; [
		chromium
		discord
		telegram-desktop
		remmina
		qbittorrent
		tor-browser-bundle-bin
	];
}
