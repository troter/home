if [ $FOUND_PYENV -eq 0 ] ; then
  export PATH=$PYENV_ROOT/shims:$PATH
fi
