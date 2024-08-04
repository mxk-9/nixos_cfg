{
  programs.bash = {
    enable = true;
    enableCompletion = true;
    historySize = 100;

    bashrcExtra = ''
      PS1='\[\e[38;5;129;1m\][\W\[\e[38;5;93m\]]\[\e[0m\] \[\e[38;5;198m\]\\$\[\e[0m\] '
    '';
  };
}
