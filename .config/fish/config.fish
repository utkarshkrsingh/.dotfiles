#####################
##
# ╔═╦╗╔═╦╗╔╗╔╗╔══╗╔═╗
# ║║║║╚╗║║╚╗╔╝║═╦╝║╬║
# ║║║║╔╩╗║╔╝╚╗║╔╝─║╗╣
# ╚╩═╝╚══╝╚╝╚╝╚╝──╚╩╝
##
#####################


neofetch
starship init fish | source

if status is-interactive
    # Commands to run in interactive sessions can go here
end
set -g fish_greeting ''

alias grub-update="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias ls="exa -lahF --tree --level=1 --color=always --icons --sort=name --group-directories-first --no-time --no-user --no-filesize --git --no-permissions"
alias v="nvim"
alias bt="btop"
alias pipes="$HOME/.scripts/pipes.sh"
alias pipesX="$HOME/.scripts/pipesX.sh"
#alias dvideo="cd ~/Videos && youtube-dl --verbose"
#alias daudio="cd ~/Music && youtube-dl --verbose -x --audio-format mp3"
#alias screenrec="cd ~/Videos/Capture && wl-screenrec --audio --audio-device alsa_output.pci-0000_00_1f.3.hdmi-stereo.monitor --filename"
alias startpyenv="source ~/.venv/bin/activate.fish"
alias sys-update="sudo pacman -Syu && paru -Syu"
alias gitlink="git remote set-url origin " ## gitlink https://<GITHUB-TOKEN>@github.com/nyxfr/<REPO-NAME>
alias mc="mc --nosubshell"
alias btop="btop --utf-force"

