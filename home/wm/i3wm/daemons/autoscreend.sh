PID_FILE=/home/sny/.autoscreend.pid

set_monitors_mode() {
  case $1 in
    "expand") xrandr --output $3 --auto --right-of $2 ;;
    "auto") xrandr --auto ;;
  esac

  pkill warpd
  wait $!
  warpd
}

check_monitors() {
  readarray -t list < <(xrandr | grep ' connected' | cut -d ' ' -f 1)
  count=''${#list[@]}

  if [ $count -gt $1 ]; then
    set_monitors_mode "expand" ''${list[@]}
  elif [ $count -lt $1 ]; then
    set_monitors_mode "auto"
  fi

  echo $count
}

daemon() {
  readarray -t list < <(xrandr | grep ' connected' | cut -d ' ' -f 1)
  MONITOR_COUNT=''${#list[@]}

  while true; do
    sleep 1s
    MONITOR_COUNT=$(check_monitors $MONITOR_COUNT)
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

