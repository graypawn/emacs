(setq eshell-prompt-function
      (lambda ()
  (concat
   (car (last (split-string (eshell/pwd) "/")))
   " $ ")))

(provide 'init-eshell)
