#!/usr/bin/env zsh

find ~/.wallpapers/use -type f -or -type l | rofi -i -dmenu | xargs wallpaper.sh
