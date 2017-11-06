#!/usr/bin/env bash
# author: unknown
# sentby: MoreChannelNoise (https://www.youtube.com/user/MoreChannelNoise)
# editby: gotbletu (https://www.youtube.com/user/gotbletu)

# demo: https://www.youtube.com/watch?v=kxJClZIXSnM
# info: this is a script to launch other rofi scripts,
#       saves us the trouble of binding multiple hotkeys for each script,
#       when we can just use one hotkey for everything.

# FUNZIONAMENTO
# Con l'opzione autoselect di rofi lo si rende praticamente uguale al sistema
# di parole chiave con cui lavora alfred per mac: 
# + ap - applicazioni
# + f  - file
# + bi - binari                                                                          
# + wi - finestre aperte                                                                 
# + we - ricerca sul web (con duckduckgo + bangs si cerca in praticamente qualsiasi sito)
###

declare -A LABELS
declare -A COMMANDS
# List of defined 'bangs'
# launch programs
COMMANDS["apps"]="rofi -combi-modi window,drun -show combi -matching fuzzy"
LABELS["apps"]=""

# find files
COMMANDS["file"]="/home/$(whoami)/Dotfiles/rofi/file.sh"
LABELS["file"]=""

# open custom web searches
COMMANDS["web"]="/home/$(whoami)/Dotfiles/rofi/web.sh"
LABELS["web"]=""

# clipboard manager
COMMANDS["clipboard"]="/home/$(whoami)/Dotfiles/rofi/clipboard.sh"
LABELS["clipboard"]=""

# bins
COMMANDS["bin"]="rofi -show run"
LABELS["bin"]=""

#COMMANDS["window"]="rofi -show window"
##LABELS["window"]=""

################################################################################
# do not edit below
################################################################################
##
# Generate menu
##
function print_menu()
{
    for key in ${!LABELS[@]}
    do
  echo "$key    ${LABELS}"
     #   echo "$key    ${LABELS[$key]}"
     # my top version just shows the first field in labels row, not two words side by side
    done
}
##
# Show rofi.
##
function start()
{
    # print_menu | rofi -dmenu -p "?=>" 
    print_menu | sort | rofi -dmenu -i -p "" -auto-select -matching fuzzy
#    print_menu | sort | dmenu -i -p "Winston" -fn "Inconsolata-14" 

}


# Run it
value="$(start)"

# Split input.
# grab upto first space.
choice=${value%%\ *}
# graph remainder, minus space.
input=${value:$((${#choice}+1))}

##
# Cancelled? bail out
##
if test -z ${choice}
then
    exit
fi

# check if choice exists
if test ${COMMANDS[$choice]+isset}
then
    # Execute the choice
    eval echo "Executing: ${COMMANDS[$choice]}"
    eval ${COMMANDS[$choice]}
else
 eval  $choice | rofi
 # prefer my above so I can use this same script to also launch apps like geany or leafpad etc (DK) 
 #   echo "Unknown command: ${choice}" | rofi -dmenu -p "error"
fi
