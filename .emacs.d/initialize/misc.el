;;; -*- coding: utf-8; indent-tabs-mode: nil -*-

;;; misc

;; protbuf
;; (auto-install-from-url "http://www.splode.com/~friedman/software/emacs-lisp/src/protbuf.el")
;; (require 'protbuf) 

;; Auto save buffers enhanced
;; (auto-install-from-url "http://svn.coderepos.org/share/lang/elisp/auto-save-buffers-enhanced/trunk/auto-save-buffers-enhanced.el" )
;; (require 'auto-save-buffers-enhanced)
;; (auto-save-buffers-enhanced-include-only-checkout-path t)
;; (auto-save-buffers-enhanced t)

;; (auto-install-from-url "http://www.emacswiki.org/emacs/download/recentf-ext.el")
(when (require 'recentf-ext nil t)
  (setq recentf-max-saved-items 2000)
  (setq recentf-exclude '(".recentf"))
  (setq recentf-auto-cleanup 10)
  (run-with-idle-timer 30 t 'recentf-save-list))

(require 'undo-tree)
(global-undo-tree-mode)

(require 'popwin)
(setq display-buffer-function 'popwin:display-buffer)
(push '(dired-mode :position top) popwin:special-display-config)
(defun-eval-after-load 'helm
  (setq helm-samewindow nil)
  (push '("^\*helm.+\*$" :regexp t) popwin:special-display-config))

(require 'guide-key)
(setq guide-key/guide-key-sequence
      '(
        "C-x C-p"
        "C-x RET"
        "C-x ESC"
        "C-x 4"
        "C-x 5"
        "C-x 8"
        "C-x a"
        "C-x c"
        "C-x n"
        "C-x r"
        "C-x @"
        "C-c"
        "M-g"
        "M-s"
        "ESC g"
        "ESC s"
        ))
(setq guide-key/recursive-key-sequence-flag t)
(setq guide-key/popup-window-position 'bottom)
(guide-key-mode 1)

;; org-remember
;;(org-remember-insinuate)
(setq org-directory "~/Dropbox/memo/")
(setq org-default-notes-file (concat org-directory "note.org"))
(setq org-remember-templates
      '(("Todo" ?t "** TODO %? %T\n   %i\n   %a" nil "Inbox")
        ("Bug" ?b "** TODO %?   :bug: %T\n   %i\n   %a" nil "Inbox")
        ("Conference" ?c "** %? %T\n   %i" nil "Conference minutes")
        ("Idea" ?i "** %? %T\n   %i\n   %a" nil "New Ideas")
        ("Note" ?n "** %? %T\n   %i\n   %a" nil "Note")
        ))

(require 'quickrun)

(require 'ace-jump-mode)
