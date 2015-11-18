;;Linux Config
(when (eq system-type 'gnu/linux)
  ;;Font
  (set-default-font "Hack-12" t)
  (set-fontset-font "fontset-default" 'hangul '("NanumGothic" . "iso10646-1")))

(provide 'init-os)
