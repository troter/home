function peco_kill
  ps ax -o pid,time,command | eval $PECO --query "$LBUFFER" | awk '{print $1}' | xargs kill
end
