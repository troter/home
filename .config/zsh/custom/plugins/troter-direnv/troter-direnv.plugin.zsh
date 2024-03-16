if [[ $(whence direnv) != "" ]]; then
  eval "$(direnv hook zsh)"
fi
