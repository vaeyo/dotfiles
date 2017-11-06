#!/bin/bash

desks=( $(wmctrl -d | awk '{print $NF}') )

if [[ -z $@ || $@ = move ]]; then
	for desk in ${desks[*]}; do
		echo "$desk"
	done
else
	args="$@"
	desktop_name="${args##* }"
	desktop_id=$(wmctrl -d | awk '$NF == "'$desktop_name'" {print $1}')
	active_window_id=$(printf 0x%x $(xdotool getactivewindow))

	wmctrl -s $desktop_id
	#~/Desktop/res_wall.sh &

	[[ $args =~ move ]] && wmctrl -i -R $active_window_id
fi
