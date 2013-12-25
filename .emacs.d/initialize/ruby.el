;;; -*- coding: utf-8; indent-tabs-mode: nil -*-

(when (autoload-if-found 'ruby-mode "ruby-mode" "Mode for editing ruby source file")
  (autoload-if-found 'inf-ruby "inf-ruby" "Run an inferior Ruby process" t)

  (add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.thor$" . ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.ru$" . ruby-mode))
  (add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
  (add-to-list 'auto-mode-alist '("Thorfile$" . ruby-mode))
  (add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
  (add-to-list 'auto-mode-alist '("Capfile$" . ruby-mode))
  (add-to-list 'auto-mode-alist '("Vagrantfile$" . ruby-mode))

  (add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode))

;  (defun-eval-after-load 'auto-complete-config
;    (ac-rcodetools-initialize))

  (when (require 'hideshow)
    (add-to-list
     'hs-special-modes-alist
     '(ruby-mode "class\\|module\\|def\\|if\\|unless\\|case\\|while\\|until\\|for\\|begin\\|do" "end" "#" ruby-end-of-block nil)))
  )

(defun-eval-after-load 'ruby-mode
  (require 'ruby-additional nil t)
  (require 'ruby-electric nil t)
  (require 'ruby-block nil t)
  (require 'rspec-mode nil t)

  ;; https://gist.github.com/dgutov/1274520
  (defadvice ruby-indent-line (after unindent-closing-paren activate)
    (let ((column (current-column))
          indent offset)
      (save-excursion
        (back-to-indentation)
        (let ((state (syntax-ppss)))
          (setq offset (- column (current-column)))
          (when (and (eq (char-after) ?\))
                     (not (zerop (car state))))
            (goto-char (cadr state))
            (setq indent (current-indentation)))))
      (when indent
        (indent-line-to indent)
        (when (> offset 0) (forward-char offset)))))

  (defun-add-hook 'ruby-mode-hook
    (exec-if-bound (inf-ruby-minor-mode t))
    (exec-if-bound (ruby-electric-mode t))
    (exec-if-bound (ruby-block-mode t))
    (setq ruby-deep-indent-paren-style nil)
    (setq ruby-electric-expand-delimiters-list '( ?\{))
    ))

;; rinari
(require 'rinari)

;; rd-mode
;; rd-mode included rdtool
(when (autoload-if-found 'rd-mode "rd-mode" "major mode for ruby document formatter RD" t)
  (add-to-list 'auto-mode-alist '("\\.rd$" . rd-mode)))
