(eval-when-compile (require 'cperl-mode))
(defalias 'perl-mode 'cperl-mode)

(add-to-list 'auto-mode-alist
             '("\\.\\([pP][Llm]\\||psgi\\|t\\)\\'" . cperl-mode))

(with-eval-after-load 'cperl-mode
  (define-key cperl-mode-map (kbd "C-d d")  'cperl-perldoc))

(add-hook 'cperl-mode-hook (lambda () (flymake-mode t)))

(provide 'init-perl)
