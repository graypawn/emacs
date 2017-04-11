;;; pawn-scheme.el --- Scheme
;;; Commentary:
;;; Code:

(use-package geiser
  :ensure t
  :if (executable-find "guile")
  :config
  (setq geiser-default-implementation 'guile))

(use-package scheme-mode
  :init
  (setq scheme-program-name "guile")
  (add-hook 'scheme-mode-hook 'lisp-setup))

(provide 'pawn-scheme)
;;; pawn-scheme.el ends here
