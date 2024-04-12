{ ... }:
{
	home-manager = {
		useGlobalPkgs = true;
		useUserPackages = true;
		users.sny = {
			home = {
				stateVersion = "23.11";
				sessionVariables = {
					EDITOR = "nvim";
				};

				file.".config/kitty/kitty.conf" = {
					source = ./cfg-files/kitty.conf;
					recursive = true;
				};
			};

			imports = [
				./shell
				./themes.nix
				./packages
				./wm
			];
		};
	};
}
