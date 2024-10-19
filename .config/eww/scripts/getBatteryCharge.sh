#!/bin/bash

bat=/sys/class/power_supply/BAT0/
percentage=$(cat "$bat/capacity")

[ $(cat "$bat/status") = Charging ] && echo "${percentage}" && exit

if [ "$percentage" -gt "80" ]; then
    icon="${percentage}% "
elif [ "$percentage" -gt "60" ]; then
    icon="${percentage}% "
elif [ "$percentage" -gt "40" ]; then
    icon="${percentage}% "
elif [ "$percentage" -gt "20" ]; then
    icon="${percentage}% "
else
    icon="${percentage}% "
fi
echo "$icon"
