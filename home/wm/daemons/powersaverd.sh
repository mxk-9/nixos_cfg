PID_FILE=/home/sny/.powersaverd.pid

get_status() {
  st=$(cat /sys/class/power_supply/BAT*/status)
  
  if [[ $st == "Discharging" ]]; then
	echo 0
  else
    echo 1
  fi
}

get_profile() {
  pr=$(powerprofilesctl get)

  if [[ $pr == "performance" ]]; then
    echo 1
  else
    echo 0
  fi
}

change_status() {
  case $1 in
    0)
      powerprofilesctl set power-saver
      # pkill picom
    ;;
    1)
      powerprofilesctl set performance
      # picom --vsync &
    ;;
  esac }

daemon() {
  # check if battery status != charging && capacity <= 40% then dunstify -m 
  while true; do
    battery=$(get_status)
    profile=$(get_profile)
    
    if [ $battery != $profile ]; then
      change_status $battery
      battery=$(get_status)
      profile=$(get_profile)
    fi

    sleep 30s
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
