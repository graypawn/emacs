;;; emacs --daemon으로 실행한 경우
(defun linux-daemon-config ()
  (add-to-list 'default-frame-alist '(font . "Hack-12"))
  (add-hook 'after-make-frame-functions
            (lambda (frame)
              (with-selected-frame frame
                (set-fontset-font "fontset-default"
                                  'hangul
                                  '("NanumGothic" . "iso10646-1"))
                (set-fontset-font "fontset-default"
                                  'japanese-jisx0208
                                  '("VL Gothic" . "unicode-bmp"))))))

(defun linux-config ()
  (set-frame-font "Hack-12" t)
  (set-fontset-font "fontset-default"
                    'hangul
                    '("NanumGothic" . "iso10646-1"))
  (set-fontset-font "fontset-default"
                    'japanese-jisx0208
                    '("VL Gothic" . "unicode-bmp")))


(cond
 ((daemonp) (linux-daemon-config))
 ((eq system-type 'gnu/linux) (linux-config)))

(provide 'graypawn-os)
