{ pkgs, ... }:
let
  base_pkgs = {
    home.packages = with pkgs; [
      glib
      networkmanagerapplet
      blueman
    ];
  };

  x11_pkgs = {
    imports = [ base_pkgs ];
    home.packages = with pkgs; [
      xdragon
      xclip
      xdotool
      xdg-utils
      unclutter-xfixes
      picom
      warpd
    ];
  };

  i3_wm = {
    imports = [
      x11_pkgs
      ./i3wm
    ];

    home = {
      file.".xinitrc".text = ''
        rm /home/sny/.zsh_history
        exec dbus-launch --exit-with-session --sh-syntax i3
      '';

      packages = with pkgs; [
        i3lock-color
        maim
      ];
    };
  };
in {
  imports = [
    i3_wm
    ./themes.nix
  ];
}
