# Vim
alias vim="nvim"

# Exa ls
alias ls="exa --all"
alias l="exa --long --all --header --git"
alias tree="exa --tree --level=3"

# Cat with color
alias cat="ccat"

# Docker ps
alias ds="docker ps --format 'table {{.ID}}\\t{{.Names}}\t{{.Status}}'"

# Please to re-run with sudo
alias please='sudo $(fc -ln -1)'
