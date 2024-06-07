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
  in {
    nixosConfigurations.Honor-NixOS = nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = { inherit inputs; };
      modules = [
        ./configuration.nix
        home-manager.nixosModules.home-manager {
          imports = [ ./home ];
          home-manager.extraSpecialArgs = { inherit inputs; };
        }
        ./hosts/Honor-NixOS
      ];
    };

    nixosConfigurations.Ernmore-NixOS = nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = { inherit inputs; };
      modules = [
        ./configuration.nix
        home-manager.nixosModules.home-manager { imports = [ ./home ]; }
        ./hosts/Ernmore-NixOS
      ];
    };
  };
}
