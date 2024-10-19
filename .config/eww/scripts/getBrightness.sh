#!/bin/bash

current_brightness=$(brightnessctl g)
max_brightness=$(brightnessctl m)
brightness_percentage=$((current_brightness * 100 / max_brightness))

echo "${brightness_percentage}"
