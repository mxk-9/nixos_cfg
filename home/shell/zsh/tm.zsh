function tm() {
	createSession=false
	count=1
	argLen=${#@}
	sessionDir="e"
	sessionName="e"

	if [ $argLen -eq 0 ]; then
		echo "tm <session_name> [-n <path_for_session>]"
		return
	fi

	for i in ${=@}; do
		if [[ $i == "-n" ]] && [ $count -lt $argLen ] && [ $count -ne 1 ]; then
			createSession=true
			nxt=$(( count + 1 ))
			prv=$(( count - 1 ))
			sessionDir=${@[$nxt]}
			sessionName=${@[$prv]}
		fi
		count=$(( count + 1 ))
	done

	if $createSession; then
		tmux new-session -s $sessionName -c $sessionDir
	else
		tmux attach -t $1
	fi
}

alias tmv="tmux list-sessions | cut -d ':' -f 1"
