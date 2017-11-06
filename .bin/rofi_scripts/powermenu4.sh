erc
res=$(echo "rofi-mpd|clerk|Pulse|Media Controls|" | rofi -sep "|" -dmenu -i -p 'rofi shit: ' "" -auto-select)

function sure {
  local res=$(echo "no|yes" | rofi -sep "|" -dmenu -i -p "$1: sure?" -auto-select)
  [[ $res = "yes" ]] && exec $2
}

[[ $res = "Clerk" ]]   && rofi-mpd
[[ $res = "mpd" ]] && clerk
[[ $res = "Pulse" ]]  && rofi-pulse-sink.sh
[[ $res = "Media Controls" ]]  &&rofi_media.sh | rofi -dmenu

exit 0
