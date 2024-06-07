{ pkgs, ... }:
{
  home.packages = with pkgs; [
      playerctl
      songrec
      python312Packages.yt-dlp
  ];
}
