###############################
# Aliases
###############################

# View help
alias "?"="glow $ZDOTDIR/README.md"
alias "??"="glow -p $ZDOTDIR/README_FULL.md"

# View configuration
alias zsh-aliases="alias"
alias zsh-keybinds="bindkey -M emacs"
alias zsh-menu-keybinds="bindkey -M menuselect"

# Make sure sudo keeps the environment
alias sudo="nocorrect sudo -E "

# tmux sessionizer
alias t="~/.tmux/tmux-sessionizer.bash"

# List files
alias ls="lsd"
alias la="ls -a"
alias ll="ls -l"
alias lla="ls -la"
alias lal="ls -al"
alias lh="ls --hyperlink=auto"
alias tr="ls --tree --depth=2"
alias tra="tr -a"
alias trl="tr -l"
alias trla="tr -la"
alias tral="tr -al"
alias tree="ls --tree --depth=8"
alias treea="tree -a"
alias treel="tree -l"
alias treela="tree -la"
alias treeal="tree -al"

# Use trash instead of rm
alias rm="trash"

# Linux open
if [[ "${OS}" == "Linux" ]]
then
    alias open="xdg-open" # Open folder in GUI
fi

# Disk utility
alias du="dust"

# Neovim
alias vim="nvim"
alias v="vim ."

# Config files
alias zshconf="(cd $ZDOTDIR && vim .)"
alias zenvconf="vim ~/.zshenv"
alias zprofileconf="vim $ZDOTDIR/.zprofile"
alias terminatorconf="(cd $XDG_CONFIG_HOME/terminator && vim .)"
alias gitconf="(cd $XDG_CONFIG_HOME/git && vim .)"
alias tmuxconf="(cd $XDG_CONFIG_HOME/tmux && vim .)"
alias nvimconf="(cd $XDG_CONFIG_HOME/nvim && vim .)"

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
