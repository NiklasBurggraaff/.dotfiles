# Use emacs keybindings
bindkey -e

# Include beginning of search in history
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down
bindkey "^p" up-line-or-beginning-search
bindkey "^n" down-line-or-beginning-search
