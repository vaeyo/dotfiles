
#!/bin/bash
. "${HOME}/.config/Colorschemes"

bg=${xrdb:background}
border=$color2
separator=$color2
fg=${xrdb:foreground}
bgalt=${xrdb:color0}
urgent=${xrdb:color9}
fgalt=${xrdb:color7}
hlbg=$${xrdb:color2}
hlfg=$${xrdb:color 6}

# argument $1 expected to be window/run
exec rofi -show $1  -color-window "$bg, $fg, $border" \
                    -color-normal "$bg, $fg, $bgalt, $hlbg, $hlfg" \
                    -color-urgent "$bg, $urgent, $bgalt, $urgent, $fg" \
                    -color-active "$bg, $fg, $bgalt, $hlbg, $hlfg"
