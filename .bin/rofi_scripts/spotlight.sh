#!/bin/sh

if [ "$(pidof rofi)" ]; then
    xdotool key Escape 
    # killall rofi
    # process was found
elif [ $# -eq 0 ]; then 
    rofi -show drun
    # process not found
fi;
