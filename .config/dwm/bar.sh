#!/bin/sh

ip=$(~/.config/dwm/network.sh enp0s31f6 wlp4s0)
bat0=$(~/.config/dwm/battery.sh BAT0)
bat1=$(~/.config/dwm/battery.sh BAT1)
date=$(date "+%a %b %d %Y %I:%M:%S %p")
xsetroot -name "$ip · $bat0 · $bat1 · $date"
