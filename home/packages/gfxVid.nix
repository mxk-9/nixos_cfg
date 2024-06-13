{ pkgs, ...}:
{
  home.packages = with pkgs; [
    gimp
    kdenlive
    blender
    gwenview
    ffmpeg_7-full
    obs-studio
  ];
}
