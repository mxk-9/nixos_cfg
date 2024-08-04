{ pkgs, ... }:
{
  home.packages = with pkgs; [
    chromium
    telegram-desktop
    qbittorrent
    # thunderbird
    discord
    # remmina
    # tor-browser-bundle-bin
  ];
}
