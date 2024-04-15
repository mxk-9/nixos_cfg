{ pkgs, ... }:
{
	home.packages = with pkgs; [
		chromium
		kotatogram-desktop
		discord
		remmina
		qbittorrent
		tor-browser-bundle-bin
	];
}
