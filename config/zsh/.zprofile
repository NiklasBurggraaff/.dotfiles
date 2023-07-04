if [[ $OS == "Darwin" ]]; then
  source $HOME/.config/zsh/zprofile/macos.zsh
elif [[ $OS == "Linux" ]]; then
  source $HOME/.config/zsh/zprofile/ubuntu.zsh
fi
