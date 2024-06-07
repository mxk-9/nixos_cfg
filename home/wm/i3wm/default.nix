{ config, lib, pkgs, ... }:
let
  M  = "Mod4";
in {
  xsession.windowManager.i3 = {
    enable = true;
    config = {
      modifier = M;

      fonts = {
        names = ["JetBrains Mono"];
        # size = 10.5;
        size = 15.0;
      };

      bars = [{
        position = "top";
        fonts = {
          names = [ "JetBrains Mono" ];
          size = 15.0;
          # size = 11.0;
        };
        statusCommand = "i3status";
        colors = {
          activeWorkspace = {
            background = "#282a36";
            border = "#282a36";
            text = "#ffffff";
          };

          focusedWorkspace = {
            background = "#44475a";
            border = "#282a36";
            text = "#ffffff";
          };
        };
      }];

      window.border = 2;
    };

    extraConfig = ''
      # Autostart
      exec_always nm-applet
      exec_always blueman-applet
      exec_always keepassxc
      exec_always unclutter --timeout 1 --jitter 5 --ignore-scrolling

      exec_always autoscreend.sh restart
      exec_always powersaverd.sh restart

      exec dunst
    '';
  };

  imports = [
    ./keybindings.nix
    ./i3status.nix
    ./rofi.nix
    ./dunst.nix
    ./floating.nix
    ./colors.nix
    ./daemons
  ];
}
