;;; eshell에서 맨 앞에 붙는 "$" 문구를 변경한다.
(with-eval-after-load 'eshell
  (setq eshell-prompt-function
        (lambda ()
          (concat
           (car (last (split-string (eshell/pwd) "/")))
           " $ "))))

(provide 'init-eshell)
