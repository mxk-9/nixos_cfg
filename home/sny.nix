{...}: {
  home-manager.users.sny = {
    home.stateVersion = "24.05";

    imports = [
      ./zsh
      ./wm
      ./packages
    ];

    programs.direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };
  };
}
