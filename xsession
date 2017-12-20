#!/bin/sh

xsetroot -solid "#252525" &
emacs --daemon
setxkbmap -option compose:caps &
xset -b &
xrdb -merge ~/.Xresources &
sct &
xscreensaver &
~/.fehbg &
conky &
darkhttpd ~/public_html --daemon
exec cwm
