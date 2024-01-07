#!/bin/bash


image_folder="$HOME/.config/swaybg/wallpapers"

rimage=$(ls "$image_folder" | shuf -n 1)

setsid -f swaybg -i "$image_folder/$rimage"
