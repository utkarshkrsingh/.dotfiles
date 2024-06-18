# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::command-not-found

# Load completions 
autoload -U compinit && compinit
zinit cdreplay -q

# Load Neofetch
neofetch

# Add in starship
eval "$(starship init zsh)"

# Add in zoxide
eval "$(zoxide init zsh)"

# History
HISTSIZE=1000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' matcher-list 'm:{A-Z}={a-zA-Z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Alias
alias grub-update="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias ls="exa -lahF --tree --level=1 --color=always --icons --sort=name --group-directories-first --no-time --no-user --no-filesize --git --no-permissions"
alias v="nvim"
alias bt="btop"
alias pipes="$HOME/.scripts/pipes.sh"
alias pipesX="$HOME/.scripts/pipesX.sh"
#alias dvideo="cd ~/Videos && youtube-dl --verbose"
#alias daudio="cd ~/Music && youtube-dl --verbose -x --audio-format mp3"
#alias screenrec="cd ~/Videos/Capture && wl-screenrec --audio --audio-device alsa_output.pci-0000_00_1f.3.hdmi-stereo.monitor --filename"
alias startpyenv="source ~/.venv/bin/activate"
alias sys-update="sudo pacman -Syu && paru -Syu"
alias gitlink="git remote set-url origin " ## gitlink https://<GITHUB-TOKEN>@github.com/nyxfr/<REPO-NAME>
alias mc="mc --nosubshell"
alias btop="btop --utf-force"

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
