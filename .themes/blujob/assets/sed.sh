#!/bin/sh
sed -i \
         -e 's/#1d1f21/rgb(0%,0%,0%)/g' \
         -e 's/#eeeeec/rgb(100%,100%,100%)/g' \
    -e 's/#16181e/rgb(50%,0%,0%)/g' \
     -e 's/#75a6ba/rgb(0%,50%,0%)/g' \
     -e 's/#18191a/rgb(50%,0%,50%)/g' \
     -e 's/#eeeeec/rgb(0%,0%,50%)/g' \
	$@
