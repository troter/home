function peco_pgrep
  if test (count $argv) = 0
    set peco_flag
  else
    set peco_flag --query "$argv"
  end

  ps aux|eval $PECO $percol_flags| awk '{ print $2 }'
end
