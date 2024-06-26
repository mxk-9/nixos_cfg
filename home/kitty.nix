{ pkgs, ... }:{
  programs.kitty = {
    enable = true;
    font = {
      package = pkgs.jetbrains-mono;
      name = "JetBrains Mono";
      size = 15.0;
    };
    settings = {
      "copy_on_select" = "clipboard";
      "repaint_delay" = 10;
      "sync_to_monitor" = "yes";
      "enable_audio_bell" = "no";
      "background_opacity" = 1;
      "term" = "xterm-kitty";
    };
  };
}
