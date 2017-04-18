;;; pawn-fonts.el --- Font
;;; Commentary:
;;; Code:
(defun linux-daemon-config ()
  "Emacs --daemon으로 실행한 경우."
  (add-to-list 'default-frame-alist '(font . "Hack-11"))
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
  "Linux Configuration."
  (set-frame-font "Hack-11" t)
  (set-fontset-font "fontset-default"
                    'hangul
                    '("NanumGothic" . "iso10646-1"))
  (set-fontset-font "fontset-default"
                    'japanese-jisx0208
                    '("VL Gothic" . "unicode-bmp")))

(cond
 ((daemonp) (linux-daemon-config))
 ((eq system-type 'gnu/linux) (linux-config)))

(provide 'pawn-fonts)
;;; pawn-fonts.el ends here
