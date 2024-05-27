{ ... }:
{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.sny = {
      home.stateVersion = "23.11";

      xdg.configFile.nvim.source = ./nvim;

      imports = [
        ./shell
        ./packages
        ./wm
        ./tmux.nix
        ./kitty.nix
      ];
    };
  };
}
