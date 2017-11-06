#!/usr/bin/env bash

online=$(ifconfig | grep "RUNNING,MULTICAST" | cut -d ":" -f1)

# first check if laptop
if [[ `laptop-detect` ]]; then
    if [[ "$online" ]]; then
        echo %{F#EFF0F1}
      else
        echo %{F#E64141}
    fi
  elif [[ ! `laptop-detect` ]]; then
    if [[ "$online" ]]; then
        echo %{F#EFF0F1}
      else
        echo %{F#E64141}
    fi
  else
    if [[ "$online" ]]; then
        echo %{F#EFF0F1}
      else
        echo %{F#E64141}
    fi
fi
