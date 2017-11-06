#!/bin/sh
sed -i \
         -e 's/#181C24/rgb(0%,0%,0%)/g' \
         -e 's/#eaeaea/rgb(100%,100%,100%)/g' \
    -e 's/#000008/rgb(50%,0%,0%)/g' \
     -e 's/#FFBD92/rgb(0%,50%,0%)/g' \
     -e 's/#131A1F/rgb(50%,0%,50%)/g' \
     -e 's/#eaeaea/rgb(0%,0%,50%)/g' \
	$@
