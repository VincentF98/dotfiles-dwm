#!/bin/sh

ipv4=$(ip -o route get 8.8.8.8 | sed -e 's/^.* src \([^ ]*\) .*$/\1/')
ipv6=$(ip -o route get 2001:4860:4860::8888 | sed -e 's/^.* src \([^ ]*\) .*$/\1/')
if [ -z $ipv4]; then
	ip="$ipv6"
	dev=$(ip -o route get 2001:4860:4860::8888 | sed -e 's/^.* dev \([^ ]*\) .*$/\1/')
else
	ip="$ipv4"
	dev=$(ip -o route get 8.8.8.8 | sed -e 's/^.* dev \([^ ]*\) .*$/\1/')
fi

if [ $dev = $1 ]; then
	echo " $ip"
elif [ $dev = $2 ]; then
	ssid=$(iw dev wlp4s0 info | sed -n 's/^.*ssid \([^ ]*\)/\1/p')
	signal=$(iw dev wlp4s0 link | sed -n 's/^.*signal: \([^ ]*\).*/\1/p')
	if [ $signal -gt -35 ]; then
		echo " $ssid ($signal dBm) : $ip"
	elif [ $signal -gt -60 ]; then
		echo " $ssid ($signal dBm) : $ip"
	elif [ $signal -gt -75 ]; then
		echo " $ssid ($signal dBm) : $ip"
	else
		echo " $ssid ($signal dBm) : $ip"
	fi
else
	echo "Not connected"
fi
