;;; -*- coding: utf-8; indent-tabs-mode: nil -*-

;; Basic configuration.
(load "~/.emacs.d/basic.el")

;; Common Lisp extensions for Emacs.
(require 'cl)

;; Startup Helper Functions.
(require 'startup-helper "~/.emacs.d/startup-helper.el")

;; Setup directory variables.
(setq base-directory         "~/.emacs.d"
      costom-file            (expand-file-name "custom.el" base-directory)
      libraries-directory    (expand-file-name "library" base-directory)
      auto-install-directory (expand-file-name "auto-install" base-directory)
      site-lisp-directory    (expand-file-name "site-lisp" base-directory)
      initialize-directory   (expand-file-name "initialize" base-directory)
      info-directory         (expand-file-name "info" base-directory))

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
(setq tr:addition-exec-path
      (list "~/bin"
             "~/local/bin"
             "/bin"
             "/opt/local/bin"
             "/opt/local/sbin"
             "/usr/local/bin"
             "/usr/local/sbin"
             "/sbin"
             "/usr/bin"
             "/usr/sbin"
             "/usr/X11R6/bin"
             (concat (getenv "SystemDrive") "/cygwin/usr/bin")
             (concat (getenv "SystemDrive") "/cygwin/usr/sbin")
             (concat (getenv "SystemDrive") "/cygwin/usr/local/bin")
             (concat (getenv "SystemDrive") "/cygwin/usr/local/sbin")))
(setq exec-path (merge-path-list exec-path tr:addition-exec-path))

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

;; Setup elpa.
(require 'package)
(add-to-list 'package-archives
             '("elpa" . "http://tromey.com/elpa/"))
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;; load direcotry files.
(load-directory-files libraries-directory "^.+el$")
(load-directory-files initialize-directory "^.+el$")
(load costom-file t)

;;; End of .emacs.el
