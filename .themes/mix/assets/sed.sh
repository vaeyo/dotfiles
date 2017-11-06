#!/bin/sh
sed -i \
         -e 's/#13151a/rgb(0%,0%,0%)/g' \
         -e 's/#eeeeec/rgb(100%,100%,100%)/g' \
    -e 's/#080e14/rgb(50%,0%,0%)/g' \
     -e 's/#ffffff/rgb(0%,50%,0%)/g' \
     -e 's/#1d1d29/rgb(50%,0%,50%)/g' \
     -e 's/#eeeeec/rgb(0%,0%,50%)/g' \
	$@
