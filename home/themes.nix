{ pkgs, ...}:
{
	dconf.settings = {
		"org/gnome/desktop/interface" = {
			gtk-theme = "Dracula";
			icon-theme = "Dracula";
			color-scheme = "prefer-dark";
		};
	};

	gtk = {
		enable = true;
		theme = {
			name = "Dracula";
			package = pkgs.dracula-theme;
		};

		iconTheme = {
			name = "Dracula";
			package = pkgs.dracula-icon-theme;
		};

	};

	qt = {
		enable = true;
		platformTheme = "gtk";
		style.name = "gtk2";
	};
}
