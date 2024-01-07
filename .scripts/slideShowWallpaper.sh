#!/bin/bash


image_folder="$HOME/.config/swaybg/wallpapers"

while true; do 
    rimage=$(ls "$image_folder" | shuf -n 1)
    
    setsid -f swaybg -i "$image_folder/$rimage"

    sleep 30
done
