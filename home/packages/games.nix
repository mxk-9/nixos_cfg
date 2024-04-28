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
		# openmw
		# srb2
		# xonotic
		# minetest
		# lutris
	];

	imports = [
		minecraft
	];
}
