#!/bin/bash

if [[ ! $@ ]]; then
	echo -e 'reboot\nsuspend\nshut down'
else
	command=$@

	case $command in
		reboot) systemctl reboot ;;
		suspend) systemctl suspend ;;
		*) systemctl poweroff ;;
	esac
fi
