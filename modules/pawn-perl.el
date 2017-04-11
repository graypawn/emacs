;;; pawn-perl.el --- Perl
;;; Commentary:
;;; Code:

(defalias 'perl-mode 'cperl-mode)

(use-package cperl-mode
  :mode "\\.\\([pP][Llm]\\||psgi\\|t\\)\\'"
  :config
  (bind-key "C-d d" 'cperl-perldoc cperl-mode-map))

(add-hook 'cperl-mode-hook (lambda () (flymake-mode t)))

(provide 'pawn-perl)
;;; pawn-perl.el ends here
