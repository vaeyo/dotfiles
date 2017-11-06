#!/bin/bash

if [[ -z $@ ]]; then
	echo -e 'close\nminimize\nmaximize\nfit screen\nforce fit screen'
else
	command=$@

	case $command in
		close*) xdotool getactivewindow windowkill ;;
		min*) xdotool getactivewindow windowminimize ;;
		max*) wmctrl -r :ACTIVE: -b toggle,maximized_vert,maximized_horz ;;
		fit*) ~/Desktop/fit_window_second_gen_fixed.sh ;;
		force*) ~/Desktop/fit_window_second_gen_fixed.sh force ;;
	esac
fi
