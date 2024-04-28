if (pgrep -x "X") == "" {
  pueued -d
  pueue clear
  QT_QPA_PLATFORMTHEME=gtk2 startx
  # QT_QPA_PLATFORMTHEME=gtk2 qtile start -b wayland -c $"($env.home-nix)/home/cfg-files/qtile/config.py"
  pueue shutdown
  history -c
  exit
}
