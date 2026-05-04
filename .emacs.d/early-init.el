;;; early-init.el --- Bootstrap to early-config.org -*- lexical-binding: t; -*-
(require 'org)
(org-babel-load-file
 (expand-file-name "early-config.org" user-emacs-directory))
;;; early-init.el ends here
