{ pkgs, ...}:
{
  home.packages = with pkgs; [
    gimp
    kdenlive
    blender
    ffmpeg_7-full
    obs-studio
  ];
}
