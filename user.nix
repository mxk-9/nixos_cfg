{ pkgs, ... }:
{
  users.extraUsers.sny = {
    isNormalUser = true;
    home = "/home/sny";
    description = "Sny Spyper";
    extraGroups = [ "video" "audio" "networkmanager" "disk" ];
    shell = pkgs.nushell;
  };
}
