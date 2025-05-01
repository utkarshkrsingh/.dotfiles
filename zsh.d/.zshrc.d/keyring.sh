# ~/.zshrc.d/keyring.sh

# Start gnome-keyring if not already running
if ! pgrep -x gnome-keyring-daemon >/dev/null; then
  eval "$(gnome-keyring-daemon --start)"
  export SSH_AUTH_SOCK
fi
