function peco_pgrep
  if test (count $argv) = 0
    set peco_flags
  else
    set peco_flags --query "$argv"
  end

  ps aux | eval $PECO $peco_flags | awk '{ print $2 }'
end
