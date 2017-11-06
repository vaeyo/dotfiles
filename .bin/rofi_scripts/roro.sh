#!/usr/bin/env bash
 
ANS=$(echo "lock|logout|reboot|shutdown" | rofi -sep "|" -dmenu -i -p 'Power Menu: ' "" -width 20 \
-hide-scrollbar -location 0 -font "Anonymous Pro 9" -eh 1 -padding 30 -auto-select -no-config -lines 4 \
-color-enabled -color-window "#19043C, #05C6F1, #19043C" -color-normal "#19043C, #05C6F1, #19043C, #05C6F1, #19043C")
 
if [[ "$ANS" == "lock" ]]; then
  i3lock-fancy
elif [[ "$ANS" == "logout" ]]; then
  i3-msg exit
elif [[ "$ANS" == "reboot" ]]; then
  systemctl reboot
elif [[ "$ANS" == "shutdown" ]]; then
  systemctl poweroff
fi
