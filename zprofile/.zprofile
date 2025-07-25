# ~/.zprofile
export XDG_SESSION_TYPE=wayland
export XDG_CURRENT_DESKTOP=Hyprland
export QT_QPA_PLATFORM=wayland
export GDK_BACKEND=wayland

# Start gnome-keyring-daemon
eval $(/usr/bin/gnome-keyring-daemon --start)
export SSH_AUTH_SOCK

# Start Hyprland on tty1 only
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
    exec Hyprland
fi
