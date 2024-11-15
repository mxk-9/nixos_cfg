{ pkgs, ... }:
let
  cutYoutubeVideo = pkgs.writeShellScriptBin "cut_yt" ''
    PATH=$PATH:${pkgs.ffmpeg_7-full}/bin:${pkgs.python312Packages.yt-dlp}/bin
    if [ ''${#@} -eq 0 ]; then
      echo "cut_yt <from> <to> <link>"
      exit
    fi

    yt-dlp --external-downloader ffmpeg --external-downloader-args "ffmpeg_i: -ss $1 -to $2" $3
  '';

  ffmpegReduceQuality = pkgs.writeShellScriptBin "ffreq" ''
    PATH=$PATH:${pkgs.ffmpeg_7-full}/bin
    if [ ''${#@} -eq 0 ]; then
      echo "ffreq <input_filename> <output_filename>"
      exit
    fi

    ffmpeg -i $1 -crf 35 -vcodec libx265 -vf fps=25,scale=-1:720 -ac 1 -c:a aac -b:a 96k $2
  '';

  screenRecord = pkgs.writeShellScriptBin "ffscrec" ''
    PATH=$PATH:${pkgs.ffmpeg_7-full}/bin

    FNAME=$(date +%Y_%m_%d-%H_%M_%S).mp4
    VSIZE="1920x1080"
    RATE="25"

    # Implement audio capture via pipewire
    # pulseaudio:
    # -f -ac 2 -i default # seems capture's default SINK
    # pipewire

    ffmpeg -video_size $VSIZE -framerate $RATE -f x11grab -i :0.0+0,0 $FNAME
  '';
in {
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
      SNYBACKUP = "/run/media/sny/SNYBACKUP";
      VENTOY = "/run/media/sny/Ventoy";
      BOOKS = "/home/sny/Documents/Library";
      NIXCFG = "/home/sny/nixos-cfg";
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
      flake_lock = "cp -v /home/sny/nixos-cfg/flake.lock";
  
      gv = "gwenview";
  
      ds = "doas";
  
      d = "dragon -a -x";
  
      nori = "doas nixos-rebuild switch --flake /home/sny/nixos-cfg --impure";
      noru = "nix flake update /home/sny/nixos-cfg && doas nixos-rebuild switch --flake /home/sny/nixos-cfg --upgrade";
      nor = "doas nixos-rebuild switch --flake /home/sny/nixos-cfg";
  
      nd = "nix develop";
      ndc = "nix develop --command";
      ndce = "nix develop --command emacs &";
      nb = "nix build";
      nde = "nix develop --command nvim -S Session.vim";
      nr = "nix run";
  
      e = "nvim";
      es = "nvim -S";
      ez = "nvim -S Session.vim";
      rsync = "rsync -r --info=progress2 --info=name0";
  
      chmo = "chmod 754 -Rv";
      chmoff = "chmod 000 -Rv";
    };
  };
  # Extra shell scripts
  home.packages = [
    cutYoutubeVideo
    ffmpegReduceQuality
    screenRecord
  ];
}
