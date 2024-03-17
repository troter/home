(( ${+commands[peco]} )) || return

# port of https://github.com/mooz/percol/blob/v0.2.1/tools/zsh/percol.zsh
PECO_TMP_DIR=$TMPDIR/peco.zsh.tmp
if ! [ -d ${PECO_TMP_DIR} ]; then
  mkdir ${PECO_TMP_DIR}
fi

PECO_IN=${PECO_TMP_DIR}/peco-channel-in-$$
PECO_OUT=${PECO_TMP_DIR}/peco-channel-out-$$

function _peco_create_fifo() {
  [ -p $PECO_IN ] || { command rm -f $PECO_IN; mkfifo -m 600 $PECO_IN }
  [ -p $PECO_OUT ] || { command rm -f $PECO_OUT; mkfifo -m 600 $PECO_OUT }
}
function _peco_clean_fifos() {
  command rm -f $PECO_IN
  command rm -f $PECO_OUT
}
trap _peco_clean_fifos EXIT SIGINT SIGTERM

function _peco_popup_tmux() {
  _peco_create_fifo
  tmux split-window "peco $* < ${PECO_IN} > ${PECO_OUT}"
}

function _peco_popup() {
  INPUT=$1
  PECO_OPTION=$2
  if [[ -n $TMUX && -n $PECO_USE_TMUX ]]; then
    eval "_peco_popup_tmux ${PECO_OPTION}; ${INPUT} > ${PECO_IN} &; cat ${PECO_OUT}"
  else
    eval "${INPUT} | peco ${(Q)PECO_OPTION}"
  fi
}

# TODO: I'm not sure whether this process is proper or not
function _peco_clean_prompt() {
  if [[ -n $TMUX ]]; then
    zle reset-prompt
  else
    zle -R -c
  fi
}

function peco_select_history() {
  # print history in reverse order (from -1 (latest) to 1 (oldest))
  output=$(_peco_popup 'fc -l -n -1 1' '--query \"${LBUFFER}\"')

  if [[ $output != "" ]]; then
    BUFFER=$output
    CURSOR=$#BUFFER
  fi

  _peco_clean_prompt
}
zle -N peco_select_history
bindkey -M emacs '^R' peco_select_history
bindkey -M viins '^R' peco_select_history
bindkey -M vicmd '^R' peco_select_history

if (( ${+functions[marks]} )); then
  function peco_select_marks() {
    remove_color='sed -r "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[mGK]//g"'

    # parse directory from marks output (markname -> path) and quote if necessary
    output=$(_peco_popup 'marks' '--query \"${LBUFFER}\"' | eval ${remove_color})
    BUFFER=${(q)output##*-> }
    CURSOR=$#BUFFER
    _peco_clean_prompt
  }
  zle -N peco_select_marks
  bindkey -M emacs '^B' peco_select_marks
  bindkey -M viins '^B' peco_select_marks
  bindkey -M vicmd '^B' peco_select_marks
fi
