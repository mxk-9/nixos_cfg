{ ... }:
{
	home-manager = {
		useGlobalPkgs = true;
		useUserPackages = true;
		users.sny = {
			home = {
				stateVersion = "23.11";

				file.".config/kitty/kitty.conf" = {
					source = ./cfg-files/kitty.conf;
					recursive = true;
				};
			};

			xdg.configFile.nvim.source = ./nvim;
			imports = [
				./shell
				./themes.nix
				# ./nvim
				./packages
				./wm
			];
		};
	};
}
