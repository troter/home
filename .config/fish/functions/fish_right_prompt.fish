function fish_right_prompt --description 'Write out the right prompt'
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
end
