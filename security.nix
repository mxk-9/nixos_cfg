let
  doas_setup = {
    security = {
      doas = {
        enable = true;
        extraRules = [
          { users = [ "sny" ]
          ; keepEnv = true
          ; persist = true
          ;}

          { users = [ "sny" ]
          ; runAs = "root"
          ; noPass = true
          ; cmd = "hdparm"
          ;}

          { users = [ "sny" ]
          ; runAs = "root"
          ; noPass = true
          ; cmd = "nixos-rebuild"
          ;}
        ];
      };
      sudo.enable = false;
    };
  };
in {
  imports = [
    doas_setup
  ];
}
