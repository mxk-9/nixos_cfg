{ pkgs, ... }:
let
	minecraft = {
		programs.java.enable = true;
		home.packages = [ pkgs.prismlauncher ];
	};
in {
	home.packages = with pkgs; [
		wineWowPackages.stableFull wineWowPackages.fonts winetricks
		duckstation
		# minetest
		# xonotic
		# openmw
		# lutris
	];

	imports = [
		minecraft
	];
}
