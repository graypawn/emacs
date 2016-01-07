
(cond
 ((daemonp)
  (progn
    (add-to-list 'default-frame-alist '(font . "Hack-12"))
    (add-hook
     'after-make-frame-functions
     (lambda (frame)
       (with-selected-frame frame
         (set-fontset-font "fontset-default"
                           'hangul
                           '("NanumGothic" . "iso10646-1"))
         (set-fontset-font (frame-parameter nil 'font)
                           'japanese-jisx0208
                           '("VL Gothic" . "unicode-bmp")))))))
 ((eq system-type 'gnu/linux)
  (progn
    (message "This is Linux")
    (set-frame-font "Hack-12" t)
    (set-fontset-font "fontset-default" 'hangul
                      '("NanumGothic" . "iso10646-1"))
    (set-fontset-font (frame-parameter nil 'font)
                      'japanese-jisx0208
                      '("VL Gothic" . "unicode-bmp")))))

(provide 'init-os)
