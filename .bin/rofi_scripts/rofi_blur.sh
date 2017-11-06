TMP=`mktemp -u`

ffmpeg \
-video_size 1920x1080 \
-f x11grab -i $DISPLAY \
-vf avgblur=5:15:5 \
-vframes 1 \
-f image2pipe -vcodec png \
-preset ultrafast \
$TMP > /dev/null

feh -F $TMP &
PID=$!

rofi -modi drun,run,colorscheme:rofi-colorscheme-switch,keys -show drun -show-icons true -me-select-entry '' -me-accept-entry 'Mouse1' -sidebar-mode
kill $PID
rm $TMP
