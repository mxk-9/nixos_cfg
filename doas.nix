{
  security = {
    doas = {
  	  enable = true;
  	  extraRules = [{
  	    users = [ "sny" ];
  	    keepEnv = true;
  	    persist = true;
  	  }];
  	};
    sudo.enable = false;
  };
}
