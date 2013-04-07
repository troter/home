;;; -*- coding: utf-8; indent-tabs-mode: nil -*-

;; (package-install 'helm)
;; (package-install 'helm-descbinds)

(when (require 'helm-config)
  (require 'helm-command)
  (require 'helm-descbinds)
  
  (setq helm-su-or-sudo "sudo")
  (when nt-p
    (setq helm-c-locate-command "lfes -i -r %s"))

  (setq helm-for-files-preferred-list
        '(helm-source-buffers-list
          helm-source-recentf
          helm-source-buffer-not-found
          helm-source-bookmarks
          helm-source-file-cache
          helm-source-files-in-current-dir
          helm-source-locate))

  (define-key helm-map [(meta N)] 'helm-next-source)
  (define-key helm-map [(meta P)] 'helm-previous-source)
  (define-key helm-map [end] 'helm-scroll-other-window)
  (define-key helm-map [home] 'helm-scroll-other-window-down)
  (define-key helm-map [(control h)] 'backward-delete-char)
  (define-key helm-find-files-map [(meta i)] 'helm-execute-persistent-action)
  (define-key helm-read-file-map [(meta i)] 'helm-execute-persistent-action)

  ;; ;; (package-install 'shell-history)
  ;; ;; (package-install 'shell-command)
  ;; (require 'shell-history)
  ;; (require 'shell-command)
  ;; ;; Bind C-o to complete shell history
  ;; (anything-complete-shell-history-setup-key [(control o)])

  (helm-mode 1)
  )
