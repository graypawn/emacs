(with-eval-after-load 'eshell
  ;;; eshell에서 맨 앞에 붙는 "$" 문구를 변경한다.
  (setq eshell-prompt-function
        (lambda ()
          (concat
           (car (last (split-string (eshell/pwd) "/")))
           " $ "))))



(provide 'init-eshell)
