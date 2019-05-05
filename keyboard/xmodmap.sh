# keymap.sh --- 
# Copyright © Freiric Barral
# 
# Filename: keymap.sh
# Description: tweek the keymap
# Author: fb019397

# Created: Sun Feb  3 11:43:50 2013 (+0100)
# Last-Updated: Mon Mar 21 13:56:26 2016 (+0100)
# Version: 
#     Update #: 24

# Change Log:
# keyboard layout switching
# 
# 

# Code:
 
#!/bin/zsh
# LICENSE: PUBLIC DOMAIN
# remap Caps_Lock key to Xmonad's exclusive 'mod' key
 
xmodmap -e "add Lock = Caps_Lock"
xmodmap -e "add mod3 = Caps_Lock"
xmodmap ~/.xmodmap


# echo '@setxkbmap -optionrp:ctrl_shift_toggle "de,us"' | sudo tee -a /etc/xdg/lxsession/Lubuntu/autostart 
# ./obkey ~/.config/openbox/lubuntu-rc.xml
# 
# keymap.sh ends here
