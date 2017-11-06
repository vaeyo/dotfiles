#!/bin/bash
#
# Stupid simple select-and-type dmenu for looking up passwords
#
# mfa    - simple tool that will generate TOTP tokens stored in gopass
# gopass - awesome password manager https://github.com/justwatchcom/gopass
#
# rofi   - dmenu-like https://github.com/DaveDavenport/rofi
#

# For dmenu
#MENU="dmenu"

# For rofi
MENU="rofi -dmenu"

# Custom
#MENU="~/bin/rofi-launch -dmenu"

CHOICE=$(echo -en "mfa\ngopass\n" | $MENU)
case "$CHOICE" in
    mfa)
        WHICH=$(gopass list -f | grep '/totp$' | $MENU)
        if [ -n "$WHICH" ]; then
            (echo "type $(mfa -item $WHICH)" | xdotool -)
        fi
        ;;
    gopass)
        WHICH=$(gopass list -f | grep -v '/totp' | grep -v '/oauth' | $MENU)
        if [ -n "$WHICH" ]; then
            (echo "type $(gopass show $WHICH)" | xdotool -)
        fi
        ;;
esac
