;;; -*- coding: utf-8; indent-tabs-mode: nil -*-

(require 'dired-x)
(require 'wdired)

(define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)

;; sorter.el
;; (auto-install-from-url "http://www.bookshelf.jp/elc/sorter.el")
(load "sorter.el")

;; today highlight
(defface my-face-f-2 '((t (:foreground "yellow"))) nil)
(defvar my-face-f-2 'my-face-f-2)
(defun my-dired-today-search (arg)
  "Fontlock search function for dired."
  (search-forward-regexp
   (concat (format-time-string "%Y-%m-%d" (current-time)) " [0-9]....") arg t))
(defun-add-hook 'dired-mode-hook
  (font-lock-add-keywords
   major-mode
   (list '(my-dired-today-search . my-face-f-2))))

(setq dired-listing-switches "-alh")

(require 'direx)
(require 'direx-project)
(defun-eval-after-load 'popwin
  (push '(direx:direx-mode :position left :width 40 :dedicated t)
        popwin:special-display-config))

(defun tr:direx-project:jump-to-project-root-noselect:around (f)
  (interactive)
  (condition-case nil
    (apply f nil)
    (error
      (direx:jump-to-directory-noselect))))
(advice-add 'direx-project:jump-to-project-root-noselect
  :around #'tr:direx-project:jump-to-project-root-noselect:around)
