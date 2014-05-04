[ -d "$HOME/.pyenv/bin" ] && PATH="$HOME/.pyenv/bin:$PATH"
[ -d "$HOME/.pyenv/shims" ] && PATH="$HOME/.pyenv/shims:$PATH"
export PATH

exists pyenv && eval "$(pyenv init - zsh)"
