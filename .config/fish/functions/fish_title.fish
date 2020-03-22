function fish_title
  if command -s tmux > /dev/null
    if tmux info &> /dev/null
      if [ "fish" != $_ ]
        tmux rename-window (string sub -s 1 -l 20 "$argv")
      else
        tmux_directory_title
      end
    end
  end
end

function tmux_directory_title
  if [ "$PWD" != "$LPWD" ]
    set LPWD "$PWD"
    set INPUT $PWD
    set SUBSTRING (eval echo $INPUT| awk '{ print substr( $0, length($0) - 19, length($0) ) }')
    tmux rename-window "..$SUBSTRING"
  end
end
