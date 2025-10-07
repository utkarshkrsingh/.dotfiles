# Alias
alias update-grub="sudo grub2-mkconfig -o /boot/grub2/grub.cfg"
alias update-system="sudo dnf update -y"
alias ls="eza -lahF --tree --level=1 --color=always --icons --sort=name --group-directories-first --no-time --no-user --no-filesize --git --no-permissions"
alias v="nvim"
alias pipes="$HOME/.scripts/pipes.sh"
alias man="man -P 'nvim +Man!'"

alias startpyenv="source ~/.venv/bin/activate"
alias gitlink="git remote set-url origin " ## gitlink https://<GITHUB-TOKEN>@github.com/nyxfr/<REPO-NAME>

# alias code="code --ozone-platform=wayland"

alias battery-life="upower -i $(upower -e | grep 'BAT')"

alias fastfetch="fastfetch --logo-color-1 magenta --logo $HOME/.config/fastfetch/logo/not-gui.txt"
