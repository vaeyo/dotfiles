#!/usr/bin/bash
#
# rofi-audio.sh - a simple audio status bar implemented with rofi
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

helpout(){
    echo "./rofi-audio <option>"
    echo ""
    echo "options:"
    echo "increase - (same as pamixer -i 5)"
    echo "decrease - (same as pamixer -d 5)"
}

timeout(){
    sleep 0.2s
    killall rofi 2&>/dev/null
}

if [ $# -eq 0 ]; then
    helpout
    exit 1
fi

oribar="||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"
case $1 in

    increase)
        pamixer -i 5
        current_volume=`pamixer --get-volume`
        calculated_volume=`bc <<< "100 - $current_volume"`
        bar=${oribar::$(bc <<< "$calculated_volume - $calculated_volume * 2")}
        if [[ "$bar" == "" ]]; then
            bar=$oribar
        fi
        spaces=`printf '%'$calculated_volume'.s' ' '`
        bar="Audio: "$bar$spaces" "$current_volume%
        timeout &
        rofi -e "$bar" -config /etc/rofi.conf
        ;;

    decrease)
        pamixer -d 5
        current_volume=`pamixer --get-volume`
        calculated_volume=`bc <<< "100 - $current_volume"`
        barcalc=$(bc <<< "$calculated_volume - $calculated_volume * 2")
        bar=${oribar::$(bc <<< "$calculated_volume - $calculated_volume * 2")}
        if [[ "$bar" == "" ]]; then
            bar=$oribar
        fi
        spaces=`printf '%'$calculated_volume'.s' ' '`
        bar="Audio: "$bar$spaces" "$current_volume%
        timeout &
        rofi -e "$bar" -config /etc/rofi.conf
        ;;
esac
