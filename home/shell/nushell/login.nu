if (pgrep -x "X") == "" {
  pueued -d
  pueue clear
  QT_QPA_PLATFORMTHEME=gtk2 startx
  pueue shutdown
  history -c
  exit
}

