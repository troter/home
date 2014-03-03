;;;; -*- coding: utf-8; indent-tabs-mode: nil -*-

(defun-eval-after-load 'ace-jump-mode
  (ace-jump-mode-enable-mark-sync)
  (global-set-key [(control c) (?\ )] 'ace-jump-mode)
  (global-set-key [(control x) (?\ )] 'ace-jump-mode-pop-mark))

;; (@* "helm")
(defun-eval-after-load 'helm
  ;;(global-set-key [(control x) (b)] 'helm-buffers-list)    ; switch-to-buffer
  (global-set-key [(control x) (control f)] 'helm-find-files)    ; find-file
  (global-set-key [(control x) (b)] 'helm-for-files)    ; switch-to-buffer
  (global-set-key [(meta y)] 'helm-show-kill-ring)        ; yank-pop
  (global-set-key [(meta %)] 'helm-regexp)  ; query-replace-regexp
  ;; C-x a prefix
  (global-set-key [(control x) (a) (a)] 'helm-apropos)
  (global-set-key [(control x) (a) (r)] 'helm-regexp)
  (global-set-key [(control x) (a) (m)] 'helm-mark-ring)
  (global-set-key [(control x) (a) (M)] 'helm-global-mark-ring)
  (defun-eval-after-load 'helm-descbinds
    (global-set-key [(control x) (a) (d)] 'helm-descbinds))
)

(defun-eval-after-load 'helm-c-moccur
  (define-key isearch-mode-map [(meta o)] 'helm-c-moccur-from-isearch)
  (global-set-key [(meta o)] 'helm-c-moccur-occur-by-moccur) ; buffer
  (global-set-key [(control meta o)] 'helm-c-moccur-dmoccur) ; directory
)

(defun-eval-after-load 'key-chord
  ;; keybind
)

;; (@* "others")
(defun-eval-after-load 'flymake
  (global-set-key [(control c) (d)] 'flymake-display-err-menu-for-current-line))

(defun-eval-after-load 'popwin
  (global-set-key [(control x) (control p)] popwin:keymap))

;(global-set-key "\C-z" 'undo)                       ;;UNDO
(global-set-key [f1] 'one-key-menu-help)

(defun-eval-after-load 'direx
  (global-set-key [(control x) (control j)] 'direx:jump-to-directory-other-window))

;; window switch
(global-set-key [(meta \[)] (lambda () (interactive) (other-window -1)))
(global-set-key [(meta \])] (lambda () (interactive) (other-window 1)))

(global-set-key [(control x) (control r)] 'reopen-file)
(global-set-key [(control x) (J)] 'open-junk-file)

;; open
(when (functionp 'cygstart)
  (global-set-key [(control c) (control f)] 'cygstart))

(cond
 ((string-match "apple-darwin" system-configuration)
  (setq ns-command-modifier (quote meta))
  (setq ns-alternate-modifier (quote super))
  (when window-system
    (define-key global-map [ns-drag-file] 'ns-find-file))
  (global-set-key
   [(control J)]
   (lambda ()
     (interactive)
     (call-process "osascript" nil t nil "-e" "tell application \"System Events\" to key code 104")))
  (global-set-key
   [(control :)]
   (lambda ()
     (interactive)
     (call-process "osascript" nil t nil "-e" "tell application \"System Events\" to key code 102")))
  )
)
