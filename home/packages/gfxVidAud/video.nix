{ pkgs, ... }:
{
  home.packages = with pkgs; [
    kdenlive
    ffmpeg_7-full
    obs-studio
  ];
}
