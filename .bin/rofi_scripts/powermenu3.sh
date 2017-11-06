erc
res=$(echo "move windows|randr|displays|Kill|" | rofi -sep "|" -dmenu -i -p 'rofi shit: ' "" -auto-select)

function sure {
  local res=$(echo "no|yes" | rofi -sep "|" -dmenu -i -p "$1: sure?" -auto-select)
  [[ $res = "yes" ]] && exec $2
}

[[ $res = "move windows" ]]      && move_window_to_current
[[ $res = "randr" ]]   && rofi-randr
[[ $res = "displays" ]]  && monitor_layout.sh
[[ $res = "Kill" ]]  && rofi_kill_process.sh

exit 0
