{ pkgs, ... }: {
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    prefix = "C-q";
    clock24 = true;
    customPaneNavigationAndResize = true;
    escapeTime = 50;
    keyMode = "vi";
    mouse = true;
    resizeAmount = 2;
    terminal = "screen-256color";

    plugins = with pkgs.tmuxPlugins; [
      # onedark-theme # theme
      catppuccin # theme

      { plugin = continuum
      ; extraConfig = ''
        set -g @continuum-restore 'on'
        set -g @continuum-save-interval '15' # minutes
      ''
      ;}

      { plugin = resurrect
      ; extraConfig = "set -g @resurrect-strategy-nvim 'session'"
      ;}

      { plugin = pain-control
      ; extraConfig = ''
        set-option -g @pane_resize "10"
      ''
      ;}

      extrakto
      
      prefix-highlight
    ];
  };
}
