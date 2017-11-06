#!/bin/bash

if [[ -z $@ ]]; then
	echo -e 'close\nminimize\nmaximize\nfit window\nrestore window'
else
	command=$@

	case $command in
		close*) xdotool getactivewindow windowkill ;;
		min*) xdotool getactivewindow windowminimize ;;
		max*) wmctrl -r :ACTIVE: -b toggle,maximized_vert,maximized_horz ;;
		it*) ~/Desktop/new_aproach_improved.sh ;;
		restore*) ~/Desktop/new_aproach_improved.sh restore ;;
	esac
fi
