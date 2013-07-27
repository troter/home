if exists brew; then
    export HOMEBREW_NO_EMOJI=1

    mkdir -p ~/.zsh.d/func
    if [ ! -e ~/.zsh.d/func/_brew ]; then
	ln -s "$(brew --prefix)/Library/Contributions/brew_zsh_completion.zsh" ~/.zsh.d/func/_brew
    fi
    fpath=($HOME/.zsh.d/func $fpath)
    #typeset -U fpath
fi
