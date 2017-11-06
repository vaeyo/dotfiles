#!/bin/bash

if [[ `cower -u | wc -l` > 0 ]]; then
    termite --geometry=500x300 --exec="yaourt -Syu" &
fi

exit 0
