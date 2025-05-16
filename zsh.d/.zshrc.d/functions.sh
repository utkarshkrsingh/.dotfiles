# wl-screenrec
screenrec() {
    # Check if the directory exists
    if [ ! -d $HOME/Videos/screenrec ]; then
        echo "Directory ~/Videos/screenrec does not exist."
        return 1
    fi
    
    # Change to the directory
    cd $HOME/Videos/screenrec || {
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

screenrec-wa() {
    # Check if the directory exists
    if [ ! -d $HOME/Videos/screenrec ]; then
        echo "Directory ~/Videos/screenrec does not exist."
        return 1
    fi
    
    # Change to the directory
    cd $HOME/Videos/screenrec || {
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
    wl-screenrec --audio --filename "$FILENAME"
}

screenrec-s2() {
    # Check if the directory exists
    if [ ! -d $HOME/Videos/screenrec ]; then
        echo "Directory ~/Videos/screenrec does not exist."
        return 1
    fi
    
    # Change to the directory
    cd $HOME/Videos/screenrec || {
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
    wl-screenrec --output HDMI-A-1 --audio --audio-device alsa_output.pci-0000_00_1f.3.hdmi-stereo.monitor --filename "$FILENAME"

}


# dvideo
dvideo() {
    # check if the directory exists
    if [ ! -d $HOME/Downloads ]; then
        echo "Directory ~/Downloads does not exist."
        return 1
    fi

    # change to the directory
    cd $HOME/Downloads || {
        echo "Failed to change directory to ~/Downloads."
        return 1
    }

    #check is yt-dlp is installed
    if ! command -v yt-dlp > /dev/null; then
        echo "yt-dlp is not installed."
        return 1
    fi

    # check if a url is given or not
    if [ -z "$1" ]; then
        echo "No youtube-url is provided."
        return 1
    else
        URL="$1"
    fi

    yt-dlp "$URL"
}

daudio() {
    # Check if the directory exists
    if [ ! -d "$HOME/Downloads" ]; then
        echo "Directory ~/Downloads does not exist."
        return 1
    fi

    # Change to the directory
    cd "$HOME/Downloads" || {
        echo "Failed to change directory to ~/Downloads."
        return 1
    }

    # Check if yt-dlp is installed
    if ! command -v yt-dlp > /dev/null; then
        echo "yt-dlp is not installed."
        return 1
    fi

    # Check if a URL is given
    if [ -z "$1" ]; then
        echo "No YouTube URL is provided."
        return 1
    fi

    URL="$1"

    # Download audio only (best audio format)
    yt-dlp -x --audio-format mp3 "$URL"
}

