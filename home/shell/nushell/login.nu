if (pgrep -x "X") == "" {
  pueued -d
  pueue clear
  history -c
  QT_QPA_PLATFORMTHEME=gtk2 startx
  pueue shutdown
  exit
}

