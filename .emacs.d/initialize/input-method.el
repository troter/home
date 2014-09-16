;;; -*- coding: utf-8; indent-tabs-mode: nil -*-

(when (and nt-p (not meadow-p) (functionp #'mw32-ime-initialize)) ;; ntemacs-p
  (setq default-input-method "MW32-IME")
  (setq-default mw32-ime-mode-line-state-indicator "[--]")
  (setq mw32-ime-mode-line-state-indicator-list '("[--]" "[あ]" "[--]"))
  (mw32-ime-initialize)

  (wrap-function-to-control-ime 'y-or-n-p nil nil)
  (wrap-function-to-control-ime 'yes-or-no-p nil nil)
  (wrap-function-to-control-ime 'universal-argument t nil)
  (wrap-function-to-control-ime 'read-string nil nil)
  (wrap-function-to-control-ime 'read-from-minibuffer nil nil)
  (wrap-function-to-control-ime 'read-key-sequence nil nil)
  (wrap-function-to-control-ime 'map-y-or-n-p nil nil)
  (wrap-function-to-control-ime 'read-passwd t t) ; don't work as we expect.

  (add-hook 'mw32-ime-on-hook
            (function (lambda () (set-cursor-color "blue"))))
  (add-hook 'mw32-ime-off-hook
            (function (lambda () (set-cursor-color "black"))))
  (add-hook 'minibuffer-setup-hook
            (function (lambda ()
                        (if (fep-get-mode)
                            (set-cursor-color "blue")
                          (set-cursor-color "black"))))))

(when (or linux-p bsd-p)
  ;; Anthy
  ;;    CTRL-\で入力モード切替え
  (when (locate-library "anthy")
    (load-library "anthy")
    (setq default-input-method "japanese-anthy")))

(when darwin-p
  (when (and (locate-library "mozc") (executable-find "mozc_emacs_helper"))
    (load-library "mozc")
    (setq default-input-method "japanese-mozc")
    (setq mozc-helper-program-name "mozc_emacs_helper")
    (defun-eval-after-load 'auto-complete-config
      (require 'ac-mozc)
      (define-key ac-mode-map (kbd "C-c C-SPC") 'ac-complete-mozc)
      (defun tr-ac-mozc-setup ()
        (setq ac-sources
              '(ac-source-mozc ac-source-ascii-words-in-same-mode-buffers))
        (set (make-local-variable 'ac-auto-show-menu) 0.2))
      (dolist (mode (list 'rst-mode
                          'markdown-mode
                          'org-mode
                          'text-mode))
        (defun-eval-after-load mode
          (add-to-list 'ac-modes mode)
          (defun-add-hook (intern (format "%s-%s" mode "hook")) (tr-ac-mozc-setup))))
      )))
