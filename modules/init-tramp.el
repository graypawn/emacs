(require 'tramp)
(setq tramp-default-method "ssh")

(with-eval-after-load 'tramp
  (add-to-list 'tramp-connection-properties
               (list (regexp-quote "ftz.hackerschool.org")
                     "locale" "LC_ALL=ko_KR.euc-kr")))

(provide 'init-tramp)
