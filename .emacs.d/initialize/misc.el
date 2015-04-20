;;; -*- coding: utf-8; indent-tabs-mode: nil -*-

;;; misc

(when (require 'recentf-ext nil t)
  (setq recentf-max-saved-items 2000)
  (setq recentf-exclude '(".recentf"))
  (setq recentf-auto-cleanup 10)
  (run-with-idle-timer 30 t 'recentf-save-list))

(require 'undo-tree)
(global-undo-tree-mode)

(require 'undohist)
(undohist-initialize)

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

(require 'open-junk-file)
(setq open-junk-file-format "~/Dropbox/memo/junk/%Y/%m/%Y-%m-%d-%H%M%S.")

(require 'quickrun)

(require 'ace-jump-mode)

(require 'edit-server)
(setq edit-server-new-frame nil)
(setq edit-server-port 19292)
(edit-server-start)

(load "editorconfig")

(require 'stripe-buffer)
(add-hook 'dired-mode-hook 'stripe-listify-buffer)

(let ((cmigemo-bin (executable-find "cmigemo")))
  (when cmigemo-bin
    (require 'migemo)
    (setq migemo-command cmigemo-bin)
    (setq migemo-options '("-q" "--emacs"))
    (setq migemo-dictionary "/usr/local/share/migemo/utf-8/migemo-dict")
    (setq migemo-user-dictionary nil)
    (setq migemo-regex-dictionary nil)
    (setq migemo-coding-system 'utf-8-unix)))

(cond
 ((string-match "apple-darwin" system-configuration)
  (defun copy-from-osx ()
    (shell-command-to-string "cb -p"))

  (defun paste-to-osx (text &optional push)
    (let ((process-connection-type nil))
      (let ((proc (start-process "cb" "*Messages*" "cb")))
        (process-send-string proc text)
        (process-send-eof proc))))

  (setq interprogram-cut-function 'paste-to-osx)
  (setq interprogram-paste-function 'copy-from-osx)))
