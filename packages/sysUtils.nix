{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    pciutils
    desktop-file-utils
    psmisc
    hdparm
    # gparted
    inxi
  ];
}
