{
  description = "Sny Spyper's NixOS config.";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-ld = {
      url = "github:Mic92/nix-ld";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions/83a5049cfc2e37d9ef5b540aa01c0e5cc1e2a00f?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = {
    nixpkgs
    , home-manager
    , nix-ld
    , ...
  }@inputs: let
    system = "x86_64-linux";

    homeModule = [
      home-manager.nixosModules.home-manager {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          backupFileExtension = "backup";
        };
        imports = [ ./home/sny.nix ];
        home-manager.extraSpecialArgs = { inherit inputs; };
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

          nix-ld.nixosModules.nix-ld
          # { programs.nix-ld.enable = true; }
        ] ++ homeModule;
      };
    }) systems);
  };
}
