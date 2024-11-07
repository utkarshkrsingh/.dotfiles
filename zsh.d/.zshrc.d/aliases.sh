# Alias
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias ls="exa -lahF --tree --level=1 --color=always --icons --sort=name --group-directories-first --no-time --no-user --no-filesize --git --no-permissions"
alias v="nvim"
alias bt="btop"
alias pipes="$HOME/.scripts/pipes.sh"
alias pipesX="$HOME/.scripts/pipesX.sh"

alias startpyenv="source ~/.venv/bin/activate"
alias update-system="paru -Syu"
alias gitlink="git remote set-url origin " ## gitlink https://<GITHUB-TOKEN>@github.com/nyxfr/<REPO-NAME>
alias btop="btop --utf-force"

alias clear="printf '\033[2J\033[3J\033[1;1H'"

