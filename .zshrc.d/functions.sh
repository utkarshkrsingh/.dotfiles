# wl-screenrec
screenrec() {

    cd

    # Check if the directory exists
    if [ ! -d ~/Videos/screenrec ]; then
        echo "Directory ~/Videos/screenrec does not exist."
        return 1
    fi
    
    # Change to the directory
    cd ~/Videos/screenrec || {
        echo "Failed to change directory to ~/Videos/screenrec."
        return 1
    }

    # Check if wl-screenrec is installed
    if ! command -v wl-screenrec > /dev/null; then
        echo "wl-screenrec is not installed."
        return 1
    fi

    # Check if a filename is provided
    if [ -z "$1" ]; then
        echo "No filename provided. Using default filename: recording.mp4"
        FILENAME="recording.mp4"
    else
        FILENAME="$1"
    fi

    # Start screen recording
    wl-screenrec --audio --audio-device alsa_output.pci-0000_00_1f.3.hdmi-stereo.monitor --filename "$FILENAME"
}
