{...}: {
  home-manager.users.sny = {
    home.stateVersion = "24.05";

    imports = [
      ./firefox
      ./shell
      ./emacs.nix
      ./nvim.nix
      # ./helix.nix
      ./wm
      ./tmux.nix
      ./kitty.nix
      ./packages
    ];
  };
}
