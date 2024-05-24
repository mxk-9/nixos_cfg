PID_FILE=/home/sny/.powersaverd.pid

get_status() {
  st=$(cat /sys/class/power_supply/BAT*/status)
  
  case $st in
    "Charging")    echo 1 ;;
    "Discharging") echo 0 ;;
  esac
}

get_profile() {
  pr=$(powerprofilesctl get)

  case $pr in
    "performance") echo 1 ;;
    "power-saver") echo 0 ;;
  esac
}

change_status() {
  case $1 in
    0)
      powerprofilesctl set power-saver
      pkill picom
    ;;
    1)
      powerprofilesctl set performance
      picom --vsync
    ;;
  esac
}

daemon() {
  while true; do
    sleep 1m
    battery=$(get_status)
    profile=$(get_profile)
    
    if [ $battery != $profile ]; then
      change_status $battery
    fi

    echo "$battery, $profile"
  done
}

start() {
  daemon &
  PID=$!

  echo Launched as $PID
  echo $PID > $PID_FILE
}

stop() {
  kill -9 $(cat $PID_FILE)
  echo Killed
}

restart() {
  stop
  wait $!
  start
}

$1
