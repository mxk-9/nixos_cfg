{
  description = ''
  Sny Spyper's NixOS config.
  '';
  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = {
    self
    , nixpkgs
    , home-manager
    , ...
  }@inputs: {
    nixosConfigurations.Honor-NixOS = nixpkgs.lib.nixosSystem {
    # nixosConfigurations.Ernmore-NixOS = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs.inputs = inputs;
      modules = [
        ./configuration.nix
        home-manager.nixosModules.home-manager {
          imports = [./home];
        }
		./hosts/Honor-NixOS
		# ./hosts/Ernmore-NixOS
      ];
    };
  };
}
