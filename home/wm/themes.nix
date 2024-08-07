{ pkgs, lib, ...}:
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

    font = {
      package = pkgs.jetbrains-mono;
      name = "JetBrains Mono";
      size = 15.0;
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "gtk";
    style.name = "gtk2";
  };


  home = {
    pointerCursor = with pkgs; {
      package = quintom-cursor-theme;
      name = "Quintom_Ink";
      size = 32;
    };
    sessionVariables.QT_QPA_PLATFORMTHEME = lib.mkForce "gtk";
  };
}
