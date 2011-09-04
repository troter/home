;;; -*- coding: utf-8; indent-tabs-mode: nil -*-

;; (auto-install-batch "anything")

;;; ref: http://d.hatena.ne.jp/fu7mu4/20110116/1295173582
(setq warning-suppress-types nil) ;; magic word to prevent bellow error
;;; symbol's value as variable is void : warning-suppress-types

(when (require 'anything-startup)
  (require 'dired-aux)

  ;; replace completion commands with `anything'
  (anything-read-string-mode '(string file buffer variable command))
  ;; replace dired commands with `anything'
  (anything-dired-bindings 1)

  (setq anything-su-or-sudo "sudo")

  (define-key anything-map [(meta N)] 'anything-next-source)
  (define-key anything-map [(meta P)] 'anything-previous-source)
  (define-key anything-map [end] 'anything-scroll-other-window)
  (define-key anything-map [home] 'anything-scroll-other-window-down)
  (define-key anything-map [(control h)] 'backward-delete-char)
  (define-key (anything-read-file-name-map) [(meta i)] 'anything-select-action)

  ;; (auto-install-from-url "http://www.emacswiki.org/cgi-bin/wiki/download/shell-history.el")
  ;; (auto-install-from-url "http://www.emacswiki.org/cgi-bin/wiki/download/shell-command.el")
  (require 'shell-history)
  (require 'shell-command)
  (shell-command-completion-mode)
  ;; Bind C-o to complete shell history
  (anything-complete-shell-history-setup-key [(control o)])

  ;; (auto-install-from-url "http://www.emacswiki.org/cgi-bin/wiki/download/anything-kyr.el")
  ;; (auto-install-from-url "http://www.emacswiki.org/cgi-bin/wiki/download/anything-kyr-config.el")
  (require 'anything-kyr-config)
  ;; Automatically collect symbols by 100 secs
  (anything-lisp-complete-symbol-set-timer 100)

  ;; anything-find-file setting.
  (setq anything-find-file-additional-sources-at-first
        '(anything-c-source-ffap-line
          anything-c-source-ffap-guesser))
;;  (setq anything-find-file-additional-sources
;;        '(anything-c-source-locate))
  (defadvice arfn-sources
    (after additional-arfn-sources-at-first activate)
    "Add additional sources at first."
    (setq ad-return-value
          (append anything-find-file-additional-sources-at-first
                  ad-return-value)))
  ;;(ad-deactivate 'arfn-sources)
  )
