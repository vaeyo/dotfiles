erc
res=$(echo "google|youtube|surfraw|bookmarks|network|firefox|" | rofi -sep "|" -dmenu -i -p 'rofi shit: ' "" -auto-select)

function sure {
  local res=$(echo "no|yes" | rofi -sep "|" -dmenu -i -p "$1: sure?" -auto-select)
  [[ $res = "yes" ]] && exec $2
}

[[ $res = "google" ]] && google.py
[[ $res = "youtube" ]]   && youtube.py
[[ $res = "surfraw" ]]      && rofi-surfraw
[[ $res = "bookmarks" ]]   && buku_run
[[ $res = "network" ]]  && network.py
[[ $res = "firefox" ]] && rofi -modi 'firefox:firefox-switch-tabs' -show firefox


exit 0
