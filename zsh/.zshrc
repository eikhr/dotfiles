# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 7

# Antigen (oh my zsh plugin manager)
source /opt/homebrew/Cellar/antigen/2.2.3/share/antigen/antigen.zsh
antigen use oh-my-zsh

antigen bundle git
antigen bundle autojump
antigen bundle urltools
antigen bundle bgnotify
antigen bundle colored-man-pages

antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting

antigen theme zthxxx/jovial
antigen bundle zthxxx/jovial
antigen bundle zthxxx/zsh-history-enquirer

antigen apply

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

# GPG key
export GPG_TTY=$(tty)

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

# Sdkman
export SDKMAN_DIR=$(brew --prefix sdkman-cli)/libexec
[[ -s "${SDKMAN_DIR}/bin/sdkman-init.sh" ]] && source "${SDKMAN_DIR}/bin/sdkman-init.sh"

# Mozart oz
alias ozc='/Applications/Mozart2.app/Contents/Resources/bin/ozc'
alias ozemulator='/Applications/Mozart2.app/Contents/Resources/bin/ozemulator'
alias ozem='/Applications/Mozart2.app/Contents/Resources/bin/ozemulator'
alias ozengine='/Applications/Mozart2.app/Contents/Resources/bin/ozengine'
alias ozwish='/Applications/Mozart2.app/Contents/Resources/bin/ozwish'

# Flutter
export PATH="$PATH":"$HOME/fvm/default/bin"
export PATH="$PATH":"$HOME/.pub-cache/bin"

# Eval correct node version on dirchange
eval "$(fnm env --use-on-cd)"

export HOMEBREW_NO_AUTO_UPDATE=true

# pnpm
export PNPM_HOME="/Users/eik/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

. /opt/homebrew/opt/asdf/libexec/asdf.sh

# autojump
[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh

# bun completions
[ -s "/opt/homebrew/Cellar/bun/0.5.5/share/zsh/site-functions/_bun" ] && source "/opt/homebrew/Cellar/bun/0.5.5/share/zsh/site-functions/_bun"

export PATH="$PATH:/opt/local/bin"


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniconda/base/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

## Webkom's .zshrc-config
source /Users/eik/code/webkom/dotfiles/.zshrc
alias webfx='sh "/Users/eik/code/webfx-cli//webfx.sh"'

# Prosjektoppgave setup (gem5, qemu og vSwarm)
RESOURCES="/Users/eik/code/ntnu/resources"


newbrew() {
  local dump_commands=('install' 'uninstall') # Include all commands that should do a brew dump
  local main_command="${1}"

  brew ${@}

  for command in "${dump_commands[@]}"; do
    [[ "${command}" == "${main_command}" ]] && brew bundle dump --file="${HOME}/.Brewfile" --force
  done
}
export PASSWORD_STORE_DIR="/Users/eik/code/webkom/password-store"
