{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    defaultKeymap = "emacs";
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
      ];
      theme = "fox";
    };
    initExtra = ''
      export PATH=$PATH:$HOME/.local/bin:$HOME/.cargo/bin:$HOME/go/bin
    '';
  };
}
