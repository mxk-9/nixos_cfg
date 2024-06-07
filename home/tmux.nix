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
    terminal = "tmux-256color";

    plugins = with pkgs.tmuxPlugins; [
      onedark-theme

      extrakto
      prefix-highlight

      { plugin = pain-control
      ; extraConfig = ''
        set-option -g @pane_resize "2"
      ''
      ;}
    ];
  };
}
