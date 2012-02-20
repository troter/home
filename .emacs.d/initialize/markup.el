;;; -*- coding: utf-8; indent-tabs-mode: nil -*-

;; (auto-install-from-url "http://docutils.sourceforge.net/tools/editors/emacs/rst.el")
(when (autoload-if-found 'rst-mode "rst.el" "Major mode for editing reStructuredText-documents" t)
  (add-to-list 'auto-mode-alist '("\\.rst$" . rst-mode))
  (add-to-list 'auto-mode-alist '("\\.rest$" . rst-mode)))

;; (auto-install-from-url "http://jblevins.org/projects/markdown-mode/markdown-mode.el")
(when (autoload-if-found 'markdown-mode "markdown-mode.el" "Major mode for editing Markdown files" t)
  (add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))
  (add-to-list 'auto-mode-alist '("\\.markdown$" . markdown-mode)))

(when (autoload-if-found 'nxml-mode "nxml-mode.el" "a new XML mode" t)
  (add-to-list 'auto-mode-alist '("\\.xml$" . nxml-mode))
  (add-to-list 'auto-mode-alist '("\\.xsd$" . nxml-mode))
  (add-to-list 'auto-mode-alist '("\\.xslt$" . nxml-mode))
  (add-to-list 'auto-mode-alist '("\\.svg$" . nxml-mode))
  (add-to-list 'auto-mode-alist '("\\.rss$" . nxml-mode))

  (unify-8859-on-decoding-mode)

  (fset 'xml-mode 'nxml-mode)
  (fset 'html-mode 'nxml-mode))

(when (require 'yaml-mode)
  (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode)))
