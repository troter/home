;;; -*- coding: utf-8; indent-tabs-mode: nil -*-

(progn
  ;; ref: http://d.hatena.ne.jp/syohex/20101224/1293206906
  ;; server start for emacs-client
  (require 'server)
  (unless (server-running-p)
    (server-start))
  )
