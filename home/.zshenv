# XDG
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$XDG_CONFIG_HOME/local/share
export XDG_CACHE_HOME=$XDG_CONFIG_HOME/cache

# Editor
export EDITOR="nvim"
export PAGER="less -r"
export VISUAL="nvim"

# zsh
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
source $ZDOTDIR/.zshenv

export OS="$(uname)"
