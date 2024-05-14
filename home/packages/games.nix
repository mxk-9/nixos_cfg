{ pkgs, ... }:
let
	minecraft = {
		programs.java.enable = true;
		home.packages = [ pkgs.prismlauncher ];
	};

	wine = {
		home.packages = with pkgs; [
			wineWowPackages.stableFull
			wineWowPackages.fonts
			winetricks
		];
	};
in {
	home.packages = with pkgs; [
		lutris
		duckstation
		flycast
		openmw
		# srb2
		# xonotic
		# minetest
	];

	imports = [
		minecraft
		wine
	];
}
