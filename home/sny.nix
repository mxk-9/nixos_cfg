{
  home-manager.users.sny = {
    home.stateVersion = "24.05";

    imports = [
      ./shell
      ./nvim
      ./helix
      ./wm
      ./tmux.nix
      ./kitty.nix
      ./firefox
      ./packages
    ];
  };
}
