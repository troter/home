;;; -*- coding: utf-8; indent-tabs-mode: nil -*-

(when window-system
  (load-theme 'tsdh-dark)

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

(when (require 'highlight-indentation)
  (set-face-background 'highlight-indentation-face "#e3e3d3")
  (set-face-background 'highlight-indentation-current-column-face "#c3b3b3")
  (add-hook 'highlight-indentation-mode-hook 'highlight-indentation-current-column-mode)

  (defun-eval-after-load 'ruby-mode
    (add-hook 'ruby-mode-hook 'highlight-indentation-mode))
  (defun-eval-after-load 'python-mode
    (add-hook 'python-mode-hook 'highlight-indentation-mode))
)

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

(require 'powerline)
(defface troter/powerline-active-major-mode
 '((t (:foreground "white" :background "gray22" :inherit mode-line)))
  "Powerline face 1."
  :group 'powerline)
(defface troter/powerline-inactive-major-mode
  '((t (:foreground "white" :background "grey11" :inherit mode-line-inactive)))
  "Powerline face 1."
  :group 'powerline)
(defface troter/powerline-active-minor-mode
 '((t (:foreground "gray66" :background "gray22" :inherit mode-line)))
  "Powerline face 1."
  :group 'powerline)
(defface troter/powerline-inactive-minor-mode
  '((t (:foreground "gray66" :background "grey11" :inherit mode-line-inactive)))
  "Powerline face 1."
  :group 'powerline)
(defface troter/powerline-active-position
 '((t (:foreground "white" :background "gray22" :inherit mode-line)))
  "Powerline face 1."
  :group 'powerline)
(defface troter/powerline-inactive-position
  '((t (:foreground "white" :background "grey11" :inherit mode-line-inactive)))
  "Powerline face 1."
  :group 'powerline)
(defun troter/powerline-theme ()
  "Setup the default mode-line."
  (interactive)
  (setq-default mode-line-format
                '("%e"
                  (:eval
                   (let* ((active (powerline-selected-window-active))
                          (mode-line (if active 'mode-line 'mode-line-inactive))
                          (face1 (if active 'powerline-active1 'powerline-inactive1))
                          (face-major-mode (if active 'troter/powerline-active-major-mode 'troter/powerline-inactive-major-mode))
                          (face-minor-mode (if active 'troter/powerline-active-minor-mode 'troter/powerline-inactive-minor-mode))
                          (face-position (if active 'troter/powerline-active-position 'troter/powerline-inactive-position))
                          (face2 (if active 'powerline-active2 'powerline-inactive2))
                          (separator-left (intern (format "powerline-%s-%s"
                                                          powerline-default-separator
                                                          (car powerline-default-separator-dir))))
                          (separator-right (intern (format "powerline-%s-%s"
                                                           powerline-default-separator
                                                           (cdr powerline-default-separator-dir))))
                          (lhs (list (powerline-raw "%*" nil 'l)
                                     (powerline-buffer-size nil 'l)
                                     (powerline-raw mode-line-mule-info nil 'l)
                                     (funcall separator-left mode-line face-position)
                                     (powerline-raw "%l" face-position 'l)
                                     (powerline-raw ":" face-position)
                                     (powerline-raw "%c" face-position 'r)
                                     (powerline-raw "%p" face-position 'r)
                                     (funcall separator-left face-position mode-line)
                                     (powerline-buffer-id nil 'l)
                                     (when (and (boundp 'which-func-mode) which-func-mode)
                                       (powerline-raw which-func-format nil 'l))
                                     (powerline-raw " ")
                                     (funcall separator-left mode-line face1)
                                     (when (boundp 'erc-modified-channels-object)
                                       (powerline-raw erc-modified-channels-object face1 'l))
                                     (powerline-major-mode face-major-mode 'l)
                                     (powerline-process face1)
                                     (powerline-minor-modes face-minor-mode 'l)
                                     (powerline-narrow face1 'l)
                                     (powerline-raw " " face1)
                                     (funcall separator-left face1 face2)
                                     (powerline-vc face2 'r)))
                          (rhs (list (funcall separator-right face2 mode-line)
                                     (powerline-raw global-mode-string nil 'r)
                                     (powerline-hud face1 face1))))
                     (concat (powerline-render lhs)
                             (powerline-fill face2 (powerline-width rhs))
                             (powerline-render rhs)))))))
(troter/powerline-theme)
