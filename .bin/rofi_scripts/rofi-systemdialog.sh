#!/usr/bin/env bash
#
# rofi-systemdialog.sh - a systemdialog with rofi
#
# Copyright (c) 2017 by Christian Rebischke <chris.rebischke@archlinux.org>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http: #www.gnu.org/licenses/
#
#======================================================================
# Author: Christian Rebischke
# Email : chris.rebischke@archlinux.org
# Github: www.github.com/Shibumi
#
#
#
#
# vim:set et sw=4 ts=4 tw=72:
#

_rofi () {
    rofi -i -border 2 -width 100 -lines 10 -padding 12 -location 1 -color-normal "#000000,#6c6c6c,#000000,#005577,#b0b0b0" -color-window "#000000" -no-levenshtein-sort -lines 8 "$@"
}


input=`echo "undock|undock and lock|lock|dockhome|dockwork|quit i3|reboot|poweroff" | _rofi -sep '|' -dmenu -p "systemdialog:"`


case $input in
    "undock")
        xrandr --output HDMI3 --off
        xrandr --output DP1 --off
        xrandr --output LVDS1 --auto
        xrandr --output VGA1 --off
        ;;

    "undock and lock")
        xrandr --output HDMI3 --off
    ¦   xrandr --output DP1 --off
    ¦   xrandr --output LVDS1 --auto
    ¦   xrandr --output VGA1 --off
        i3lock -p win -u -t -i /usr/share/i3lock/windows_10_small.png
        ;;

    "lock")
        i3lock -p win -u -t -i /usr/share/i3lock/windows_10_small.png
        ;;

    "dockhome")
        xrandr --output HDMI3 --mode 1920x1080 --left-of LVDS1
        xrandr --output LVDS1 --off
        xrandr --output VGA1 --mode 1920x1080 --right-of HDMI3
        setxkbmap de us
        ;;

    "dockwork")
        xrandr --output DP1 --mode 1920x1080 --left-of LVDS1
        xrandr --output LVDS1 --off
        xrandr --output VGA1 --mode 1600x1200 --left-of DP1
        setxkbmap de us
        ;;

    "quit i3")
         case `echo "yes|no" | _rofi -sep '|' -dmenu -p "do you really want to quit:"` in
            "yes")
                i3-msg quit
                ;;
            "no")
                ;;
        esac
        ;;

    "reboot")
        case `echo "yes|no" | _rofi -sep '|' -dmenu -p "do you really want to reboot:"` in
            "yes")
                systemctl reboot
                ;;
            "no")
                ;;
        esac
        ;;

    "poweroff")
        case `echo "yes|no" | _rofi -sep '|' -dmenu -p "do you really want to poweroff:"` in
            "yes")
                systemctl poweroff
                ;;
            "no")
                ;;
        esac
        ;;
esac
