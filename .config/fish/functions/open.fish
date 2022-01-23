if test -n $WSL_DISTRO_NAME
  function open
    set -l path $argv[1]
    if test -e $path
      cmd.exe /c start (wslpath -w $path) 2> /dev/null
    else
      echo (status current-command): No such file or directory
    end
  end
end
