#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 <brightness_percentage (0-100)>"
    exit 1
fi

# Validate the input percentage
brightness_percentage=$1
if ! [[ "$brightness_percentage" =~ ^[0-9]+$ ]] || [ "$brightness_percentage" -lt 0 ] || [ "$brightness_percentage" -gt 100 ]; then
    echo "Error: Please provide a valid brightness percentage (0-100)."
    exit 1
fi

max_brightness=$(brightnessctl m)

target_brightness=$((max_brightness * brightness_percentage / 100))

brightnessctl s "$target_brightness"

echo $brightness_percentage%"
