{ pkgs, ... }:
{
  home.packages = with pkgs; [
    zathura
    # libreoffice-qt
    keepassxc
  ];
}
