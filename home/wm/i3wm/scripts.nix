{ pkgs, ... }:
let
  touchpadToggle = pkgs.writeShellScriptBin "touchpad_toggle" ''
    touchpad_id=$(xinput list | grep -i touchpad | cut -d '=' -f 2 | cut -d '[' -f 1)
    status=$(xinput list-props $touchpad_id | grep 'Device Enabled' | cut -d ':' -f 2)
    status=$(((1 + $status) % 2))

    xinput set-prop $touchpad_id 'Device Enabled' $status
  '';

  lockerCommand = pkgs.writeShellScriptBin "locker_command" ''
    # --color=282a36 \
    i3lock \
    --color=000000 \
    --radius 100 \
    --ring-width=10 \
    --keylayout 0 \
    --time-color=ffffffff \
    --date-color=ffffffff \
    --layout-color=ffffffff \
    --greeter-color=ffffffff
  '';
in {
  home.packages = [
    touchpadToggle
    lockerCommand
  ];
}
