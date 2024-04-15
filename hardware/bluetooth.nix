{ pkgs, ... }:
{
	hardware.bluetooth = {
		enable = true;
		powerOnBoot = false;
		settings = {
			General = {
				Enable = "Source,Sink,Media,Socket";
				Experimental = true;
			};
		};
	};

	systemd.packages = [ pkgs.blueman ];
	services.dbus = {
		enable = true;
		packages = [ pkgs.blueman ];
	};
}
