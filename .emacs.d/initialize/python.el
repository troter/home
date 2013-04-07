;;; -*- coding: utf-8; indent-tabs-mode: nil -*-

;; ref: http://www.emacswiki.org/emacs/ProgrammingWithPythonModeDotEl
;; ref: http://www.emacswiki.org/emacs/PythonProgrammingInEmacs
(when (autoload-if-found 'python-mode "python-mode" "Python Mode." t)
  (add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
  (add-to-list 'interpreter-mode-alist '("python" . python-mode))

  )


