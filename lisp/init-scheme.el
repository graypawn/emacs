(require-package 'geiser)

(defun scheme-setup ()
  (setq scheme-program-name "guile")
  (lisp-setup)
  (geiser-mode t))

(add-hook 'scheme-mode-hook 'scheme-setup)
(setq geiser-default-implementation 'guile)

(provide 'init-scheme)

