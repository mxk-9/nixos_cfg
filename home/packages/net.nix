{ pkgs, ... }:
{
	home.packages = with pkgs; [
		chromium
		discord
		kotatogram-desktop
		remmina
		qbittorrent
		tor-browser-bundle-bin
	];
}
