#!/bin/sh

now=$(sysctl -n hw.sensors.$1 | grep "remaining" | awk '{print $1}')
full=$(sysctl -n hw.sensors.$1 | grep "design" | awk '{print $1}')
percent=$(echo "scale = 0; 100 * $now / $full" | bc )
status=$( sysctl -n hw.sensors.$1 | tail -n 1 | awk '{print $1}')

if [ $status -eq 2 ]; then
	str=""
elif [ $status -eq 1 ]; then
	str=""
else
	str=" "
fi

if [ $percent -lt 15 ]; then
	str="$str $percent%"
elif [ $percent -lt 25 ]; then
	str="$str $percent%"
elif [ $percent -lt 75 ]; then
	str="$str $percent%"
else
	str="$str $percent%"
fi

echo $str


