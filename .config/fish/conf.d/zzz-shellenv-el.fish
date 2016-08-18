# create emacs env file

function __shellenv_el
  string join '' \
    '(setenv "PATH" "' \
    (string join ':' $PATH) \
    '")'
end

__shellenv_el > ~/.emacs.d/shellenv.el
