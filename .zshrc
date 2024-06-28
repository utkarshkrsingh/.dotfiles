#############################################################
#############################################################
## ██╗░░░██╗████████╗██╗░░██╗░█████╗░██████╗░░██████╗██╗░░██╗
## ██║░░░██║╚══██╔══╝██║░██╔╝██╔══██╗██╔══██╗██╔════╝██║░░██║
## ██║░░░██║░░░██║░░░█████═╝░███████║██████╔╝╚█████╗░███████║
## ██║░░░██║░░░██║░░░██╔═██╗░██╔══██║██╔══██╗░╚═══██╗██╔══██║
## ╚██████╔╝░░░██║░░░██║░╚██╗██║░░██║██║░░██║██████╔╝██║░░██║
## ░╚═════╝░░░░╚═╝░░░╚═╝░░╚═╝╚═╝░░╚═╝╚═╝░░╚═╝╚═════╝░╚═╝░░╚═╝
#############################################################
#############################################################

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

# Load fastfetch
fastfetch

# Load fzf-theme
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

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

export DISPLAY=:0
export LIBVA_DRIVER_NAME=iHD
export OCL_ICD_VENDORS=/etc/OpenCL/vendors

# Alias
alias grub-update="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias ls="exa -lahF --tree --level=1 --color=always --icons --sort=name --group-directories-first --no-time --no-user --no-filesize --git --no-permissions"
alias v="nvim"
alias bt="btop"
alias pipes="$HOME/.scripts/pipes.sh"
alias pipesX="$HOME/.scripts/pipesX.sh"
#alias dvideo="cd ~/Videos && youtube-dl --verbose"
#alias daudio="cd ~/Music && youtube-dl --verbose -x --audio-format mp3"

alias startpyenv="source ~/.venv/bin/activate"
alias sys-update="sudo pacman -Syu && paru -Syu"
alias gitlink="git remote set-url origin " ## gitlink https://<GITHUB-TOKEN>@github.com/nyxfr/<REPO-NAME>
alias btop="btop --utf-force"

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

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

export ROFI_FONT="JetBrainsMono Nerd Font 10"
export ROFI_EMOJI_FONT="NotoColorEmoji 12"
