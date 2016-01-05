(require 'tramp)

(setq tramp-default-method "ssh")
(when (boundp 'tramp-connection-properties)
  (add-to-list 'tramp-connection-properties
               (list (regexp-quote "hackerschool")
                     "locale" "LC_ALL=ko_KR.euc-kr")))

(provide 'init-tramp)
