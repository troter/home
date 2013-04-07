;;;; -*- coding: utf-8; indent-tabs-mode: nil -*-

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
  (global-set-key [(meta o)] 'helm-c-moccur-occur-by-moccur) ; buffer
  (global-set-key [(control meta o)] 'helm-c-moccur-dmoccur) ; directory
)

(defun-eval-after-load 'key-chord
  ;; keybind
)
;; (@* "one key")
(defun-eval-after-load 'one-key
  (global-set-key [(control x) (v)] 'one-key-menu-VC))

;; (@* "others")
(defun-eval-after-load 'flymake
  (global-set-key [(control c) (d)] 'flymake-display-err-menu-for-current-line))

(defun-eval-after-load 'anything-rurima
  (global-set-key [(control c) (r)] 'anything-rurima)
  (global-set-key [(control c) (control r)] 'anything-rurima-at-point))

(defun-eval-after-load 'popwin
  (global-set-key [(control x) (control p)] popwin:keymap))

;(global-set-key "\C-z" 'undo)                       ;;UNDO
(global-set-key [f1] 'one-key-menu-help)

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
  )
)
