# create emacs env file

function __shellenv_el
  echo '(setenv'
  for p in $PATH
    echo \"$p\"
  end
  echo ')'
end

__shellenv_el > ~/.emacs.d/shellenv.el
