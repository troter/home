;;; init.el --- Bootstrap to config.org -*- lexical-binding: t; -*-
(require 'org)
(org-babel-load-file
 (expand-file-name "config.org" user-emacs-directory))
;;; init.el ends here
