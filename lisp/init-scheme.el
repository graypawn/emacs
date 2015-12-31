(setq scheme-program-name "guile")

(add-hook 'scheme-mode-hook 'lisp-setup)

(require-package 'geiser)

(provide 'init-scheme)

