#!/bin/bash

path=/home/vio/bin/rofi_scripts

modis+="window,"
modis="my_apps:$path/rofi_my_apps.sh,run,"
modis+="window_action:$path/rofi_window_action.sh,"
modis+="workspaces:$path/rofi_workspaces.sh,"
modis+="move_to:$path/rofi_workspaces.sh move,"
modis+="media:$path/rofi_media.sh,"
modis+="mount:$path/rofi_mount.sh,"
modis+="shutdown:$path/rofi_shutdown.sh"
rofi -modi "$modis" -show $1

