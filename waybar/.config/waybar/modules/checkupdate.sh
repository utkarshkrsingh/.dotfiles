#!/bin/bash

pacman_updates=$(checkupdates 2>/dev/null | wc -l)

aur_helper="paru"  
aur_updates=$("$aur_helper" -Qua 2>/dev/null | wc -l)

totalupdate=$((pacman_updates + aur_updates))

if [ $totalupdate == 1 ]; then
    echo -n "󰇚 1 Update"
elif [ $totalupdate -gt 1 ]; then
    echo -n "󰇚 $totalupdate Updates"
fi
