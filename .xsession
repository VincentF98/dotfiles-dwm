#!/bin/ksh

export LC_CTYPE="en_US.UTF-8"
. ~/.profile

xrdb -merge .Xresources
xbacklight -set 100

while true; do
	.config/dwm/bar.sh
	sleep 1
done &

feh --bg-scale ~/.config/dt.png
exec dwm
