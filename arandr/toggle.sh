#!/bin/bash

function ids {
xrandr --output "$1" --mode 1920x1080 --pos 0x0 --rotate normal \
       --output "$2" --mode 1920x1080 --pos 1920x0 --rotate normal\
       --output "$3" --mode 1920x1080 --pos 3840x0 --rotate normal\
       --output HDMI-1 --off --output DP-4 --off # --output DP-1-3 --off --output DP-1-1 --off
# xrandr --output "$1" --mode 1920x1080 --pos 0x0 --rotate normal \
#        --output "$2" --mode 1920x1080 --pos 1920x0 --rotate normal\
#        --output "$3" --mode 1920x1080 --pos 3840x0 --rotate normal\
#        --output HDMI-1 --off --output DP-4 --off # --output DP-1-3 --off --output DP-1-1 --off
}

function laptop {
xrandr --output eDP-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal\
       --output VIRTUAL1 --off --output DP4 --off\
       --output DP-2 --off\
       --output HDMI1 --off --output DP-1-3 --off --output DP-1-2 --off --output DP-1-1 --off --output VGA-1 --off
# xrandr --output eDP1 --primary --mode 1920x1080 --pos 0x0 --rotate normal\
#        --output VIRTUAL1 --off --output DP4 --off\
#        --output HDMI1 --off --output DP-1-3 --off --output DP-1-2 --off --output DP-1-1 --off --output VGA-1 --off
}

NB_MONITORS=$(xrandr --listmonitors | grep Monitors | sed -e 's/^Monitors: //g' )
# Monitors: 2
#  0: +eDP-1 1920/309x1080/173+1920+0  eDP-1
#  1: +DP-2 1920/510x1080/287+0+0  DP-2

if [ "$NB_MONITORS" -eq 1 ]; then
    CONNECTED_OUTPUTS=( $(xrandr --current | grep ' connected' -A 1 | grep '+' -B1 | grep ' connected' | cut -f1 -d' '))
    echo "connected output are ${CONNECTED_OUTPUT[*]}"
    for CONNECTED_OUTPUT in "${CONNECTED_OUTPUTS[@]}"; do
	if [[ $CONNECTED_OUTPUT = VGA* ]]; then
	    VGA_OUTPUT=$CONNECTED_OUTPUT
	elif [[ $CONNECTED_OUTPUT = eDP* ]]; then
	    eDP_OUTPUT=$CONNECTED_OUTPUT
	elif [[ $CONNECTED_OUTPUT = DP* ]]; then
	    DP_OUTPUT=$CONNECTED_OUTPUT
	fi		      
    done
#    ids "$DP_OUTPUT" "$eDP_OUTPUT"
   ids "$VGA_OUTPUT" "$DP_OUTPUT" "$eDP_OUTPUT"
else 
    laptop
fi


EXPANDED_OUTPUT=${CONNECTED_OUTPUT[*]}
echo "$EXPANDED_OUTPUT"
echo $(echo "$EXPANDED_OUTPUT" | tr " " "\n" | sort)
echo "$NB_MONITORS"

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

       
       
