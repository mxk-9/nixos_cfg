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
      catppuccin # theme

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
