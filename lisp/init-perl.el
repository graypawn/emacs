(defalias 'perl-mode 'cperl-mode)
(add-to-list 'auto-mode-alist '("\\.\\([pP][Llm]\\||psgi\\|t\\)\\'" . cperl-mode))

(with-eval-after-load 'cperl-mode
  (message "Hello")
  (define-key cperl-mode-map (kbd "C-d d")  'cperl-perldoc)
  )

(provide 'init-perl)
