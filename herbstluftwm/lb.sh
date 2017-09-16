#!/bin/bash

slp=0
per=0
cur=0
smallest=1
# battery, date
declare -a delay=( 60 60 )

del_ln=${#delay[@]}

function get_smallest {
	tmp=${delay[0]}
	for i in `seq 1 $del_ln`; do
		if [ "${delay[$i]}" -lt "$tmp" ]; then
			tmp="${delay[$i]}"
		fi
	done
	smallest=$tmp
}

function battery {
	if [ "$1" -eq 0 ]; then
		per=$(acpi --battery | cut -d, -f2)
	elif [ "$1" -eq ${delay[0]} ]; then
		per=$(acpi --battery | cut -d, -f2)
		slp=1
	fi
}

function get_date {
	if [ "$1" -eq 0 ]; then
		cur=$(date "+%a %b %d, %H:%M")
	elif [ "$1" -eq ${delay[1]} ]; then
		cur=$(date "+%a %b %d, %H:%M")
		slp=1
	fi
}

get_smallest

while true; do
	battery $slp
	get_date $slp
	echo "%{c}$cur""%{r}$per"
	slp=$[ $slp + 1 ]
	sleep $smallest
done
