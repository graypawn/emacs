
(cond
 ((daemonp)
  (progn
    (add-to-list 'default-frame-alist '(font . "Hack-12"))
    (add-hook 'after-make-frame-functions
              (lambda (frame)
                (with-selected-frame frame
                  (set-fontset-font "fontset-default"
                                    'hangul
                                    '("NanumGothic" . "iso10646-1"))
                  (set-fontset-font "fontset-default"
                                    'japanese-jisx0208
                                    '("VL Gothic" . "unicode-bmp")))))))

 ((eq system-type 'gnu/linux)
  (progn (set-default-font "Hack-12" t)
         (set-fontset-font "fontset-default"
                           'hangul
                           '("NanumGothic" . "iso10646-1"))
         (set-fontset-font "fontset-default"
                           'japanese-jisx0208
                           '("VL Gothic" . "unicode-bmp")))))

(provide 'init-os)
 
                           
