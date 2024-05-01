{ pkgs, ... }:
let
	minecraft = {
		programs.java.enable = true;
		home.packages = [ pkgs.prismlauncher ];
	};
in {
	home.packages = with pkgs; [
		wineWowPackages.stableFull wineWowPackages.fonts winetricks
		lutris
		duckstation
		# openmw
		# srb2
		# xonotic
		# minetest
	];

	imports = [
		minecraft
	];
}
