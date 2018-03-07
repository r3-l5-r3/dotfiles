#!/bin/bash
 
healthy='#2a9292'
low='#a06e3b'
discharge='#be4678'
low_warning=0
 
capacity=`cat /sys/class/power_supply/BAT0/capacity`

if (($capacity <= 15));
then
        capacityColour=$discharge
	if (($low_warning=0));
	then
		notify-send -h string:fgcolor:'#be4678'
		notify-send 'BATTERY LOW!' 'Under 15%! Please charge this laptop.'
		mpv /home/cash/Downloads/SpelunkySounds/pause_out.wav
		low_warning=1
	fi
elif (($capacity < 50));
then
 	capacityColour=$low
else
        capacityColour=$healthy
fi
 
status=`cat /sys/class/power_supply/BAT0/status`
 
if [[ "$status" = "Discharging" ]]
then
        statusColour=$discharge
        status="▼"
else
        statusColour=$healthy
        status="▲"
	low_warning=0
fi
 
if (($capacity <= 15 ));
then
	echo "<span color=\"$capacityColour\">BATTERY LOW! $capacity%</span> <span color=\"$statusColour\">$status</span>"
else
	echo "<span color=\"$capacityColour\">BAT: $capacity%</span> <span color=\"$statusColour\">$status</span>"
fi
