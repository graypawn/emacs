;;; pawn-common-lisp.el --- Common Lisp
;;; Commentary:
;;; Code:
(use-package slime
  :ensure t
  :defer t
  :config
  (setq inferior-lisp-program "/usr/bin/sbcl --noinform")

  (require 'slime-repl)

  (defvar pawn/slime-repl-original-buffer nil
    "Buffer from which we jumped to this REPL.")

  (defvar pawn/slime-repl-switch-function 'switch-to-buffer-other-window)

  (defun pawn/slime-switch-to-output-buffer ()
    (interactive)
    (setq pawn/slime-repl-original-buffer (current-buffer))
    (if (slime-connected-p)
        (slime-switch-to-output-buffer)
      (slime)))

  (defun pawn/slime-repl-switch-back ()
    "Switch back to the buffer from witch we reached this REPL."
    (interactive)
    (if pawn/slime-repl-original-buffer
        (funcall pawn/slime-repl-switch-function
                 pawn/slime-repl-original-buffer)
      (error "No original buffer")))

  (defun pawn/slime-eval-and-replace ()
    (interactive)
    (slime-eval-async `(swank:eval-and-grab-output ,(slime-last-expression))
      (lambda (result)
        (cl-destructuring-bind (output value) result
          (backward-kill-sexp)
          (insert output value)))))

  (bind-keys :map slime-mode-map
             ("C-c C-z" . pawn/slime-switch-to-output-buffer)
             ("C-c C-z" . pawn/slime-repl-switch-back)
             ("C-x M-e" . pawn/slime-eval-and-replace)
             ("C-c C-t" . projectile-find-test-file)
             ("C-c t" . projectile-test-project))

  (add-hook 'slime-repl-mode-hook 'lisp-setup)

  (add-to-list 'load-path (expand-file-name "no-elpa/slime-repl-ansi-color"
                                            user-emacs-directory))

  (slime-setup '(slime-fancy slime-repl-ansi-color)))

(provide 'pawn-common-lisp)
;;; pawn-common-lisp.el ends here
