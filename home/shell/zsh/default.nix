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

    localVariables = {
      MEDIA = "/run/media/sny";
      VENTOY = "/run/media/sny/Ventoy";
      BOOKS = "/home/sny/Documents/Library";
    };

    initExtra = ''
      ${builtins.readFile ./tm.zsh}
      ${builtins.readFile ./ud.zsh}
      ${builtins.readFile ./funcs.zsh}
    '';

    loginExtra = ''
      if [[ $(pgrep -x "X") == "" ]]; then
        rm .zsh_history
        startx
      fi
    '';

    shellGlobalAliases = {
      l = "ls";

      mk = "mkdir -p";

      mpvn = "mpv --no-video";
      mpvf = "mpv --fullscreen";

      gv = "gwenview";

      ds = "doas";

      d = "dragon -a -x";

      nfu = "doas nix flake update /home/sny/nixos-cfg";
      nri = "doas nixos-rebuild switch --flake /home/sny/nixos-cfg --impure";
      nr = "doas nixos-rebuild switch --flake /home/sny/nixos-cfg";
      nd = "nix develop";
      ndb = "nix develop --command build.sh";
      ndc = "nix develop --command";
      ndd = "nix develop --command debug.sh";
      nde = "nix develop --command nvim -S Session.vim";

      e = "nvim";
      es = "nvim -S";
      ez = "nvim -S Session.vim";
      rsync = "rsync -r --info=progress2 --info=name0";

      chmo = "chmod 754 -Rv";
      chmoff = "chmod 000 -Rv";
    };
  };
}
