;;; pawn-lisp.el --- Lisp mode
;;; Commentary:
;;; Code:
(defvar elisp/repl-original-buffer nil
  "Buffer from which we jumped to this REPL.")

(make-variable-buffer-local 'elisp/repl-original-buffer)

(defvar elisp/repl-switch-function 'switch-to-buffer-other-window)

(defun elisp/switch-to-ielm ()
  "."
  (interactive)
  (let ((orig-buffer (current-buffer)))
    (if (get-buffer "*ielm*")
        (funcall elisp/repl-switch-function "*ielm*")
      (ielm))
    (setq elisp/repl-original-buffer orig-buffer)))

(defun elisp/repl-switch-back ()
  "Switch back to the buffer from witch we reached this REPL."
  (interactive)
  (if elisp/repl-original-buffer
      (funcall elisp/repl-switch-function elisp/repl-original-buffer)
    (error "No original buffer")))

(use-package lisp-mode
  :mode "\\.sexp\\'"
  :config
  (bind-keys :map emacs-lisp-mode-map
             ("C-c e" . macrostep-expand)
             ("C-c C-z" . elisp/switch-to-ielm)
             ("C-c C-c" . eval-defun)
             ("C-c C-k" . eval-buffer)))

(use-package ielm
  :defer t
  :config
  (bind-key "C-c C-z" 'elisp/repl-switch-back ielm-map))

;;rainbow delimiters
(use-package rainbow-delimiters :ensure t)
(use-package elisp-slime-nav :ensure t :diminish elisp-slime-nav-mode)
(use-package eldoc :diminish eldoc-mode)

(defun lisp-setup ()
  "."
  (rainbow-delimiters-mode t)
  (eldoc-mode)
  (define-key
    (eval (derived-mode-map-name major-mode))
    (kbd ")")
    'pawn/move-past-close-round))

(defun emacs-lisp-setup ()
  "."
  (turn-on-elisp-slime-nav-mode))

(defconst elispy-modes
  '(emacs-lisp-mode ielm-mode)
  "Major modes relating to elisp.")

(defconst lispy-modes
  (append elispy-modes
  '(lisp-mode inferior-lisp-mode lisp-interaction-mode))
  "All LISP major modes.")

(require 'derived)

(dolist (hook (mapcar #'derived-mode-hook-name lispy-modes))
  (add-hook hook 'lisp-setup))

(dolist (hook (mapcar #'derived-mode-hook-name elispy-modes))
  (add-hook hook 'emacs-lisp-setup))

(provide 'pawn-lisp)
;;; pawn-lisp.el ends here
