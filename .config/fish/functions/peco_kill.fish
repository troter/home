function peco_kill
  ps ax -o pid,time,command | eval $PECO --query (commandline -b) | awk '{print $1}' | xargs kill
end
