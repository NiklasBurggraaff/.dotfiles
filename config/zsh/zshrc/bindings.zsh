# Use emacs keybindings
bindkey -e

# Fix delete key
bindkey  "^[[3~"  delete-char

# Include beginning of search in history
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down
bindkey "^p" up-line-or-beginning-search
bindkey "^n" down-line-or-beginning-search

# Accept using Ctrl + y
bindkey "^y" autosuggest-accept
bindkey -M menuselect "^y" accept-line

# Use hjlk in menu selection (during completion)
# Doesn't work well with interactive mode
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'l' vi-forward-char

# Other menu keybindings
bindkey -M menuselect '^zi' vi-insert                      # Interactive
bindkey -M menuselect '^zh' accept-and-hold                # Hold
bindkey -M menuselect '^zn' accept-and-infer-next-history  # Next
bindkey -M menuselect '^zu' undo                           # Undo
bindkey -M menuselect '^zr' redo                           # Redo

# Paste using Ctrl + v
_paste-copy-using-xsel() {
	if [[ "${OS}" == "linux" ]]; then
		LBUFFER+="$(xsel -b -o)"
	elif [[ "${OS}" == "mac" ]]; then
		LBUFFER+="$(pbpaste)"
	else
		abort "Not supported OS: ${OS}"
	fi
}

zle -N _paste-copy-using-xsel
bindkey "^V" _paste-copy-using-xsel # Paste
