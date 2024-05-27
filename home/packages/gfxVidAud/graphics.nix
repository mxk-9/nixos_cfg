{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gimp
    mypaint
    mate.eom
    gpick
    blender
  ];
}
