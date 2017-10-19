#!/bin/sh

xsetroot -solid steelblue &
setxkbmap -option compose:caps &
compton &
urxvtd -q -f -o &
xset -b &
xrdb -merge ~/.Xresources &
redshift &
xidle -program '/usr/X11R6/bin/xlock -mode lightning' -timeout 300 &
feh --bg-fill ~/pictures/wallpaper/openbsd-wallpaper.png &
conky &
exec cwm
