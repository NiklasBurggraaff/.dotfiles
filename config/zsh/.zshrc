# zmodload zsh/zprof

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Plugins
source $ZDOTDIR/plugins/completion.zsh
source $ZDOTDIR/plugins/fzf/fzf.zsh

# Tools
eval "$(zoxide init zsh)"


# Powerlevel10k
source $ZDOTDIR/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f $ZDOTDIR/.p10k.zsh ]] || source $ZDOTDIR/.p10k.zsh

# Source all FUNCTIONS in functions folder
for f in $ZDOTDIR/functions/*; do source $f; done
unset f

# Source all SCRIPTS in zshrc folder
for f in $ZDOTDIR/zshrc/*; do source $f; done
unset f

# Load all of the plugins that were defined in ~/.zshrc
for plugin in $ZDOTDIR/oh-my-zsh/*
do
  local plugin_name=$(basename $plugin)
  source $ZDOTDIR/oh-my-zsh/$plugin_name/$plugin_name.plugin.zsh
done
unset plugin


# History
export HISTFILE="$XDG_CACHE_HOME/zsh/.zhistory"
setopt HIST_SAVE_NO_DUPS
export HISTSIZE=10000
export SAVEHIST=10000

# Directory stack
setopt AUTO_PUSHD           # Push the current directory visited on the stack.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.

alias d='dirs -v'
for index ({1..9})
do
  alias "$index"="cd +${index}"
done
unset index



# Setting path for PostgresQL
export PATH="/usr/local/opt/libpq/bin:$PATH"

source /Users/niklas/.ghcup/env
export SUMO_HOME="/usr/local/opt/sumo/share/sumo"

export DEFAULT_USER="$(whoami)"
export OPENSSL_ROOT_DIR=/usr/local/opt/openssl@1.1

# EUFS Specific
export EUFS_MASTER=$EUFS/Code/eufs-master

# NVM
export NVM_DIR=~/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pnpm
export PNPM_HOME="/Users/niklas/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
#export SDKMAN_DIR="/Users/niklas/.sdkman"
#[[ -s "/Users/niklas/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/niklas/.sdkman/bin/sdkman-init.sh"
export PATH="/usr/local/opt/openjdk/bin:$PATH"

# zprof
