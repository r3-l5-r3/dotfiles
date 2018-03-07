#!/bin/bash
 
healthy='#859900'
low='#b58900'
discharge='#dc322f'
low_warning=0
 
capacity=`cat /sys/class/power_supply/BAT0/capacity`

if (($capacity <= 15));
then
        capacityColour=$discharge
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
fi
 
if (($capacity <= 15 ));
then
	echo "<span color=\"$capacityColour\">BATTERY LOW! $capacity%</span> <span color=\"$statusColour\">$status</span>"
else
	echo "<span color=\"$capacityColour\">BAT: $capacity%</span> <span color=\"$statusColour\">$status</span>"
fi
