;;; -*- coding: utf-8; indent-tabs-mode: nil -*-

(when (require 'sequential-command-config nil t)
  (sequential-command-setup-keys)

  (define-sequential-command seq-home
    back-to-indentation beginning-of-line beginning-of-buffer seq-return)
  ;;(define-sequential-command seq-end
  ;;  end-of-line end-of-buffer seq-return)
  )
