#!/bin/bash

xrdb -merge .Xresources
xbacklight -set 100

while true; do
	.config/dwm/bar.sh
	sleep 1
done &

feh --bg-scale ~/Pictures/Wallpapers/dt.png
exec dwm
