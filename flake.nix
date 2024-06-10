{
  description = ''
  Sny Spyper's NixOS config.
  '';
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = {
    nixpkgs
    , home-manager
    , ...
  }@inputs: let
    system = "x86_64-linux";

    homeModule = [
      home-manager.nixosModules.home-manager {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
        };
        imports = [ ./home/sny.nix ];
        home-manager.extraSpecialArgs = { inherit inputs; };
      }
    ];

    specialArgs = { inherit inputs; };
  in {
    nixosConfigurations.Honor-NixOS = nixpkgs.lib.nixosSystem {
      inherit system specialArgs;
      modules = homeModule ++ [ ./hosts/Honor-NixOS ];
    };

    nixosConfigurations.Ernmore-NixOS = nixpkgs.lib.nixosSystem {
      inherit system specialArgs;
      modules = homeModule ++ [ ./hosts/Ernmore-NixOS ];
    };
  };
}
