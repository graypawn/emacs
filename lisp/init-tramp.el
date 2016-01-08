(setq tramp-default-method "ssh")

;; (require 'tramp)

(with-eval-after-load 'tramp
  (add-to-list 'tramp-connection-properties
               (list (regexp-quote "ftz.hackerschool.org")
                     "locale" "LC_ALL=ko_KR.euc-kr")))

(provide 'init-tramp)
