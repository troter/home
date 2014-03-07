;;; -*- coding: utf-8; indent-tabs-mode: nil -*-

(setq user-full-name "Takumi IINO"
      user-mail-address "trot.thunder@gmail.com")
(setq default-directory "~/")

;; Basic configuration.
(load "~/.emacs.d/basic.el")

;; Load environment value if exists
(load "~/.emacs.d/shellenv.el" t nil t)

;; Common Lisp extensions for Emacs.
(require 'cl)

;; Startup Helper Functions.
(require 'startup-helper "~/.emacs.d/startup-helper.el")

;; Setup directory variables.
(setq base-directory         "~/.emacs.d"
      vendor-directory       (expand-file-name "vendor" base-directory)
      custom-file            (expand-file-name "custom.el" base-directory)
      libraries-directory    (expand-file-name "library" base-directory)
      auto-install-directory (expand-file-name "auto-install" vendor-directory)
      site-lisp-directory    (expand-file-name "site-lisp" base-directory)
      initialize-directory   (expand-file-name "initialize" base-directory)
      info-directory         (expand-file-name "info" base-directory)
      dropbox-directory      "~/Dropbox/")

;; Setup load-path.
(setq tr:addition-load-path
      (list libraries-directory
            auto-install-directory
            site-lisp-directory))
;; set load-path
(setq load-path (merge-path-list load-path tr:addition-load-path))
(load-directory-files site-lisp-directory "^subdirs\\.el$")
;; recompile
(dolist (dir tr:addition-load-path)
  (load-path-recompile dir))

;; Setup exec-path.
(dolist (path (reverse (split-string (getenv "PATH") ":")))
  (add-to-list 'exec-path path))

;; Setup Info-default-directory-list
(setq tr:addition-info-directory
      (list info-directory
            "/Applications/Emacs.app/Contents/Resources/info/"
            "/opt/local/share/info"
            "/usr/local/share/info/"
            "/usr/share/info/"
            (concat (getenv "SystemDrive") "/cygwin/usr/local/share/info/")
            (concat (getenv "SystemDrive") "/cygwin/usr/share/info/")))
(setq Info-additional-directory-list
      (merge-path-list
       Info-default-directory-list
       tr:addition-info-directory))

(if (require 'cask "~/.cask/cask.el" t)
    (cask-initialize)
  (warn "Cannot require `~/.cask/cask.el'. please install cask."))

;; load direcotry files.
(load-directory-files libraries-directory "^.+el$")
(load-directory-files initialize-directory "^.+el$")
(load custom-file t)

;;; End of .emacs.el
