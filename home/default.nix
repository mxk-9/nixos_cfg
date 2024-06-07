{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.sny = {
      home.stateVersion = "24.05";

      imports = [
        ./shell
        ./nvim
        ./helix
        ./packages
        ./wm
        ./tmux.nix
        ./kitty.nix
        ./firefox
      ];
    };
  };
}
