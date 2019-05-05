#!/bin/bash 
WIDTH=300                                                                       
HEIGHT=200                                                                       
                                                                               
# This script shows an alert using dzen                                         
screenWidth=$(xdpyinfo | grep 'dimensions' | egrep -o "[0-9]+x[0-9]+ pixels" | sed "s/x.*//")
screenHeight=$(xdpyinfo | grep 'dimensions' | egrep -o "[0-9]+x[0-9]+ pixels" | egrep -o "x[0-9]*" | sed "s/x//")
let "middleY = $screenHeight/2 - ($HEIGHT/2)"                                 
let "middleX = $screenWidth/2 - ($WIDTH/2)"                                   
                                                                                
if [ "${2}" == "top" ]; then                                                    
        echo $1 | dzen2 -fn "DejaVu Sans Mono 18" -p $3 -h $HEIGHT               
else                                                                            
            echo $1 | dzen2 -fn 'Bitstream Vera Sans-50' -p $3 -y $middleY -x $middleX -h $HEIGHT -w $WIDTH &
# echo $1 | dzen2 -fn 'DejaVu Sans Mono 72' -p $3 -y $middleY -x $middleX -h $HEIGHT -w $WIDTH &
#        echo $1 | dzen2 -fn "DejaVu Sans Mono 72" -p $3 -y $middleY -x $middleX -h $HEIGHT -w $WIDTH &
fi
