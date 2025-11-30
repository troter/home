# -*- coding: utf-8; mode: sh; -*-
# Prompt configuration.
# ---------------------
# |[user@host:pwd(shlvl)]                      |
# |%                                 [datetime]|
# |command is correct? [n,y,a,e]:              |
setopt prompt_subst
function prompt_setup() {
  autoload -U colors; colors
  local c_reset='%{${reset_color}%}'
  local c_black='%{${fg[black]}%}'
  local c_red='%{${fg[red]}%}'
  local c_green='%{${fg[green]}%}'
  local c_yellow='%{${fg[yellow]}%}'
  local c_blue='%{${fg[blue]}%}'
  local c_magenta='%{${fg[magenta]}%}'
  local c_cyan='%{${fg[cyan]}%}'
  local c_white='%{${fg[white]}%}'

  local c_prompt=$c_green
  local c_user=$c_green
  if [[ ${UID} = 0 ]] { c_user=$c_red }

  local shlevel="(\${SHLVL})"
  if [[ ${SHLVL} < 2 ]] { shlevel='' }

  local p_user="${c_user}%n${c_reset}"
  local p_host="${c_green}%m${c_reset}"
  local p_pwd="${c_cyan}%~${c_reset}"
  local p_prompt="${c_prompt}%#${c_reset}"
  local p_nl="$'\n'"

  if [[ "$TERM_PROGRAM" == "vscode" ]]; then
    PROMPT="[${p_pwd}${shlevel}]${p_prompt} "
  else
    PROMPT="[${p_user}@${p_host}:${p_pwd}${shlevel}]${p_nl}${p_prompt} "
  fi
  PROMPT2="${c_prompt}%_>${c_reset} "
  RPROMPT="[${c_green}%D{%Y/%m/%d %H:%M:%S}${c_reset}]"
  SPROMPT="${c_magenta}%r is correct? [n,y,a,e]:${c_reset} "
}
prompt_setup; unset -f prompt_setup
