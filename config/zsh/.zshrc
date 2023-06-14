# zmodload zsh/zprof

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# History
export HISTFILE="$XDG_CACHE_HOME/zsh/.zhistory"
setopt HIST_SAVE_NO_DUPS
export HISTSIZE=10000
export SAVEHIST=10000

# Source all scripts in zshrc folder
for f in $ZDOTDIR/zshrc/*; do source $f; done

# Fix to make vi-mode work with zsh-syntax-highlighting
# https://github.com/jeffreytse/zsh-vi-mode/pull/188#issuecomment-1453640946
function zvm_after_init() {
  autoload add-zle-hook-widget
  add-zle-hook-widget zle-line-pre-redraw zvm_zle-line-pre-redraw
}

# Plugins
fpath=($ZDOTDIR/plugins/zsh-completions/src $fpath)
source $ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
source $ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
source $ZDOTDIR/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh

# Functions
source $ZDOTDIR/functions/bd.zsh

# Powerlevel10k
source $ZDOTDIR/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f $ZDOTDIR/.p10k.zsh ]] || source $ZDOTDIR/.p10k.zsh


# Setting PATH for Go
export PATH="$GOPATH/bin:$PATH"
# Setting path for PostgresQL
export PATH="/usr/local/opt/libpq/bin:$PATH"

source /Users/niklas/.ghcup/env
export SUMO_HOME="/usr/local/opt/sumo/share/sumo"

export DEFAULT_USER="$(whoami)"
export OPENSSL_ROOT_DIR=/usr/local/opt/openssl@1.1

# EUFS Specific
export EUFS_MASTER=$EUFS/Code/eufs-master

# pnpm
export PNPM_HOME="/Users/niklas/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
#export SDKMAN_DIR="/Users/niklas/.sdkman"
#[[ -s "/Users/niklas/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/niklas/.sdkman/bin/sdkman-init.sh"
export PATH="/usr/local/opt/openjdk/bin:$PATH"


# zprof
