;;; -*- coding: utf-8; indent-tabs-mode: nil -*-

;; ref: http://www.haskell.org/haskellwiki/Haskell_mode_for_Emacs
(when (autoload-if-found 'haskell-mode "haskell-site-file" "haskell Mode." t)
  (add-to-list 'auto-mode-alist '("\\.hs\\'" . haskell-mode))
  (require 'inf-haskell)
  (add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
  (add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
  )
