;;; -*- coding: utf-8; indent-tabs-mode: nil -*-

(when (autoload 'js2-mode "js2-mode" nil t)
  (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
  (add-to-list 'auto-mode-alist '("\\.es6\\'" . js2-mode))
  (defun-eval-after-load 'js2-mode
    (require 'js2-imenu-extras)
    (js2-imenu-extras-setup)))
