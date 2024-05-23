PID_FILE=/home/sny/.powersaverd.pid

get_status() {
	echo $(cat /sys/class/power_supply/BAT*/status)
}

change_status() {
	case $1 in
		"Discharging")
			powerprofilesctl set power-saver
		;;
		
		"Charging")
			powerprofilesctl set performance
		;;
	esac
}

daemon() {
	status=$(get_status)

	while true; do
		sleep 3m
		current=$(get_status)
		
		if [[ $current != $status ]]; then
			change_status $current
			status=$current
		fi

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
	start
}

$1
