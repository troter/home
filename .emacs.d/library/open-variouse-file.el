;;; -*- coding: utf-8; indent-tabs-mode: nil -*-

(defun open-directory-with-helm-find-files (dir)
  (let ((default-directory (concat dir "/")))
    (if (functionp 'helm-find-files-1)
        (helm-find-files-1 default-directory)
      (find-file default-directory))))

;; open user init files.
(defun open-init-file ()
  (interactive)
  (find-file-other-window user-init-file))

(defun dropbox ()
  (interactive)
  (open-directory-with-helm-find-files dropbox-directory))

(defun open-base-directory ()
  (interactive)
  (open-directory-with-helm-find-files base-directory))

(defun open-conf-directory ()
  (interactive)
  (open-directory-with-helm-find-files conf-directory))

(defun open-libraries-directory ()
  (interactive)
  (open-directory-with-helm-find-files libraries-directory))
