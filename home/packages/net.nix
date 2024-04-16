{ pkgs, ... }:
{
	home.packages = with pkgs; [
		chromium
		kotatogram-desktop
		remmina
		qbittorrent
		tor-browser-bundle-bin
	];
}
