#!/usr/bin/env bash
# keymap.sh --- 
# Copyright © Freiric Barral
# 
# Filename: keymap.sh
# Description: tweek the keymap
# Author: fb019397

# Created: Sun Feb  3 11:43:50 2013 (+0100)
# Last-Updated: Do Mär 31 00:59:35 2016 (+0200)
# Version: 
#     Update #: 142

# Change Log:
# keyboard layout switching
# 
# 

# Code:

#!/bin/zsh
# LICENSE: PUBLIC DOMAIN
# switch between us, fr, and de layouts

#TODO, we switch by ctrl+alt+space us -p> ru -> de
# better would be (ctrl+alt)+space switch to last used keyboard and (ctrl+alt)+space+space switch to next keyboard

# If an explicit layout is provided as an argument, use it. Otherwise, select the next layout from
# the set [us, fr, de].

    
    # end=$((SECONDS+3))
    # while [ $SECONDS -lt $end ]; do
    # 	;
    # done

layouts=(us ru de)

mapfile -t layoutsb < layouts.txt
layouts=${layouts:="$layoutsb"}

layoutlength=${#layouts[@]}
read pos < pos.txt
pos=${pos:='0'}
if [[ -n "$1" ]]; then
    setxkbmap $1
else
    layout=$(setxkbmap -query | grep layout | awk '{print $2}')
    nextpos=1
    pos=$(expr $pos + 1)
    if [ "$layoutlength" = "$pos" ]; then
	pos=0
    fi
    
    nextlayout=${layouts[$pos]}
    variant=""
    case $nextlayout in
        ru)
            variant="-variant phonetic"
            ;;    
    esac
    setxkbmap $nextlayout $variant -option compose:rctrl
    ~/scripts/keyboard/popup.sh "$nextlayout" middle 1 
fi
echo $pos > pos.txt

end=$((SECONDS+3))
while [ $SECONDS -lt $end ]; do
    printf "%s\n" "${layouts[@]}" > layouts.txt;
done 

# remap Caps_Lock key to Xmonad's exclusive 'mod' key
#~/scripts/keyboard//xmodmap.sh


# echo '@setxkbmap -option grp:ctrl_shift_toggle "de,us"' | sudo tee -a /etc/xdg/lxsession/Lubuntu/autostart 
# ./obkey ~/.config/openbox/lubuntu-rc.xml
# zzzzзz
# keymap.sh ends here
