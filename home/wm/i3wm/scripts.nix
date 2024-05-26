{ pkgs, ... }:
let
	logoutWindow = pkgs.writeShellScriptBin "logout_window" ''
		cmd=${pkgs.i3}/bin/i3-nagbar
		$cmd -m Logout \
		-t warning \
		-B Logout 'i3-msg exit' \
		-B Poweroff 'systemctl poweroff' \
		-B Reboot 'systemctl reboot' \
		-B Suspend 'locker_command | systemctl suspend; kill -9 $(pidof i3-nagbar)' \
	'';

	touchpadToggle = pkgs.writeShellScriptBin "touchpad_toggle" ''
		touchpad_id=$(xinput list | grep -i touchpad | cut -d '=' -f 2 | cut -d '[' -f 1)
		status=$(xinput list-props $touchpad_id | grep 'Device Enabled' | cut -d ':' -f 2)
		status=$(((1 + $status) % 2))

		xinput set-prop $touchpad_id 'Device Enabled' $status
	'';

	powerProfiles = pkgs.writeShellScriptBin "power_profile_select" ''
		cmd=${pkgs.i3}/bin/i3-nagbar
		$cmd -m 'Select power profile' \
		-t warning \
		-B 'Power saver' 'powerprofilesctl set power-saver; kill -9 $(pidof i3-nagbar)' \
		-B Balanced 'powerprofilesctl set balanced; kill -9 $(pidof i3-nagbar)' \
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

	monitorSetup = pkgs.writeShellScriptBin "monitor_setup" ''
		cmd=${pkgs.i3}/bin/i3-nagbar

		$cmd -m "Monitor setup" \
		-t warning \
		-B 'Expand to the right' 'xrandr --output HDMI1 --auto --right-of eDP1; kill -9 $(pidof i3-nagbar)' \
		-B Mirror 'xrandr --output HDMI1 --auto --same-as eDP1; kill -9 $(pidof i3-nagbar)' \

		killall warpd
		wait $!
		warpd
	'';
in {
	home.packages = [
		logoutWindow
		touchpadToggle
		powerProfiles
		lockerCommand
		monitorSetup
	];
}
