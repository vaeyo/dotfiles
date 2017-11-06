#!/bin/sh
sed -i \
         -e 's/#19191f/rgb(0%,0%,0%)/g' \
         -e 's/#eeeeec/rgb(100%,100%,100%)/g' \
    -e 's/#333333/rgb(50%,0%,0%)/g' \
     -e 's/#7986cb/rgb(0%,50%,0%)/g' \
     -e 's/#2b2d3a/rgb(50%,0%,50%)/g' \
     -e 's/#eeeeec/rgb(0%,0%,50%)/g' \
	$@
