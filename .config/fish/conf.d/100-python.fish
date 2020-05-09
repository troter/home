# python
set -x PYTHONSTARTUP $HOME/.pythonstartup.py

# pipsi
set -x PATH $HOME/.local/bin $PATH

if command -v register-python-argcomplete > /dev/null 2>&1
  register-python-argcomplete --shell fish pipx | .
end
