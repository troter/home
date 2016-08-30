(when (autoload-if-found 'rust-mode "rust-mode")
  (add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode)))
