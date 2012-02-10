;;; -*- coding: utf-8; indent-tabs-mode: nil -*-

(when (getenv "SCALA_HOME")
  (setq scala-home (getenv "SCALA_HOME"))
  (setq scala-plugins-directory
        (expand-file-name "misc/scala-tool-support/emacs" (cygpath scala-home)))
  (when (file-exists-p scala-plugins-directory)
    (setq load-path (merge-path-list load-path (list scala-plugins-directory)))
    (require 'scala-mode-auto)))
