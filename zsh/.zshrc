# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="jovial"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 7

# Plugins
plugins=(
  git
  autojump
  urltools
  bgnotify
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-history-enquirer
  jovial
)

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Path to zsh folder
export ROOT=$HOME/dotfiles/zsh

# Export colors
export TERM=xterm-256color

# Webom password-store
export PASSWORD_STORE_DIR="/Users/eik/code/webkom/password-store"

# History settings
HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=$HISTSIZE
setopt hist_ignore_all_dups # Remove older duplicate entries from history
setopt share_history # Remove superfluous blanks from history items
setopt auto_cd # Activating auto cd
zstyle ':completion:*' menu select # Activate highlight on completion

# Source files
source $ROOT/aliases.zsh
source $ROOT/fzf.zsh
source $ROOT/jovial.zsh

# Eval correct node version on dirchange
eval "$(fnm env --use-on-cd)"

export HOMEBREW_NO_AUTO_UPDATE=true
