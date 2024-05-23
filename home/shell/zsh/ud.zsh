ud() {
	if [ ${#@} -eq 0 ]; then
		echo "ud [m block_device] [u block_device]"
		echo "ud m sda1"
	fi

	case $1 in
	"m")
		udisksctl mount -b /dev/$2
		return
	;;

	"u")
		udisksctl unmount -b /dev/$2
		doas hdparm -Y /dev/${2[1,3]}
		return
	;;
	esac
}

alias lsbd="file /dev/* | grep -iE 'block special' | grep --invert-match loop | cut -f 1 -d ':' | cut -f 3 -d '/'"
alias M="ud m"
alias U="ud u"
