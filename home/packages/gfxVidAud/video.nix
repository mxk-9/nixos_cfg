{ pkgs, ... }:
{
  home.packages = with pkgs; [
    kdenlive
    ffmpeg
    obs-studio
  ];
}
