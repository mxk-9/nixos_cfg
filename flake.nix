{
  description = "Sny Spyper's NixOS config.";
  inputs = {
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-on-droid = {
      url = "github:nix-community/nix-on-droid/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    { nixpkgs, nixpkgs-unstable, home-manager, nix-on-droid, ... }@inputs:
    let
      system = "x86_64-linux";

      homeModule = [
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            backupFileExtension = "bebra_back";
          };
          imports = [ ./home/sny.nix ];
          home-manager.extraSpecialArgs = {
            inherit inputs;
            pkgs-unstable = import nixpkgs-unstable {
              inherit system;
              config.allowUnfree = true;
            };
          };
        }
      ];

      specialArgs = { inherit inputs; };

      systems = let system = "x86_64-linux";
      in [
        {
          name = "Honor-NixOS";
          inherit system;
        }

        {
          name = "Ernmore-NixOS";
          inherit system;
        }
      ];
    in {
      nixosConfigurations = builtins.listToAttrs (builtins.map (system: {
        name = system.name;
        value = nixpkgs.lib.nixosSystem {
          system = system.system;
          specialArgs = { inherit inputs; };
          modules = [ ./hosts/${system.name} ] ++ homeModule;
        };
      }) systems);

      nixOnDroidConfigurations.default =
        nix-on-droid.lib.nixOnDroidConfiguration {
          pkgs = import nixpkgs { system = "aarch64-linux"; };
          modules = [ ./nix-on-droid.nix ];
        };
    };
}
