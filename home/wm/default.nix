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
    home.packages = with pkgs; [
      maim
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
      base_pkgs
      ./i3wm
    ];
  };

  awesome_wm = {
    imports = [
      x11_pkgs
      base_pkgs
      ./awesome
    ];
  };

in {
  imports = [
    # i3_wm
    awesome_wm
    ./themes.nix
    ./daemons
  ];
}
