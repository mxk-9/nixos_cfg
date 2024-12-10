{ pkgs, lib, pkgs-unstable, ... }: {
  home-manager.users.sny = {
    home.stateVersion = "24.05";

    imports = [
      ./zsh
      ./wm
      (import ./packages {
        isMobile = false;
        inherit pkgs pkgs-unstable lib;
      })
    ];
  };
}
