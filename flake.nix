{
  description = "Sny Spyper's NixOS config.";
  inputs = {
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-ld = {
      url = "github:Mic92/nix-ld";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = {
    nixpkgs
    , nixpkgs-unstable
    , home-manager
    # , nix-ld
    , ...
  }@inputs: let
    system = "x86_64-linux";

    homeModule = [
      home-manager.nixosModules.home-manager {
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

    systems = let system = "x86_64-linux"; in [
      { name = "Honor-NixOS"
      ; inherit system
      ; }

      { name = "Ernmore-NixOS"
      ; inherit system
      ; }
    ];
  in {
    nixosConfigurations = builtins.listToAttrs (builtins.map (system: {
      name = system.name;
      value = nixpkgs.lib.nixosSystem {
        system = system.system;
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/${system.name}
          # nix-ld.nixosModules.nix-ld
          # { programs.nix-ld.enable = true; }
        ] ++ homeModule;
      };
    }) systems);
  };
}
