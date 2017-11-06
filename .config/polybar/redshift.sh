#!/bin/bash
 
#Get the path of this script
spath=$(realpath $0)
#Get the directory to put tmp BUS file
tdir=$XDG_RUNTIME_DIR/own_polybar
#Create the tmp directory if needed
[ -d $tdir ] || mkdir $tdir
#Set the tmp BUS file
tpath=$tdir/redshift
 
#Usage : redshift.sh [path|start|stop]
 
#path : Just echo the path of the script for the tail -F command in polybar
if [[ "$1" == "path" ]]; then
    truncate -s 0 $tpath
    echo -n $tpath
#Stop redshift (and wait for it to stop)
elif [[ "$1" == "stop" ]]; then
    killall redshift
    while pidof redshift > /dev/null; do
       sleep 0.1
    done
#Start redshift (and wait for it to start)
elif [[ "$1" == "start" ]]; then
    if ! pidof redshift; then
    redshift &
    until pidof redshift > /dev/null; do
       sleep 0.1
    done
    fi
fi
# Specifying the icon(s) in the script
# This allows us to change its appearance conditionally
icon=""
 
#Get redshift temperature
pgrep -x redshift &>/dev/null
if [[ $? -eq 0 ]]; then
    temp=$(redshift -p 2>/dev/null | grep temp | cut -d' ' -f3)
    temp=${temp//K/}
fi
 
# OPTIONAL: Append ' ${temp}K' after $icon
#If redshift is not started
if [[ -z $temp ]]; then
    #Set an action on the icon so when somebody clicks on it it would run this script and start redshift
    icon="%{A1:$spath start:}$icon%{A}"
    #Update the bus, that will update the icon because of the tail -F in polybar config
    echo "%{F#65737E}$icon%{F-}" >> $tpath      # Greyed out (not running)
else
  #Same thing but when redshift is started the icon is blue,yellow,or orange and the action stops it
  icon="%{A1:$spath stop:}$icon%{A}"
  if [[ $temp -ge 5000 ]]; then
    echo "%{F#8FA1B3}$icon%{F-}" >> $tpath       # Blue
  elif [[ $temp -ge 4000 ]]; then
    echo "%{F#EBCB8B}$icon%{F-}" >> $tpath       # Yellow
  else
    echo "%{F#D08770}$icon%{F-}" >> $tpath       # Orange
  fi
fi
