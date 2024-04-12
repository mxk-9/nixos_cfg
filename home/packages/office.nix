{ pkgs, ... }:
{
  home.packages = with pkgs; [
    zathura
    libreoffice
    keepassxc
  ];
}
