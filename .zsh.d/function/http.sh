# -*- mode: sh -*-

function httpless {
  http --pretty=all --print=hb "$@" | less -dMFRX;
}
