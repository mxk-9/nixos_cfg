{ pkgs, ...}: {
  programs.qutebrowser = {
    enable = true;
    package = pkgs.qutebrowser; # qtb w/ qt6
  };
}
