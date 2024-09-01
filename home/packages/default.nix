{ pkgs, ... }: let
  office = {
    home.packages = with pkgs; [
      zathura
      keepassxc
      # libreoffice-qt
    ];
  };

  net = {
    home.packages = with pkgs; [
      telegram-desktop
      qbittorrent
      discord
      # thunderbird
      # remmina
      # tor-browser-bundle-bin
    ];
  };

  gfxVid = {
    home.packages = with pkgs; [
      krita
      kdenlive
      blender
      gwenview
      ffmpeg_7-full
      obs-studio
    ];
  };

  media = {
    home.packages = with pkgs; [
      playerctl
      songrec
      python312Packages.yt-dlp
    ];
  };

in {
  imports = [
    ./games.nix
    gfxVid
    media
    net
    office
  ];
}
