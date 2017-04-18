;;; prelude-lisp.el --- Emacs Prelude: Configuration common to all lisp modes.
;;; Commentary:
;;; Code:

(require 'prelude-programming)
(use-package rainbow-delimiters)

;; Lisp configuration
(define-key read-expression-map (kbd "TAB") 'completion-at-point)

;; a great lisp coding hook
(defun prelude-lisp-coding-defaults ()
  (smartparens-strict-mode +1)
  (rainbow-delimiters-mode +1)
  (local-set-key (kbd ")") 'move-past-close-round))

(setq prelude-lisp-coding-hook 'prelude-lisp-coding-defaults)

;; interactive modes don't need whitespace checks
(defun prelude-interactive-lisp-coding-defaults ()
  (smartparens-strict-mode +1)
  (rainbow-delimiters-mode +1)
  (whitespace-mode -1)
  (local-set-key (kbd ")") 'move-past-close-round))

(setq prelude-interactive-lisp-coding-hook
      'prelude-interactive-lisp-coding-defaults)

(provide 'prelude-lisp)

;;; prelude-lisp.el ends here
