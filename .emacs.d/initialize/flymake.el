;;; -*- coding: utf-8; indent-tabs-mode: nil -*-
;; refer: http://openlab.dino.co.jp/wp-content/uploads/2008/08/dot-emacs.txt
(when (require 'flymake nil t)
  (defun-eval-after-load 'php-mode
    (require 'flymake-php)
    (add-hook 'php-mode-hook 'flymake-php-load))
  (defun-eval-after-load 'ruby-mode
    (require 'flymake-ruby)
    (add-hook 'ruby-mode-hook 'flymake-ruby-load))

  ;; JavaScript用設定
  (defvar flymake-lint-javascript "jsl")
  (when (executable-find flymake-lint-javascript)
    (when (not (fboundp 'flymake-javascript-init))
      ;; flymake-javascript-initが未定義のバージョンだったら、自分で定義する
      (defun flymake-javascript-init ()
        (let* ((temp-file (flymake-init-create-temp-buffer-copy
                           'flymake-create-temp-inplace))
               (local-file (file-relative-name
                            temp-file
                            (file-name-directory buffer-file-name))))
          ;;(list "js" (list "-s" local-file))
          (list flymake-lint-javascript (list "-process" local-file))
          ))
      (setq flymake-allowed-file-name-masks
            (append
             flymake-allowed-file-name-masks
             '(("\\.json$" flymake-javascript-init)
               ("\\.js$" flymake-javascript-init))))
      (setq flymake-err-line-patterns
            (cons
             '("\\(.+\\)(\\([0-9]+\\)): \\(?:lint \\)?\\(\\(?:warning\\|SyntaxError\\):.+\\)" 1 2 nil 3)
             flymake-err-line-patterns)))
    (defun-add-hook 'javascript-mode-hook (flymake-mode t)))

  (defvar flymake-lint-elisp (concat base-directory "/bin/elisplint"))
  (when (executable-find flymake-lint-elisp)
    (when (not (fboundp 'flymake-elisp-init))
      (defun flymake-elisp-init ()
        (let* ((temp-file   (flymake-init-create-temp-buffer-copy
                             'flymake-create-temp-inplace))
               (local-file  (file-relative-name
                             temp-file
                             (file-name-directory buffer-file-name))))
          (list flymake-lint-elisp (list "-p" emacs-bin local-file))))
      (push '("\\.el$" flymake-elisp-init) flymake-allowed-file-name-masks)
      ;(defun-add-hook 'emacs-lisp-mode-hook
      ;  (when buffer-file-name
      ;    (flymake-mode t)))
      ))
)
