#!/bin/sh

ip=$(~/.config/dwm/network.sh em0 iwm0)
bat0=$(~/.config/dwm/battery.sh acpibat0)
bat1=$(~/.config/dwm/battery.sh acpibat1)
date=$(date "+%a %b %d %Y %I:%M:%S %p")
xsetroot -name "$ip · $bat0 · $bat1 · $date"
