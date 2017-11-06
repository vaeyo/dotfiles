#!/bin/bash

SCRIPT=$(readlink -f $0)
SCRIPTPATH=`dirname $SCRIPT`

case $1 in
"subtle_change_view")
  ruby "${SCRIPTPATH}/subtle/subtle_rofi.rb" -t
  ;;
"powercontrol")
  ruby "${SCRIPTPATH}/powercontrol/powercontrol.rb"
  ;;
"streaming")
  ruby "${SCRIPTPATH}/streaming/streaming.rb"
  ;;
*)
  echo "Select Option"
  ;;
esac
