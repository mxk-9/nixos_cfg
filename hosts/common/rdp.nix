{ pkgs, ... }: {
  environment.systemPackages = [ pkgs.freerdp ];

  security.pki.certificates = [
    "${builtins.readFile /home/sny/.local/certs/sl_i.crt}"
    "${builtins.readFile /home/sny/.local/certs/sl_r.crt}"
  ];

  home-manager.users.sny.xdg.desktopEntries.rdp_win = {
    name = "RDP Windows";
    genericName = "Work";
    type = "Application";
    exec = "${pkgs.kitty}/bin/kitty /home/sny/sandbox/work_sandbox/launch.sh";
    icon = ./freerdp.png;
    categories = [ "Office" ];
  };
}
