

(if (daemonp)
    ;; Daemon
    (progn
      (add-to-list 'default-frame-alist '(font . "Hack-12"))
      (add-hook 'after-make-frame-functions
                (lambda (frame)
                  (with-selected-frame frame
                    (set-fontset-font "fontset-default" 'hangul '("NanumGothic" . "iso10646-1"))))))

  ;; Linux
  (when (eq system-type 'gnu/linux)
    (set-default-font "Hack-12" t)
    (set-fontset-font "fontset-default" 'hangul '("NanumGothic" . "iso10646-1"))))

(provide 'init-os)
