{ pkgs, ... }:
let
  touchpadToggle = pkgs.writeShellScriptBin "touchpad_toggle" ''
    touchpad_id=$(xinput list | grep -i touchpad | cut -d '=' -f 2 | cut -d '[' -f 1)
    status=$(xinput list-props $touchpad_id | grep 'Device Enabled' | cut -d ':' -f 2)
    status=$(((1 + $status) % 2))

    xinput set-prop $touchpad_id 'Device Enabled' $status
  '';

  toggleBluetooth = pkgs.writeShellScriptBin "bluetooth_toggle" ''
    get_blctl_state() {
    	echo $(bluetoothctl show | grep Powered | cut -f 2 -d ':')
    }
    
    if [[ $(get_blctl_state) == "no" ]]; then
    	rfkill unblock bluetooth
    	bluetoothctl power on
    else
    	bluetoothctl power off
    	rfkill block bluetooth
    fi
  '';

  toggleNetwork = pkgs.writeShellScriptBin "network_toggle" ''
    case $1 in
      "off")
        nmcli networking off
        rfkill block wlan
      ;;

      "on")
        rfkill unblock wlan
        nmcli networking on
      ;;
    esac
  '';

  lockerCommand = pkgs.writeShellScriptBin "locker_command" ''
    font="JetBrains Mono"
    i3lock \
    --color=000000 \
    --radius 300 \
    --ring-width=15 \
    --keylayout 0 \
    --time-color=ffffffff \
    --time-font="$font" \
    --time-size=48 \
    --date-color=ffffffff \
    --date-font="$font" \
    --date-size=30 \
    --layout-color=ffffffff \
    --layout-font="$font" \
    --layout-size=24 \
    --greeter-color=ffffffff \
    --greeter-font="$font" \
    --wrong-font="$font" \
    --verif-font="$font" \
    --greeter-size=34 \
    --wrong-size=34 \
    --verif-size=34 \
  '';

  screenShoting = pkgs.writeShellScriptBin "screenshoter.sh" ''
    fileType=png
    fileName=$(date +%Y-%m-%d_%H-%M-%S).$fileType
    pathToDir=$HOME/Pictures/TemporaryScreens
    screenCreated=false

    if ! [[ -d $pathToDir ]]; then
      mkdir -p $pathToDir
    fi

    case $1 in
      "area")
        maim -s $pathToDir/$fileName
      ;;

      "window")
        maim -i $(xdotool getactivewindow) $pathToDir/$fileName
      ;;

      "full")
        maim $pathToDir/$fileName
      ;;
    esac

    ls $pathToDir/$fileName 2> /dev/null
    if [ $? -eq 0 ]; then
      screenCreated=true
      cat $pathToDir/$fileName | xclip -sel clip -t image/png
    fi

    if $screenCreated; then
      dunstify -u normal -t 500 "Screenshot saved"
    fi
  '';

  changeWM = let
    script = pkgs.writeShellScriptBin "change_kwin_i3wm.sh" ''
      kquitapp5 plasmashell
      wait $!
      qdbus org.kde.kglobalaccel /kglobalaccel blockGlobalShortcuts true
      wait $!
      i3 --replace &
    '';
  in {
    home.packages = [ script ];

    xdg.desktopEntries = {
      i3wm = {
        name = "i3wm";
        genericName = "Cool Window Manager";
        exec = "change_kwin_i3wm.sh";
        terminal = true;
        type = "Application";
        icon = ./i3wm.png;
      };
    };
  };
in {
  home.packages = [
    touchpadToggle
    toggleBluetooth
    lockerCommand
    toggleNetwork
    screenShoting
  ];

  # imports = [
  #   changeWM
  # ];
}
