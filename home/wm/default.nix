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
      feh
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
      ./daemons
    ];
  };

  awesome_wm = {
    imports = [
      x11_pkgs
      base_pkgs
      ./awesome.nix
    ];
  };

  sway_wm = {
    imports = [
      base_pkgs
      ./sway.nix
    ];
  };

in {
  imports = [
    # i3_wm
    awesome_wm
    ./themes.nix
  ];
}
