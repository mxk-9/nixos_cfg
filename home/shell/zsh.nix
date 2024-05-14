{
	programs.zsh = {
		enable = true;
		enableCompletion = true;
		defaultKeymap = "emacs";
		syntaxHighlighting.enable = true;
		oh-my-zsh = {
			enable = true;
			plugins = [
				"git"
			];
			theme = "fox";
		};
		initExtra = ''
			export PATH=$PATH:$HOME/.local/bin:$HOME/.cargo/bin
		'';

		shellGlobalAliases = {
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

			# U = "ud -u";
			# M = "ud -m";
			#
			# U1 = "ud -u --block_device /dev/sda1";
			# M1 = "ud -m --block_device /dev/sda1";

			e = "nvim";
			es = "nvim -s";
			ez = "es Session.vim";
			rsync = "rsync -r --info=progress2 --info=name0";
		};
	};
}
