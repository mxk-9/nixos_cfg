function tm() {
	argLen=${#@}

	case $argLen in
	0)
		echo "tm <session_name> [<path_for_session>]"
		return
	;;

	1) tmux attach -t $1 ;;
	2) tmux new-session -s $1 -c $2 ;;
	esac
}

alias tmv="tmux list-sessions | cut -d ':' -f 1"
