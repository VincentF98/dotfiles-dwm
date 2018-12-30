#!/bin/ksh

ethavail=$(ifconfig $1 | grep "status: active")
wifiavail=$(ifconfig $2 | grep "status: active")
dev=$1
iptype=4
if [ -z $ethavail ]; then
	
	if [ -z $wifiavail ]; then
		echo "Not connected"
		exit
	fi

	dev=$2
	iptype=4
	ip=$(ifconfig $dev | grep "inet " | awk '{print $2}')
	if [ -z $ip ]; then
		iptype=6
		ip=$(ifconfig $dev | grep "inet6" | awk '{print $2}')
	fi

else
	dev=$1
	iptype=4
	ip=$(ifconfig $dev | grep "inet " | awk '{print $2}')
	if [ -z $ip ]; then
		iptype=6
		ip=$(ifconfig $dev | grep "inet6" | awk '{print $2}')
	fi
fi

if [ $iptype -eq 4 ]; then
	ip="$ip"
else
	ip="$ip"
fi


if [ $dev = $1 ]; then
	echo " $ip"
elif [ $dev = $2 ]; then
	ssid=$(ifconfig $2 | grep nwid | awk '{print $3}')
	signal=$(ifconfig $2 | grep nwid | awk '{print $8}' | sed 's/%//')
	if [ $signal -gt 80 ]; then
		echo " $ssid ($signal%) : $ip"
	elif [ $signal -gt 60 ]; then
		echo " $ssid ($signal%) : $ip"
	elif [ $signal -gt 40 ]; then
		echo " $ssid ($signal%) : $ip"
	else
		echo " $ssid ($signal%) : $ip"
	fi
else
	echo "Not connected"
fi
