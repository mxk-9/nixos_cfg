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
      lutris
    ];
  };
in {
  home.packages = with pkgs; [
    duckstation
    pcsx2
    flycast
    # rpcs3
    minetest
    # openmw
    # srb2
    # xonotic
  ];

  imports = [
    minecraft
    wine
    # ./dosbox.nix
  ];
}
