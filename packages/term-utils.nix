{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    fd
    git
    rsync
    p7zip
    unzip
    rar
    unrar
    htop
    bat
    file
    wget
    curl
    hwinfo
    tree
  ];

  programs.tmux = {
    enable = true;
    extraConfig = builtins.readFile ../home/cfg-files/tmux.conf;
  };
}
