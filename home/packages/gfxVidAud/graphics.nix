{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gimp
    mypaint
    gwenview
    gpick
    blender
  ];
}
