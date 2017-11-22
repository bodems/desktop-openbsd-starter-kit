#!/bin/sh

xsetroot -solid steelblue &
setxkbmap -option compose:caps &
xset -b &
xrdb -merge ~/.Xresources &
sct &
xidle -program '/usr/X11R6/bin/xlock -mode lightning' -timeout 300 &
feh --bg-fill ~/pictures/wallpaper/openbsd-wallpaper.png &
conky &
darkhttpd ~/public_html --daemon
exec cwm
