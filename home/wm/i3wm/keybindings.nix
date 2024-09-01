{ lib, ... }:
let
  M  = "Mod4";
  M1 = "Mod1";
  S  = "Shift";
  C  = "Ctrl";

  MF  = "${M}+F";
  MS  = "${M}+${S}";
  MC  = "${M}+${C}";
  MSC = "${M}+${S}+${C}";
  MM1 = "${M}+${M1}";
  MMF = "${MM1}+F";
in {
  imports = [ ./scripts.nix ];
  xsession.windowManager.i3.config = {
    keybindings = lib.mkOptionDefault {
      # Scripts
      "${MS}+e" = "exec logout_rofi.sh";
      "${M}+x"  = "exec touchpad_toggle";
      "${MS}+x" = "exec xsetwacom --set 'Wacom One by Wacom M Pen stylus' MapToOutput next";
      "${MS}+p" = "exec power_menu_rofi.sh";
      "${M}+d"  = "exec monitor_rofi.sh";
      "${M}+b"  = "exec bluetooth_toggle";
      "${M}+n"  = "exec network_toggle on";
      "${MS}+n" = "exec network_toggle off";

      # Apps
      "${M}+p"       = "exec rofi -show drun";
      "${M}+s"       = "exec screenshoter.sh window"; 
      "${MS}+s"      = "exec screenshoter.sh area"; 
      "${MC}+s"      = "exec screenshoter.sh full"; 
      "${C}+${M1}+l" = "exec locker_command";
      "${MS}+d"      = "exec rofi -show window";
      "${M}+Return"  = "exec kitty";

      "${MF}1"  = "exec firefox";
      # "${MF}1"  = "exec firefox -P sny";
      # "${MMF}1" = "exec firefox -P work";
      # "${MMF}1" = "exec qutebrowser";
      "${MF}2"  = "exec pavucontrol";
      "${MMF}2" = "exec blueman-manager";
      "${MF}3"  = "exec telegram-desktop";
      "${MF}4"  = "exec gimp";
      "${MMF}4" = "exec blender";

      # Brightness
      "XF86MonBrightnessUp"   = "exec light -A 2";
      "XF86MonBrightnessDown" = "exec light -U 2";

      # Volume
      "XF86AudioRaiseVolume" = "exec dunst_volume up";
      "XF86AudioLowerVolume" = "exec dunst_volume down";
      "XF86AudioMute"        = "exec dunst_volume mute";
      "${MM1}+F12" = "exec dunst_volume up";
      "${MM1}+F11" = "exec dunst_volume down";

      # Media control
      "XF86AudioPlay" = "exec playerctl play-pause";
      "${MF}10"       = "exec playerctl play-pause";
      "${MS}+F10"     = "exec playerctl -a pause";
      "${MC}+F10"     = "exec playerctl -a play-pause";
      "${MF}11"       = "exec playerctl previous";
      "${MF}12"       = "exec playerctl next";

      # Focus
      "${M}+h" = "focus left";
      "${M}+j" = "focus down";
      "${M}+k" = "focus up";
      "${M}+l" = "focus right";

      "${M}+a"  = "focus parent";
      "${MS}+a" = "focus child";

      # Split current object
      "${MS}+minus" = "splitv";
      "${M}+minus"  = "splith";

      # Move
      "${MS}+h" = "move left";
      "${MS}+j" = "move down";
      "${MS}+k" = "move up";
      "${MS}+l" = "move right";

      # Multi monitor setup
      "${MSC}+h" = "move workspace to output right";
      "${MSC}+j" = "move workspace to output down";
      "${MSC}+k" = "move workspace to output up";
      "${MSC}+l" = "move workspace to output left";
    };

    # Resizing
    modes = {
      resize = {
        "h" = "resize shrink width  25px";
        "j" = "resize grow   height 25px";
        "k" = "resize shrink height 25px";
        "l" = "resize grow   width  25px";

        "${S}+h" = "resize shrink width  35px";
        "${S}+j" = "resize grow   height 35px";
        "${S}+k" = "resize shrink height 35px";
        "${S}+l" = "resize grow   width  35px";

        "${C}+h" = "resize shrink width  60px";
        "${C}+j" = "resize grow   height 60px";
        "${C}+k" = "resize shrink height 60px";
        "${C}+l" = "resize grow   width  60px";

        "Return" = "mode default";
        "Escape" = "mode default";
      };
    };

    # Moving floating window
  };
}
