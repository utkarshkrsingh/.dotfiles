#!/bin/bash

current_volume=$(pamixer --get-volume)

if [ "$current_volume" -eq 0 ]; then
    echo "󰝟"
else
    echo ""
fi

