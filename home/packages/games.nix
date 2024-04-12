{ pkgs, ... }:
{
  # For minecraft
  programs.java.enable = true;

  home.packages = with pkgs; [
    wineWowPackages.stableFull wineWowPackages.fonts winetricks
    duckstation
    minetest
    prismlauncher
    # xonotic
    # openmw
    # lutris
  ];
}
