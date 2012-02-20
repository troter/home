;; -*- no-byte-compile: t -*-
;; In load-path, after this directory should come
;; certain of its subdirectories.  Here we specify them.

(defvar package-resource
  '("yasnippet-0.6.1c"
    "elscreen-dired-0.1.0" "apel-10.8"
    "auto-complete-1.3.1"
    "rhtml"))

(setq load-path
      (merge-path-list
       load-path
       (mapcar #'(lambda (package) (expand-file-name package site-lisp-directory))
               package-resource)))
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; End:
