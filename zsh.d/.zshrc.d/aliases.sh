# Alias
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias update-system="paru -Syu --noconfirm"
alias ls="exa -lahF --tree --level=1 --color=always --icons --sort=name --group-directories-first --no-time --no-user --no-filesize --git --no-permissions"
alias v="nvim"
alias bt="btop"
alias pipes="$HOME/.scripts/pipes.sh"

alias startpyenv="source ~/.venv/bin/activate"
alias gitlink="git remote set-url origin " ## gitlink https://<GITHUB-TOKEN>@github.com/nyxfr/<REPO-NAME>

alias mcres="hyprctl keyword monitor HDMI-A-1,1600x900,0x0,0.8"
alias revmcres="hyprctl keyword monitor HDMI-A-1,1600x900,0x0,1"

alias system-clean="$HOME/.scripts/clean.sh"

alias code="code --ozone-platform=wayland"

alias battery-life="upower -i $(upower -e | grep 'BAT')"

alias fastfetch="fastfetch --logo-color-1 magenta --logo $HOME/.config/fastfetch/logo/not-gui.txt"
