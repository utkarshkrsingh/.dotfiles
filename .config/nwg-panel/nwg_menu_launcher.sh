#!/bin/bash

nwg-menu -ml 10 -mb 10 -mr 10 -mt 10 -o "nyxfr" -fm "dolphin" -s "menu-start.css" -cmd-lock "swaylock -f" -cmd-logout "hyprctl dispatch exit" -cmd-restart "systemctl -i reboot" -cmd-shutdown "systemctl -i poweroff" -d

#nwg-menu \
#    - s "menu-start.css" \
#    - va "bottom" \
#    - ha "left" \
#    - fm "dolphin" \
#    - cmd-lock "swaylock -f" \
#    - cmd-logout "hyprctl dispatch exit" \
#    - cmd-restart "systemctl -i reboot" \
#    - cmd-shutdown "systemctl -i poweroff" \
#    - d \
#    - height 600 \
#    - width 300 \
#    - ml 10 \
#    - o "nyxfr"
