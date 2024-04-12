{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gimp
    # krita
    gwenview
    scrot
    gpick
    blender
  ];
}
