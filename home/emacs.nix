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
      rev = "b36f0e5";
      sha256 = "6RVq1pzMe8Ugorw3/Emce1AxGMoiGjqKDA9v4VAGbe4=";
    } + "/emacs";
  };
}
