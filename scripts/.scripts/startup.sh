#!/bin/bash

# Start Eww first
eww daemon &
sleep 1
eww open bar0

# Wait to ensure tray is initialized
sleep 2

# Start tray apps after system tray is ready
copyq --start-server &
nm-applet --indicator &
