;;; -*- coding: utf-8; indent-tabs-mode: nil -*-

(defvar tr-memo-file "~/Dropbox/memo/memo.org")

(defun open-memo-file ()
  (interactive)
    (find-file-other-window tr-memo-file))


