export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENV_USE_DISTRIBUTE=true
VIRTUALENVWRAPPER_SH=$VIRTUALENVWRAPPER_SH

if [ -n "${VIRTUALENVWRAPPER_SH}" ] && [ -e ${VIRTUALENVWRAPPER_SH} ]; then
    # use ${VIRTUALENVWRAPPER_SH}
elif exists virtualenvwrapper.sh; then
    VIRTUALENVWRAPPER_SH=$(which virtualenvwrapper.sh)
elif [ -x /usr/local/share/python/virtualenvwrapper.sh ]; then
    VIRTUALENVWRAPPER_SH=/usr/local/share/python/virtualenvwrapper.sh
elif [ -x /usr/share/python/virtualenvwrapper.sh ]; then
    VIRTUALENVWRAPPER_SH=/usr/share/python/virtualenvwrapper.sh
fi

if grep $(dirname ${VIRTUALENVWRAPPER_SH}) <(echo $PATH) > /dev/null; then
else
    export PATH=$(dirname ${VIRTUALENVWRAPPER_SH}):$PATH
fi

if grep '.pyenv/shims' <(echo $VIRTUALENVWRAPPER_SH) > /dev/null; then
    # skip.
    # if run virtualenvwrapper.sh via pyenv wrapper script, zsh quits.
    # because pyenv wrapper script run command with exec.
else
    source $VIRTUALENVWRAPPER_SH
fi
