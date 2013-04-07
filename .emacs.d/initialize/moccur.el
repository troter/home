;;; -*- coding: utf-8; indent-tabs-mode: nil -*-

;; color-moccur
;; (package-install 'color-moccur)
;; (auto-install-from-url "http://www.emacswiki.org/emacs/download/moccur-edit.el")
(progn
  (require 'color-moccur)
  (require 'moccur-edit)
  (dolist (mask '("\\.docx$" "\\.xlsx$" "\\.pptx$"))
    (add-to-list 'dmoccur-exclusion-mask mask))
  (setq moccur-split-word t))
;; migemoがrequireできる環境ならmigemoを使う
(when (require 'migemo nil t) ;第三引数がnon-nilだとloadできなかった場合にエラーではなくnilを返す
  (setq moccur-use-migemo t))

(defun-eval-after-load 'helm
  ;; (package-install 'helm-c-moccur)
  (when (require 'helm-c-moccur nil t)
    (setq helm-c-moccur-helm-idle-delay 0.2
          helm-c-moccur-higligt-info-line-flag t
          helm-c-moccur-enable-auto-look-flag t
          helm-c-moccur-enable-initial-pattern t)
    (defun-add-hook 'dired-mode-hook
      (local-set-key [(O)] 'helm-c-moccur-dired-do-moccur-by-moccur))))
