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
}
