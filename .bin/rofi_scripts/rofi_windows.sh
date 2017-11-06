#!/bin/bash

all_windows=( $(wmctrl -l | awk '!/Desktop|bar/') )

for desk in desks=$(wmctrl -d | awk '{print $1}') do
	list+="desktop $desk\n"

	windows=( $(`) )
