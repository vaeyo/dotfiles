#!/bin/bash

if [[ -z $@ ]]; then
	echo -e '  volume up\n  volume down\n\n  play\pause\n  previous song\n  next song\n  stop'
else
	command=$@

	case $command in
		*up) mpc volume +5 > /dev/null ;;
		*down) mpc volume -5 > /dev/null ;;
		*stop*) mpc stop > /dev/null ;;
		*next*) mpc next > /dev/null ;;
		*previous*) mpc prev > /dev/null ;;
		*) mpc toggle > /dev/null
	esac
fi
