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
in {
  home.packages = [
    touchpadToggle
    toggleBluetooth
    lockerCommand
    toggleNetwork
  ];
}
