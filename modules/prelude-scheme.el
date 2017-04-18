;;; prelude-scheme.el --- Emacs Prelude: Some defaults for Scheme.
;;; Commentary:
;;; Code:
(use-package geiser)

(require 'prelude-lisp)
(require 'geiser)

;; geiser replies on a REPL to provide autodoc and completion
(setq geiser-mode-start-repl-p t)

;; keep the home clean
(setq geiser-repl-history-filename
      (expand-file-name "geiser-history" prelude-savefile-dir))

(add-hook 'scheme-mode-hook (lambda () (run-hooks 'prelude-lisp-coding-hook)))

(provide 'prelude-scheme)

;;; prelude-scheme.el ends here
