erc
res=$(echo "Screenshot|Clerk|Theme Selector|Web Related|Search|File Browser|To-Do|Workspaces|Misc|Search|Bangs|Utilities|Media|.Xresources Theme Chooser|" | rofi -sep "|" -dmenu -i -p 'rofi shit: ' "" -auto-select)

function sure {
  local res=$(echo "no|yes" | rofi -sep "|" -dmenu -i -p "$1: sure?" -auto-select)
  [[ $res = "yes" ]] && exec $2
}

[[ $res = "Screenshot" ]] && teiler
[[ $res = "Clerk" ]]   && clerk
[[ $res = "Theme Selector" ]]      && rofi-theme-selector
[[ $res = "Web Related" ]]   && powermenu2.sh
[[ $res = "Search" ]]   && rofi  -show find -modi find:~/.local/share/rofi/finder.sh
[[ $res = "File Browser" ]]  && rofi -switchers "file:rofi-file-browser.sh" -show file
[[ $res = "To-Do" ]]  && dofi
[[ $res = "Workspaces" ]]    && rofi_workspaces.sh | rofi -dmenu
[[ $res = "Misc" ]] && rofi_script.sh
[[ $res = "Search" ]] && zzzfoo
[[ $res = "Bangs" ]]    && rofi-bangs.sh
[[ $res = "Utilities" ]]   && powermenu3.sh
[[ $res = "Media" ]]   && powermenu4.sh
[[ $res = ".Xresources Theme Chooser" ]]   && rofi -m -2  -i -p -modi drun,run,colorscheme:rofi-colorscheme-switch,keys,ssh,combi -show colorscheme:rofi-colorscheme-switch -show-icons true -me-select-entry '' -me-accept-entry 'Mouse1'


exit 0
