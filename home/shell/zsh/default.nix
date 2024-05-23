{
	programs.zsh = {
		enable = true;
		enableCompletion = true;
		defaultKeymap = "emacs";
		syntaxHighlighting.enable = true;
		autosuggestion = {
			enable = true;
			highlight = "fg=#ff0ff,bg=cyan,bold,underline";
		};
		oh-my-zsh = {
			enable = true;
			plugins = [
				"git"
			];
			theme = "fox";
		};
		initExtra = ''
			export PATH=$PATH:$HOME/.local/bin
			${builtins.readFile ./tm.zsh}
			${builtins.readFile ./ud.zsh}
		'';

		loginExtra = ''
			if [[ $(pgrep -x "X") == "" ]]; then
				startx
				exit
			fi
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

			e = "nvim";
			es = "nvim -S";
			ez = "nvim -S Session.vim";
			rsync = "rsync -r --info=progress2 --info=name0";
		};
	};
}
