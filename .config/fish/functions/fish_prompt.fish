function fish_prompt --description 'Write out the prompt'
  echo -n [

  # User
  set_color $fish_color_user
  echo -n (whoami)
  set_color normal

  echo -n '@'

  # Host
  set_color $fish_color_host
  echo -n (hostname -s)
  set_color normal

  echo -n ':'
  # PWD
  set_color $fish_color_cwd
  echo -n (prompt_pwd)
  set_color normal

  # VCS
  #__terlar_git_prompt
  #__fish_hg_prompt
  # echo

  echo -n ]

  echo

  set -l last_status $status

  if not test $last_status -eq 0
    set_color $fish_color_error
  end

  echo -n '% '
  set_color normal
end
