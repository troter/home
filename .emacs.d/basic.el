;;; -*- coding:utf-8; indent-tabs-mode:nil -*-

;; Basic configuration.
;; ====================

;; Non-nil inhibits the startup screen.
(setq inhibit-startup-message t)


;; window
;; ------
;; display scroll bar at right
(set-scroll-bar-mode 'right)
;; tool-bar mode is disabled
(tool-bar-mode 0)
;; tool-bar mode is disabled
(menu-bar-mode -1)


;; highlight effect
;; ----------------
;; when the mark is active, the region is highlighted.
(transient-mark-mode t)
;; When Show Paren mode is enabled, any matching parenthesis is highlighted
(show-paren-mode t)
;; Non-nil means try to flash the frame to represent a bell.
(setq visible-bell t)


;; mode line
;; ---------
(setq line-number-mode t)
(setq column-number-mode t)
(display-time)
;; show new line code
(setq eol-mnemonic-unix  "(LF)")
(setq eol-mnemonic-dos  "(CRLF)")
(setq eol-mnemonic-mac  "(CR)")


;; language
;; --------
(set-language-environment "Japanese")
(mapc #'prefer-coding-system
        '(shift_jis iso-2022-jp euc-jp utf-8-unix))


;; editting
;; --------
;; typed text replaces the selection.
(delete-selection-mode 1)
;; cutting and pasting uses the clipboard.
(setq x-select-enable-clipboard t)
;; ;; kill that many lines starting from the current line.
;; (setq kill-whole-line t)

;; no-kill-new-duplicates.
;; http://www.fan.gr.jp/~ring/Meadow/meadow.html#ys:no-kill-new-duplicates
(defadvice kill-new (before ys:no-kill-new-duplicates activate)
  (setq kill-ring (delete (ad-get-arg 0) kill-ring)))


;; save
;; ----
;; add a newline automatically at the end of the file.
(setq require-final-newline t)
;; Make file executable according to umask if not already executable.
(add-hook 'after-save-hook 'executable-make-buffer-file-executable-if-script-p)


;; backup file
;; -----------
(setq make-backup-files t)
(setq backup-directory-alist
      (cons (cons "\\.*$" (expand-file-name "~/.emacs.d/backup"))
            backup-directory-alist))


;; buffer
;; ------
;; allow minibuffer commands while in the minibuffer.
(setq enable-recursive-minibuffers t)

;; save minibuffer content
;; ref: http://d.hatena.ne.jp/rubikitch/20091216/minibuffer
(defadvice abort-recursive-edit (before minibuffer-save activate)
  (when (eq (selected-window) (active-minibuffer-window))
    (add-to-history minibuffer-history-variable (minibuffer-contents))))

;; unique buffer names dependent on file name
(when (require 'uniquify nil t)
  (setq uniquify-buffer-name-style 'post-forward-angle-brackets)
  ;; ignore special buffer
  (setq uniquify-ignore-buffers-re "*[^*]+*"))

;; truncate-lines
(setq truncate-lines nil)
(setq truncate-partial-width-windows nil)


;; completion ignore case
;; ----------------------
(setq completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)
(setq read-buffer-completion-ignore-case t)


;; shell
;; -----
(autoload 'ansi-color-for-comint-mode-on "ansi-color"
  "Set `ansi-color-for-comint-mode' to t." t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(add-hook 'comint-output-filter-functions
          'comint-watch-for-password-prompt)


;; keybinding
;; ----------
(global-set-key [(control h)] 'backward-delete-char)
(define-key isearch-mode-map [(control h)] 'isearch-delete-char)

;; basic.el end here.
