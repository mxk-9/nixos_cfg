{ pkgs, ... }: let
  logoutRofi = pkgs.writeShellScriptBin "logout_rofi.sh" ''
    alias clear_history="rm /home/sny/.zsh_history";
    item=$(echo "suspend
    logout
    poweroff
    reboot" | rofi -dmenu)
    # kwin_x11" | rofi -dmenu)

    case $item in
      "suspend") locker_command | systemctl suspend ;;
      "logout")
        clear_history
        i3-msg exit
      ;;
      "poweroff")
        clear_history
        poweroff
      ;;
      "reboot")
        clear_history
        reboot
      ;;
      "kwin_x11")
        plkill i3
        wait $!
        kstart5 plasmashell
        wait $!
        kwin_x11 --replace &
        qdbus org.kde.kglobalaccel /kglobalaccel blockGlobalShortcuts false
        pkill .dunst-wrapped
      ;;
    esac
  '';

  powerMenuRofi = pkgs.writeShellScriptBin "power_menu_rofi.sh" ''
    item=$(echo "balanced
    power saver" | rofi -dmenu)

    case $item in
      "balanced") powerprofilesctl set balanced ;;
      "power saver") powerprofilesctl set power-saver ;;
    esac
  '';

  monitorRofi = pkgs.writeShellScriptBin "monitor_rofi.sh" ''
    item=$(echo "mirror
    to right
    to left
    external
    internal
    no vsync
    vsync" | rofi -dmenu)

    case $item in
      "mirror") xrandr --output HDMI1 --auto --same-as eDP1 ;;
      "to right") xrandr --output HDMI1 --auto --right-of eDP1 --output eDP1 --auto ;;
      "to left") xrandr --output HDMI1 --auto --left-of eDP1 --output eDP1 --auto ;;
      "external") xrandr --output HDMI1 --auto --output eDP1 --off ;;
      "internal") xrandr --output eDP1 --auto --output HDMI1 --off ;;
      "no vsync") pkill picom ;;
      "vsync") picom --vsync & ;;
    esac

    pkill warpd
    wait $!
    warpd
  '';
in {
  programs.rofi = {
    enable = true;
    extraConfig = {
      modi = "drun,window";
      font = "JetBrains Mono 15";
      icon-theme = "Dracula";
      show-icons = true;
    };
    theme = "${pkgs.rofi}/share/rofi/themes/android_notification.rasi";
  };

  home.packages = [
    logoutRofi
    powerMenuRofi
    monitorRofi
  ];
}
