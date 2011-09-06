;;; -*- coding: utf-8; indent-tabs-mode: nil -*-

;;; misc
(auto-compression-mode t) ;;日本語infoの文字化け防止
(setq system-uses-terminfo nil)

;; (auto-install-from-url "http://stud4.tuwien.ac.at/~e0225855/linum/linum.el")
(when emacs22-p
  (require 'linum))

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

;; (auto-install-from-url "http://www.dr-qubit.org/undo-tree/undo-tree.el")
(require 'undo-tree)
(global-undo-tree-mode)

;; (auto-install-from-url "https://raw.github.com/m2ym/popwin-el/v0.3/popwin.el")
(require 'popwin)
(setq display-buffer-function 'popwin:display-buffer)
(push '(dired-mode :position top) popwin:special-display-config)
(defun-eval-after-load 'anything
  (setq anything-samewindow nil)
  (setq tr:anything-buffer-name-list
        '(
          ;;"*anything*"
          "*anything find-file*"
          "*anything file list*"
          "*anything for files*"
          "*anything apropos*"))
  (dolist (b tr:anything-buffer-name-list)
    (push (list b :height 20) popwin:special-display-config)))


;; org-remember
(org-remember-insinuate)
(setq org-directory "~/Dropbox/memo/")
(setq org-default-notes-file (concat org-directory "note.org"))
(setq org-remember-templates
      '(("Todo" ?t "** TODO %? %T\n   %i\n   %a" nil "Inbox")
        ("Bug" ?b "** TODO %?   :bug: %T\n   %i\n   %a" nil "Inbox")
        ("Conference" ?c "** %? %T\n   %i" nil "Conference minutes")
        ("Idea" ?i "** %? %T\n   %i\n   %a" nil "New Ideas")
        ("Note" ?n "** %? %T\n   %i\n   %a" nil "Note")
        ))
