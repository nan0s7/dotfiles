#!/bin/bash

# 1680x1050, 1280x800, 1440x900

xrandr --output eDP1 --mode 1440x900
herbstclient set_monitors 1440x900

feh --bg-scale /home/scott/Pictures/p3hLKOh.png

# to start lemonbar:
start_lemon=`./lb.sh | lemonbar -p`

# external panel
{
	pids=( )
	herbstclient pad 0 16 "" ""
	echo start_lemon
	pids+=( $! )
	herbstclient -w '(quit_panel|reload)'
	kill ${pids[@]}
} &

./extras.sh
