;;; -*- coding: utf-8; indent-tabs-mode: nil -*-

;; (auto-install-from-url "https://raw.github.com/mooz/js2-mode/master/js2-imenu-extras.el")
;; (auto-install-from-url "https://raw.github.com/mooz/js2-mode/master/js2-mode.el")
(when (autoload 'js2-mode "js2-mode" nil t)
  (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
  (defun-eval-after-load 'js2-mode
    (require 'js2-imenu-extras)
    (js2-imenu-extras-setup)))
