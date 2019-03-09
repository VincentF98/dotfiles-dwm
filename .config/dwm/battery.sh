#!/bin/sh

dir="/sys/class/power_supply/$1"
full=$(cat "$dir/energy_full")
now=$(cat "$dir/energy_now")
percent=`expr 100 \* $now / $full`

if grep -q "Charging" "$dir/status"; then
	str=""
else
	str=""
fi

if [ $percent -lt 15 ]; then
	str="$str $percent"
elif [ $percent -lt 25 ]; then
	str="$str $percent"
elif [ $percent -lt 75 ]; then
	str="$str $percent"
else
	str="$str $percent"
fi

echo $str


