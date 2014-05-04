[ -d "$HOME/.rbenv/bin" ] && PATH="$HOME/.rbenv/bin:$PATH"
[ -d "$HOME/.rbenv/shims" ] && PATH="$HOME/.rbenv/shims:$PATH"
export PATH

exists rbenv && eval "$(rbenv init - zsh)"
