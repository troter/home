function peco_select_history
  if test (count $argv) = 0
    set peco_flags --query "(commandline -b)"
  else
    set peco_flags --query "$argv"
  end

  history --null \
    | ruby -rjson -e 'puts ARGF.read.split(/\x00/).map{|c| JSON.dump(c.split("\n"))}' \
    | eval $PECO $peco_flags \
    | read foo
  if [ $foo ]
    commandline (echo $foo | ruby -rjson -e "puts JSON.parse(ARGF.read)" )
  else
    commandline ''
  end
end
