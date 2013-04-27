export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENV_USE_DISTRIBUTE=true
if exists virtualenvwrapper.sh; then
    if which virtualenvwrapper.sh | grep '.pyenv/shims' > /dev/null; then
        # skip.
        # if run virtualenvwrapper.sh via pyenv wrapper script, zsh quits.
        # because pyenv wrapper script run command with exec.
    else
        source $(which virtualenvwrapper.sh)
    fi
fi
