#!/bin/bash

if [[ -z $@ ]]; then
	for dev in $(ls /media/sola); do
		echo "mount $dev"
	done

	for dev in $(df -h | awk -F '/' '!/sda1/ && /sda/ {print $NF}'); do
		echo "unmount $dev"
	done
else
	[[ $@ =~ ^mount ]] && script='mount_new.sh' || script='unmount.sh' 
	~/Documents/scripts/drives/sh/$script ${@##* }
fi
