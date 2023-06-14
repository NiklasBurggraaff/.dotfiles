###############################
# Aliases
###############################

# Make sure sudo keeps the environment
alias sudo='nocorrect sudo -E '

# tmux sessionizer
alias t="~/.tmux/tmux-sessionizer.bash"

# General
alias l="ll -a"
alias lg="ll -a | grep"
alias h="history"
alias hg="history | grep"
alias open="xdg-open" # Open folder in GUI

# Neovim
alias vim="nvim"
alias vi="nvim"

alias v="vim ."

# Config files
alias zenvconf="vim ~/.zshenv"
alias zshconf="vim $ZDOTDIR/.zshrc"
alias zprofileconf="vim $ZDOTDIR/.zprofile"
alias terminatorconf="vim ~/.config/terminator/config"
alias gitconf="vim ~/.gitconfig"
alias tmuxconf="vim ~/.config/tmux/tmux.conf"

# Source config files
alias zshs="source $ZDOTDIR/.zshrc"
alias tmuxs="tmux source ~/.config/tmux/tmux.conf"

# apt
alias install="sudo apt install"
alias update="sudo apt update"

# PNPM
alias pn="pnpm"

# xrandr aliases
alias xl="xrandr --output HDMI-2 --auto --right-of eDP-1"
alias xh="xrandr --output HDMI-2 --auto --left-of eDP-1"
alias xj="xrandr --output HDMI-2 --auto --below eDP-1"
alias xk="xrandr --output HDMI-2 --auto --above eDP-1"
alias xx="xrandr --output HDMI-2 --off && xrandr --output eDP-1 --auto"

