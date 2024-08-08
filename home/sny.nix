{...}: {
  home-manager.users.sny = {
    home.stateVersion = "24.05";

    imports = [
      ./firefox
      ./shell
      ./nvim
      # ./helix.nix
      ./wm
      ./tmux.nix
      ./kitty.nix
      ./packages
    ];
  };
}
