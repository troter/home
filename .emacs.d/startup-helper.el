;; startup-helper.el - Startup Helper

;; Emacs program.
(defvar emacs-bin (car command-line-args))

;; (@* "utilities")
;; refer: http://d.hatena.ne.jp/tomoya/20090807/1249601308
(defun x->bool (elt) (not (not elt)))

(defun flatten (lis)
  "Removes nestings from a list."
  (cond ((atom lis) lis)
        ((listp (car lis))
         (append (flatten (car lis)) (flatten (cdr lis))))
        (t (append (list (car lis)) (flatten (cdr lis))))))

(defun fold-right (proc init lis)
  (if lis
      (funcall proc (car lis) (fold-right proc init (cdr lis))) init))

(defun fold-left (proc init lis)
  (if lis (fold-left proc (funcall proc init (car lis)) (cdr lis)) init))

(defalias 'fold 'fold-left)

(defun compose (&rest flist)
  `(lambda (&rest args)
     (dolist (f
              '(,@(reverse flist))
              (car args))
       (setq args
             (list (apply f args))))))

;; (@* "predicates")
;; emacs-version predicates
(dolist (ver '("22" "23" "23.0" "23.1" "23.2" "24" "24.0" "24.1" "24.2"))
  (set (intern (concat "emacs" ver "-p"))
       (if (string-match (concat "^" ver) emacs-version)
           t nil)))

;; system-type predicates
(setq darwin-p  (eq system-type 'darwin)
      ns-p      (eq window-system 'ns)
      carbon-p  (eq window-system 'mac)
      bsd-p     (eq system-type 'berkeley-unix)
      linux-p   (eq system-type 'gnu/linux)
      colinux-p (when linux-p
                  (let ((file "/proc/modules"))
                    (and
                     (file-readable-p file)
                     (x->bool
                      (with-temp-buffer
                        (insert-file-contents file)
                        (goto-char (point-min))
                        (re-search-forward "^cofuse\.+" nil t))))))
      cygwin-p  (eq system-type 'cygwin)
      nt-p      (eq system-type 'windows-nt)
      meadow-p  (featurep 'meadow)
      windows-p (or cygwin-p nt-p meadow-p))

(defun load-path-recompile (dir)
  (let (save-abbrevs) (byte-recompile-directory dir)))

(defun merge-path-list (init lis)
  (fold-right (lambda (x y)
          (let ((expanded-name (expand-file-name x)))
            (if (file-accessible-directory-p x)
                (append (list expanded-name)
                        (delete x (delete expanded-name y)))
              y)))
        init lis))

;; (@* "load configuration files.")
(defun load-directory-files (dir &optional regex)
  (let*
      ((regex (or regex ".+"))
       (files (and
               (file-accessible-directory-p dir)
               (directory-files dir 'full regex))))
    (mapc (lambda (file)
            (when (load file nil t)
              (message "`%s' loaded." file))) files)))

(provide 'startup-helper)
;; startup-helper ends here
