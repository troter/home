;;; -*- coding: utf-8; indent-tabs-mode: nil -*-

(when window-system
  (cond
   (windows-p
    (cond
     ((or emacs23-p emacs24-p)
      ;(set-default-font "M+2VM+IPAG circle-8")
      (set-default-font "M+2VM+IPAG circle-10"))
     (t
      (setq w32-use-w32-font-dialog nil)
      (setq scalable-fonts-allowed t)
      (setq w32-enable-synthesized-fonts t)
      (create-fontset-from-fontset-spec
       (concat
        "-*-Courier New-normal-r-*-*-12-*-*-*-c-*-fontset-TTG12c,"
        "japanese-jisx0208:-*-ＭＳ ゴシック-*-*-*-*-*-*-*-*-*-*-jisx0208-sjis,"
        "latin-jisx0201:-*-ＭＳ ゴシック-*-*-*-*-*-*-*-*-*-*-jisx0208-sjis,"
        "katakana-jisx0201:-*-ＭＳ ゴシック-*-*-*-*-*-*-*-*-*-*-jisx0208-sjis,"
        "mule-unicode-e000-ffff:-*-ＭＳ ゴシック-*-*-*-*-*-*-*-*-*-*-iso10646-1") t)
      (setcdr (assoc 'font default-frame-alist) "fontset-default")
      (set-frame-font "fontset-default"))))
   (carbon-p)
   (ns-p
    (global-set-key [s-mouse-1] 'browse-url-at-mouse)
    (let* ((size 12)
           (jpfont "Hiragino Maru Gothic ProN")
           (asciifont "Monaco")
           (h (* size 10)))
      (set-face-attribute 'default nil :family asciifont :height h)
      (set-fontset-font t 'katakana-jisx0201 jpfont)
      (set-fontset-font t 'japanese-jisx0208 jpfont)
      (set-fontset-font t 'japanese-jisx0212 jpfont)
      (set-fontset-font t 'japanese-jisx0213-1 jpfont)
      (set-fontset-font t 'japanese-jisx0213-2 jpfont)
      (set-fontset-font t '(#x0080 . #x024F) asciifont))
    (setq face-font-rescale-alist
          '(("^-apple-hiragino.*" . 1.2)
            (".*-Hiragino Maru Gothic ProN-.*" . 1.2)
            (".*osaka-bold.*" . 1.2)
            (".*osaka-medium.*" . 1.2)
            (".*courier-bold-.*-mac-roman" . 1.0)
            (".*monaco cy-bold-.*-mac-cyrillic" . 0.9)
            (".*monaco-bold-.*-mac-roman" . 0.9)
            ("-cdac$" . 1.3)))
    ;; C-x 5 2 で新しいフレームを作ったときに同じフォントを使う
    (setq frame-inherited-parameters '(font tool-bar-lines))
    )
   (t
    (dolist (weight '(((name . "medium") (suffix . "r"))
                      ((name . "bold") (suffix . "b"))))
      (dolist (size '("10" "12"))
        (create-fontset-from-fontset-spec
         (funcall (compose
                   (lambda (s) (replace-regexp-in-string "%suffix%" (cdr (assoc 'suffix weight)) s))
                   (lambda (s) (replace-regexp-in-string "%weight%" (cdr (assoc 'name weight)) s))
                   (lambda (s) (replace-regexp-in-string "%size%" size s)))
                  (concat
                   "-mplus-*-mplus-r-normal--%size%-*-*-*-*-*-fontset-mplus_%size%%suffix%,"
                   "ascii:-mplus-gothic-%weight%-r-normal--%size%-*-iso8859-1,"
                   "japanese-jisx0208:-mplus-gothic-%weight%-r-normal--%size%-*-jisx0208.1990-0,"
                   "katakana-jisx0201:-mplus-gothic-%weight%-r-normal--%size%-*-jisx0201.1976-0")))))
    (set-default-font "fontset-mplus_12r"))))
