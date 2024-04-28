#!/bin/bash

transition_arr=("simple" "fade" "left" "right" "top" "bottom" "wipe" "wave" "grow" "center" "any" "outer")
image_folder="$HOME/.config/swaybg/wallpapers"

while true; do 

    random_index=$(( $RANDOM % ${#transition_arr[@]}))
    random_type=${transition_arr[random_index]}

    rimage=$(ls "$image_folder" | shuf -n 1)
    
    setsid -f swww img "$image_folder/$rimage" --transition-type "$random_type"

    sleep 30
done
