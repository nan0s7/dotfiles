#!/bin/bash

slp=0

function battery {
	#check_time=60
	if [ "$1" -eq 60 ]; then
		per=$(acpi --battery | cut -d, -f2)
		slp=1
		echo "$per"
	elif [ "$1" -eq 0 ]; then
		per=$(acpi --battery | cut -d, -f2)
		echo "$per"
	fi
	#echo "$percentage"
}

function get_date {
	current=$(date "+%a %b %d, %T")
	echo -n "$current"
}


while true; do
	bat_per=$(battery $slp)
	echo "%{c}$(get_date $slp)""%{r}$bat_per"
	sleep 1
	slp=$[ $slp + 1 ] done
done
