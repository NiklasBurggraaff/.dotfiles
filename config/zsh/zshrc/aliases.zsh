###############################
# Aliases
###############################

# View help
alias "?"="glow $ZDOTDIR/README.md"
alias "??"="glow -p $ZDOTDIR/README_FULL.md"

# View configuration
alias zals="alias"
alias zbinds="bindkey -M emacs"

# Make sure sudo keeps the environment
alias sudo="nocorrect sudo -E "

# tmux sessionizer
alias t="~/.tmux/tmux-sessionizer.bash"

# List files
alias ls="exa"
alias la="exa -a"
alias ll="exa -lah --git"

# Linux open
if [[ "${OS}" == "Linux" ]]
then
    alias open="xdg-open" # Open folder in GUI
fi

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
