{ pkgs, ... }:
let
	ssh_cfg = {
		services.openssh = {
			enable = true;
			allowSFTP = true;
			settings.PasswordAuthentication = true;
		};

		environment.systemPackages = with pkgs ; [
			sshfs
			sshfs-fuse
		];
	};
in {
	networking.networkmanager.enable = true;

	# Set your time zone.
	time.timeZone = "Europe/Moscow";

	# Some programs need SUID wrappers, can be configured further or are
	# started in user sessions.
	programs.mtr.enable = true;
	programs.gnupg.agent = {
		enable = true;
		enableSSHSupport = true;
	};

	imports = [
		ssh_cfg
	];

	# Open ports in the firewall.
	networking.firewall = {
		allowedTCPPorts = [ 34925 25565 7777 30000 22 ];
		allowedUDPPorts = [ 34925 25565 7777 30000 22 ];
	};
}
