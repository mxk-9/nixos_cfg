{ pkgs, ...}:
{
	programs = {
		nushell = {
			enable = true;
			shellAliases = {
				l = "ls";
				la = "ls -a";

				df = "df -h";

				mk = "mkdir";

				mpvn = "mpv --no-video";
				mpvf = "mpv --fullscreen";

				ds = "doas";

				d = "dragon -a -x";

				nfu = "doas nix flake update /home/sny/nixos-cfg";
				nri = "doas nixos-rebuild switch --flake /home/sny/nixos-cfg --impure"; # for nix-ld
				nr = "doas nixos-rebuild switch --flake /home/sny/nixos-cfg";
				nd = "nix develop";

				udu = "ud -u";
				udm = "ud -m";

				cal = "cal --week-start mo";

				ez = "es Session.vim";
			};

			configFile.source = ./config.nu;
			envFile.source = ./env.nu;
			loginFile.source = ./login.nu;
			extraConfig = ''
				${builtins.readFile ./tm_mess.nu}
			'';
		};

		starship = {
			enable = true;
			enableNushellIntegration = true;
			settings = {
				add_newline = true;
				character = {
					success_symbol = "[➜](bold green)";
					error_symbol = "[➜](bold red)";
				};
			};
		};
	};

	home.packages = with pkgs; [
		pueue
	];
}
