{ pkgs, ... }:
let
  M  = "Mod4";
in {
  home = {
    file.".xinitrc".text = ''
      exec dbus-launch --exit-with-session --sh-syntax i3
    '';

    packages = with pkgs; [
      i3lock-color
    ];
  };

  xsession.windowManager.i3 = {
    enable = true;
    config = {
      modifier = M;

      fonts = {
        names = ["JetBrains Mono"];
        size = 15.0;
      };

      bars = [{
        position = "top";
        fonts = {
          names = [ "JetBrains Mono" ];
          size = 15.0;
        };
        statusCommand = "i3status";
        # statusCommand = "i3blocks";
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

      exec_always xsetroot -solid "#000000"

      exec dunst
    '';
  };

  imports = let
    tmpBar = ./i3status.nix;
    # tmpBar = ./i3blocks.nix;
  in [
    ./keybindings.nix
    tmpBar
    ./rofi.nix
    ./dunst.nix
    ./floating.nix
    ./colors.nix
  ];
}
