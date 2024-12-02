{ pkgs, pkgs-unstable, lib, ... }:
{
  environment.packages = with pkgs; [
    neovim
    git
    openssh
  ];
  system.stateVersion = "24.05";

  home-manager.config = {pkgs, ...}: {
    home.stateVersion = "24.05";

    imports = [ 
      (import ./home/packages {
        isMobile = true;
        inherit pkgs pkgs-unstable lib;
      }) 
    ];
  };
}
