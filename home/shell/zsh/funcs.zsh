nix-full-gc() {
  sys=$(ls /nix/var/nix/profiles/*link | grep link)
  count=$($sys | wc -l)
  sys=$(echo $sys | head -$(($count - 1)))

  home=$(ls /home/sny/.local/state/nix/profiles/ | grep link)
  count=$($home | wc -l)
  home=$(echo $home | head -$(($count - 1)))

  doas rm $(echo $sys)
  rm $(echo $home)

  nix store gc -v
  doas nix-collect-garbage -d -vvvvv
}

