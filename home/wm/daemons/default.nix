{ pkgs, ... }: let
  autoScreedD = pkgs.writeShellScriptBin "autoscreend.sh" ''${builtins.readFile ./autoscreend.sh}'';
  powerSaverD = pkgs.writeShellScriptBin "powersaverd.sh" ''${builtins.readFile ./powersaverd.sh}'';
in {
  home.packages = [
    autoScreedD
    powerSaverD
  ];  
}
