#!/bin/bash

slp_track=0

function finish {
	unset per
	unset cur
	unset wind
	unset desk
	unset slp_track
}
trap finish EXIT

function get_focused_window {
	wind=$(xdotool getwindowfocus getwindowname)
}

function get_battery {
	if [ "$slp_track" -eq 0 ]; then
		per=$(acpi --battery) #| cut -d, -f2)
		per=${per:11}
	fi
}

function get_date {
	cur=$(date "+%a %b %d, %H:%M:%S")
}

function get_desktop {
	desk=$(wmctrl -d | grep "*")
	desk=${desk:0:1}
}

function update_info {
	get_battery
	get_date
	get_desktop
	echo "%{l}$desk""%{c}$cur""%{r}$per"
}

while true; do
	update_info
	slp_track=$[ $slp_track + 1 ]
	if [ "$slp_track" -eq 59 ]; then
		slp_track=0
	fi
	sleep 1
done
