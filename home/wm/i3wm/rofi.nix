{ pkgs, ... }: let
  logoutRofi = pkgs.writeShellScriptBin "logout_rofi.sh" ''
    item=$(echo "suspend
    logout
    poweroff
    reboot" | rofi -dmenu)

    case $item in
      "suspend") locker_command | systemctl suspend ;;
      "logout") i3-msg exit ;;
      "poweroff") poweroff ;;
      "reboot") reboot ;;
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
    expand to right
    kill picom
    start picom" | rofi -dmenu)

    case $item in
      "mirror") xrandr --output HDMI1 --auto --same-as eDP1 ;;
      "expand to right") xrandr --output HDMI1 --auto --right-of eDP1 ;;
      "kill picom") pkill picom ;;
      "start picom") picom --vsync & ;;
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
      font = "JetBrains Mono 12";
      icon-theme = "Dracula";
      show-icons = true;
    };
    theme = "${pkgs.rofi}/share/rofi/themes/Arc-Dark.rasi";
  };

  home.packages = [
    logoutRofi
    powerMenuRofi
    monitorRofi
  ];
}
