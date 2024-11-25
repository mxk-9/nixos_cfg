{...}: {
  home-manager.users.sny = {
    home.stateVersion = "24.05";

    imports = [
      ./zsh
      ./wm
      ./packages
    ];

  };
}
