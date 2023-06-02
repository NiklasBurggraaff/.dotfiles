# zmodload zsh/zprof

source $HOME/.config/zsh/zshrc/terminal.zsh
source $HOME/.config/zsh/zshrc/aliases.zsh

eval $(thefuck --alias)

export EUFS=/Users/niklas/Documents/University/EUFS
export Y1="/Users/niklas/Documents/University/Year 1"
export Y2="/Users/niklas/Documents/University/Year 2"
export Y3="/Users/niklas/Documents/University/Year 3"
export Y4="/Users/niklas/Documents/University/Year 4"
export PROJECTS="/Users/niklas/Developer/Projects"
export SANDBOX="/Users/niklas/Developer/Sandbox"

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
