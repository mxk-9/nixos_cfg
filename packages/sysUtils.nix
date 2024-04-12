{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    pciutils
    nix-index
    patchelf
    desktop-file-utils
    psmisc
    hdparm
    # gparted
    inxi
  ];
}
