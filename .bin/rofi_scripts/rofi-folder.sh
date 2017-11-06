#!/usr/bin/env bash

if [ -z $@ ]
then
    rg --sort-files --files --null 2> /dev/null | xargs -0 dirname | uniq
else 
    xdg-open "$@" > /dev/null &
fi
