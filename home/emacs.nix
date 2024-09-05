{ pkgs, ... }:{
  home.packages = with pkgs; [
    emacs
    nixd
    nixdoc
  ];

  home.file.emacs = {
    enable = true;
    target = ".emacs";
    source = pkgs.fetchFromGitHub {
      owner = "mxk-9";
      repo = "emacs_cfg";
      rev = "0c7fe5d";
      sha256 = "BCpYgna1dtKVfCiefeP1jFWL6qaoDfYVWLkYi6MHGUw=";
    } + "/emacs.el";
  };
}
