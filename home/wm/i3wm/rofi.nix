{ pkgs, ... }:{
	programs.rofi = {
		enable = true;
		extraConfig = {
			modi = "drun,window";
			font = "JetBrains Mono 12";
			icon-theme = "Dracula";
			show-icons = true;
		};
		theme = "${pkgs.rofi}/share/rofi/themes/Arc-Dark.rasi";
	};
}
