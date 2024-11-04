{ pkgs, pkgs-unstable, lib, ... }: let
  editor_base = with pkgs-unstable; [
    nixd
    nixdoc
  ];

  emacs_cfg = {
    home.file = let
      # emacs_src = pkgs.fetchFromGitHub {
      #   owner = "mxk-9";
      #   repo = "emacs_cfg";
      #   rev = "cd348dd";
      #   sha256 = "Zfifu3zOXTztJD5Kel/5juyPLC3pnqg3TvtCMRdh+X8=";
      # };
      emacs_src = "/home/sny/sandbox/emacs_cfg";
    in {
      emacs = {
        enable = true;
        target = ".emacs";
        source = emacs_src + "/emacs.el";
      };

      emacs_custom_el = {
        enable = true;
        target = ".emacs.custom.el";
        source = emacs_src + "/emacs.custom.el";
      };
    };

    home.packages = (with pkgs; [
      emacs-gtk
      emacs-all-the-icons-fonts
      python3
      ghostscript # For doc view
    ]) ++ editor_base;
  };
  
  nvim = {
    programs.neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;
    };
  
    xdg.configFile.nvim = {
      source = pkgs.fetchFromGitHub {
        owner = "mxk-9";
        repo = "nvim";
        rev = "37e565a";
        sha256 = "8f4p04D/Yy4mxy6AXftnQgDE8gdEmykYH8SWvA4a1J8=";
        # sha256 = lib.fakeSha256;
      };
    };
  
    home.packages = (with pkgs-unstable; [
      ripgrep
      jsonnet-language-server
      lua-language-server
      lua51Packages.lua-lsp
      lua
    ]) ++ editor_base;
  };
  
  helix = {
    programs.helix = {
      enable = true;
      extraPackages = with pkgs; [ dprint nil ];
      languages = {
        language = [
          { name = "markdown"
          ; formatter = {
            command = "dprint";
            args = [ "fmt" "--stding" "md" ];
            }
          ;}
    
          { name = "cpp"
          ; auto-format = false
          ; file-types = [ "cpp" "h" "hpp" "cxx" ]
          ; language-servers = [ "clangd" ]
          ; indent = { tab-width = 2; unit = "  ";}
          ;}
    
          { name = "lua"
          ; indent = { tab-width = 4; unit = "    "; }
          ;}
        ];
      };
    
      settings = {
        theme = "bogster";
        keys.normal = {
          backspace = { t = ":lsp-restart"; s = ":lsp-stop"; };
          F1 = {
            n = ":set soft-wrap.enable false";
            N = ":set soft-wrap.enable true";
            t = ":set smart-tab.enable false";
            T = ":set smart-tab.enable true";
          };
    
          F2 = {
            b = ":buffer-close";
            B = ":buffer-close!";
            a = ":buffer-close-all";
            A = ":buffer-close-all!";
          };
    
          esc = [ "collapse_selection" "keep_primary_selection" ];
        };
    
        editor = {
          scrolloff = 1;
          scroll-lines = 5;
          shell = [ "zsh" "-c" ];
          soft-wrap.enable = true;
          bufferline = "multiple";
          line-number= "relative";
          cursorline = true;
    
          cursor-shape = {
            insert = "bar";
            select = "underline";
          };
    
          lsp = {
            display-messages = true;
          };
        };
      };
    };
  };
  office = {
    home.packages = with pkgs; [
      zathura
      keepassxc
      # libreoffice-qt
    ];
  };

  net = {
    home.packages = with pkgs; [
      telegram-desktop
      qbittorrent
      vesktop
      firefox
    ];
  };

  gfxVid = {
    home.packages = with pkgs; [
      krita
      kdenlive
      blender
      gwenview
      ffmpeg_7-full
      obs-studio
    ];
  };

  media = {
    home.packages = (with pkgs; [
      playerctl
      songrec
    ]) ++ (with pkgs-unstable; [
      yt-dlp
    ]);
  };

  kitty = {
    programs.kitty = {
      enable = true;
      font = {
        package = pkgs.jetbrains-mono;
        name = "JetBrains Mono";
        size = 14.0;
      };
      settings = {
        "copy_on_select" = "clipboard";
        "repaint_delay" = 10;
        "sync_to_monitor" = "yes";
        "enable_audio_bell" = "no";
        "background_opacity" = "0.70";
        "term" = "xterm-kitty";
      };
    };
  };

  tmux = {
    programs.tmux = {
      enable = true;
      baseIndex = 1;
      prefix = "C-q";
      clock24 = true;
      customPaneNavigationAndResize = true;
      escapeTime = 50;
      keyMode = "vi";
      mouse = true;
      resizeAmount = 1;
      terminal = "screen-256color";
    
      # i3wm plugin(i dunno) tilish
      plugins = with pkgs.tmuxPlugins; [
        onedark-theme
    
        prefix-highlight
    
        { plugin = pain-control
        ; extraConfig = ''
          set-option -g @pane_resize "1"
        '';}
    
        { plugin = continuum
        ; extraConfig = ''
          set -g @continuum-restore 'on'
          set -g @continuum-save-interval '60' # minutes
        '';}
      ];
    };
  };

in {
  imports = [
    ./games.nix
    gfxVid
    media
    net
    office
    emacs_cfg
    nvim
    # helix
    kitty
    tmux
  ];
}
