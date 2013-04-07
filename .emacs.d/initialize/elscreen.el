;;; -*- coding: utf-8; indent-tabs-mode: nil -*-

;; (package-install 'elscreen)
(when (require 'elscreen)
  (require 'elscreen-dired)
  (define-key elscreen-map "\C-z" 'suspend-emacs)
  (defun-eval-after-load 'helm-elscreen
    (define-key elscreen-map "\C-o" 'helm-elscreen))
  (elscreen-start))

