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

# Source zinit configuration
source "${HOME}/.zshrc.d/zinit.sh"

# Source plugins configuration
source "${HOME}/.zshrc.d/plugins.sh"

# Source environment variables
source "${HOME}/.zshrc.d/env.sh"

# Source aliases
source "${HOME}/.zshrc.d/aliases.sh"

# Source completion styling
source "${HOME}/.zshrc.d/completion_styling.sh"

# Source completions
source "${HOME}/.zshrc.d/completions.sh"

# Source functions
source "${HOME}/.zshrc.d/functions.sh"

# Source fzf configuration
source "${HOME}/.zshrc.d/fzf.sh"

# Source history configuration
source "${HOME}/.zshrc.d/history.sh"

# Source snippets
source "${HOME}/.zshrc.d/snippets.sh"

# Source starship configuration
source "${HOME}/.zshrc.d/starship.sh"

# Source zoxide configuration
source "${HOME}/.zshrc.d/zoxide.sh"

# Source tools configuration (if applicable)
source "${HOME}/.zshrc.d/tools.sh"

# Added by Antigravity
export PATH="/Users/utkarshkrsingh/.antigravity/antigravity/bin:$PATH"
