{
	programs.i3status = {
		enable = true;

		general = {
			colors = true;
			interval = 5;
		};

		modules = {
			"ipv6".enable = false;
			"ethernet _first_".enable = false;
			"disk /".enable = false;
			"load".enable = false;
			"memory".enable = false;

			"wireless _first_" = {
				settings = {
					format_up = "W: (%quality, %bitrate)";
					format_down = "W: down";
				};
			};
		};
	};
}
