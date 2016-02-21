(require 'slime)
(setq inferior-lisp-program "/usr/bin/sbcl --noinform")
(add-to-list 'load-path "/usr/share/emacs/site-lisp/slime/")

(slime-setup '(slime-fancy))
(add-hook 'slime-repl-mode-hook 'lisp-setup)

(provide 'init-clisp)
