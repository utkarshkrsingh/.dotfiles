#!/bin/bash

# Create the folder if it doesn't exist
mkdir -p "$HOME/Videos/screenrec"

# Navigate to the folder
cd "$HOME/Videos/screenrec" || exit 1

# Check for wl-screenrec
if ! command -v wl-screenrec >/dev/null; then
    echo "wl-screenrec not installed"
    exit 1
fi

# Generate filename using timestamp
FILENAME="$(date '+%Y-%m-%d_%H-%M-%S').mp4"

# Start recording
wl-screenrec --audio --audio-device alsa_output.pci-0000_00_1f.3.hdmi-stereo.monitor --filename "$FILENAME"
