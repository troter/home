;;; -*- coding: utf-8; indent-tabs-mode: nil -*-

;;; (@* "TODO")
;;
;; - anything-with-everything.elの導入
;; -- ref: http://d.hatena.ne.jp/yaotti/20101208/1291778282
;; - anything-fileslit+の設定
;; -- http://d.hatena.ne.jp/rubikitch/20101118/anything
;; -- http://d.hatena.ne.jp/rubikitch/20100915/anything
;; - windwos上でtrampを動かす
;; -- http://highmt.wordpress.com/2009/12/19/ntemacs%E3%81%A7tramp%E3%82%92%E4%BD%BF%E3%81%86/
;; -- http://blogs.yahoo.co.jp/natto_heaven/21995009.html
;; - malabar-modeの設定
;; -- https://github.com/espenhw/malabar-mode
;; -- http://aemon.com/file_dump/ensime_manual.html
;; - clojure-mode などの設定
;; -- http://www.emacswiki.org/emacs/ClojureMode
;; -- http://d.hatena.ne.jp/t2ru/20100123/1264199643
;; -- http://www.serendip.ws/archives/4812
;; -- https://github.com/technomancy/leiningen
;; - scala-modeの設定
;; -- http://www.emacswiki.org/emacs/scala
;; -- http://aemon.com/file_dump/ensime_manual.html
;; - folding.elの設定を書く
;; - moccurとanything-c-moccurの使い方を調べる
;; - re-builder.elを試す
;; - psvn.el, dsvn.elの調査
;; - icicles.elがどんなものか試す
;; - windows, mac, linuxで利用できるsuper key, hyper keyの設定
;;   （右optionや右windowskeyに設定したい）
;;

;; Common Lisp extensions for Emacs.
(require 'cl)

;; Startup Helper Functions.
(require 'startup-helper "~/.emacs.d/startup-helper.el")

;; Setup directory variables.
(setq base-directory         "~/.emacs.d"
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
(when (load (expand-file-name "~/.emacs.d/elpa/package.el") t)
  (package-initialize))

;; load direcotry files.
(load-directory-files libraries-directory "^.+el$")
(load-directory-files initialize-directory "^\\+?init.+el$")

;;; End of .emacs.el
