#!/bin/bash

[[ ! $1 ]] && id=$(wmctrl -l | awk '/DROPDOWN/ {print $1}') || id=$1

if [[ $id ]]; then
	if [[ $(xwininfo -id $id | awk '/Map/ {print $NF}') =~ Viewable && $(printf 0x%x $(xdotool getactivewindow)) =~ ${id#*0x0[0-9a-z]} ]]; then
		action="windowminimize"
		color="777"
		icon=" "
	else
		action="windowactivate"
		color="999"
		icon=" "
	fi

	xdotool $action $id 2> /dev/null
	sed -i "s/\(color=\).*/\1\"$color\"/" ~/.dotfiles/bar/system_info.sh
	sed -i "s/\(term_icon=\).*/\1\"$icon\"/" ~/.dotfiles/bar/system_info.sh
else
	xfce4-terminal -T DROPDOWN --drop-down
fi
