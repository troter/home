;;; -*- coding: utf-8; indent-tabs-mode: nil -*-

(when (require 'elscreen)
  (define-key elscreen-map "\C-z" 'suspend-emacs)
  (defun-eval-after-load 'helm-elscreen
    (define-key elscreen-map "\C-o" 'helm-elscreen))
  (elscreen-start))

