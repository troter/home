alias where "command -v"
alias j="jobs -l"

if test -n "$WSL_DISTRO_NAME"
  alias ls='ls --color=tty 2>/dev/null'
end

alias l "ls -F"
alias la "ls -a"
alias lf "ls -F"
alias ll "ls -l"

alias du "du -h"
alias df "df -h"

alias su "su -l"

alias cp "cp -i"
alias rm "rm -i"
alias m "make"

alias ag "ag --pager=\$PAGER"
alias s "svn"
alias g "git"
alias h "hg"
alias c "cheat" # gem install cheat
alias p "eval \$PECO"

alias ec "emacsclient"

alias be "bundle exec"
alias bi "bundle install"
