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

		# firefox-addons = {
		# 	url = "gitlab:rycee/nur-expressions/83a5049cfc2e37d9ef5b540aa01c0e5cc1e2a00f?dir=pkgs/firefox-addons";
		# 	inputs.nixpkgs.follows = "nixpkgs";
		# };
		
	};
	outputs = {
		self
		, nixpkgs
		, home-manager
		, ...
	}@inputs: let
		hostname = "Honor-NixOS";
		# hostname = "Ernmore-NixOS";
		system = "x86_64-linux";
		pkgs = nixpkgs.legacyPackages.${system};
	in {
		nixosConfigurations.${hostname} = nixpkgs.lib.nixosSystem {
			inherit system;
			specialArgs.inputs = inputs;
			modules = [
				./configuration.nix
				home-manager.nixosModules.home-manager { imports = [ ./home ]; }
				./hosts/${hostname}
			];
		};
	};
}
