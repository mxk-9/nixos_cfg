{ pkgs, ... }:
{
  environment.packages = [ pkgs.neovim ];
  system.stateVersion = "24.05";

  home-manager.config = {pkgs, ...}: {
    home.stateVersion = "24.05";

    imports = [ ];
  };
}
