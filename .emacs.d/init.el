;;; -*- coding: utf-8; indent-tabs-mode: nil -*-

(setq user-full-name "Takumi IINO"
      user-mail-address "trot.thunder@gmail.com")

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
      elpa-directory         (expand-file-name "elpa" vendor-directory)
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

;; Setup package.el
(require 'package)
(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(setq package-user-dir elpa-directory)

(package-initialize)

(when (not (require 'melpa nil t))
  (progn
    (switch-to-buffer
     (url-retrieve-synchronously
        "https://raw.github.com/milkypostman/melpa/master/melpa.el"))
    (package-install-from-buffer  (package-buffer-info) 'single))
  (require 'melpa))

(defvar troter/packages
  '(ace-jump-mode
    ac-helm
    auto-complete
    clojure-mode
    color-moccur
    direx
    elscreen
    findr
    flymake-php
    flymake-ruby
    guide-key
    haskell-mode
    helm
    helm-c-moccur
    helm-c-yasnippet
    helm-c-moccur
    helm-c-yasnippet
    helm-descbinds
    inf-ruby
    inflections
    jump
    markdown-mode
    melpa
    php-mode
    popup
    popwin
    quickrun
    rinari
    ruby-block
    ruby-compilation
    ruby-electric
    ruby-mode
    rspec-mode
    shell-command
    shell-history
    mmm-mode
    slime
    undo-tree
    yaml-mode)
  "Default packages")

(defun abedra/packages-installed-p ()
  (loop for pkg in troter/packages
        when (not (package-installed-p pkg)) do (return nil)
        finally (return t)))

(unless (abedra/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg troter/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

;; load direcotry files.
(load-directory-files libraries-directory "^.+el$")
(load-directory-files initialize-directory "^.+el$")
(load custom-file t)

;;; End of .emacs.el
