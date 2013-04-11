;;; -*- coding: utf-8; indent-tabs-mode: nil -*-

(when window-system
  (load-theme 'wombat)

  ;(add-to-list 'default-frame-alist '(alpha . 92))
  ;(set-frame-parameter nil 'alpha 95)
  (setq initial-frame-alist
        (append (list
                 '(width . 120)
                 '(height . 36)
                 )
                initial-frame-alist))
  (setq default-frame-alist initial-frame-alist)
  )


(and ; hl-line
 (defface hlline-face
   '((((class color)
       (background dark))
       ;;(:background "dark state gray"))
      (:background "gray10"
                   :underline "gray24"))
     (((class color)
       (background light))
      (:background "ForestGreen"
                   :underline nil))
     (t ()))
   "*Face used by hl-line.")
 ;(if window-system
 ;    (setq hl-line-face 'hlline-face)
 ;  (setq hl-line-face 'underline))
 (global-hl-line-mode t))

(and ; window
 (setq frame-title-format ;;フレームのタイトル指定
       (concat "%b - emacs@" system-name))
)


(and ; mouse 
 (when (and windows-p window-system)
   ;;ホイールマウス
   (mouse-wheel-mode t)
   ;; マウスカーソルを消す
   (setq w32-hide-mouse-on-key t)
   (setq w32-hide-mouse-timeout 5000)))

;; refer :http://openlab.dino.co.jp/wp-content/uploads/2008/08/dotemacs-jaspace.txt
;; (auto-install-from-url "http://homepage3.nifty.com/satomii/software/jaspace.el")
;; タブ, 全角スペース、改行直前の半角スペースを表示する
(when (require 'jaspace nil t)
  (when (boundp 'jaspace-modes)
    (setq jaspace-modes (append jaspace-modes
                                (list 'php-mode
                                      'yaml-mode
                                      'javascript-mode
                                      'ruby-mode
                                      'text-mode
                                      'fundamental-mode))))
  (when (boundp 'jaspace-alternate-jaspace-string)
    (setq jaspace-alternate-jaspace-string "□"))
  (when (boundp 'jaspace-highlight-tabs)
    (setq jaspace-highlight-tabs ?^))
  (when (boundp 'jaspace-alternate-eol-string)
    (setq jaspace-alternate-eol-string nil))
  (add-hook 'jaspace-mode-off-hook
            (lambda()
              (when (boundp 'show-trailing-whitespace)
                (setq show-trailing-whitespace nil))))
  (add-hook 'jaspace-mode-hook
            (lambda()
              (progn
                (when (boundp 'show-trailing-whitespace)
                  (setq show-trailing-whitespace t))
                (face-spec-set 'jaspace-highlight-jaspace-face
                               '((((class color) (background light))
                                  (:foreground "blue"))
                                 (t (:foreground "green"))))
                (face-spec-set 'jaspace-highlight-tab-face
                               '((((class color) (background light))
                                  (:foreground "red"
                                   :background "unspecified"
                                   :strike-through nil
                                   :underline t))
                                 (t (:foreground "purple"
                                     :background "unspecified"
                                     :strike-through nil
                                     :underline t))))
                (face-spec-set 'trailing-whitespace
                               '((((class color) (background light))
                                  (:foreground "red"
                                   :background "unspecified"
                                   :strike-through nil
                                   :underline t))
                                 (t (:foreground "purple"
                                     :background "unspecified"
                                     :strike-through nil
                                     :underline t))))))))
