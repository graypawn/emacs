(require-package 'rainbow-delimiters)

(defun lisp-setup ()
  (rainbow-delimiters-mode t))

(defconst elispy-modes
  '(emacs-lisp-mode ielm-mode)
  "Major modes relating to elisp.")

(defconst lispy-modes
  (append elispy-modes
	  '(lisp-mode inferior-lisp-mode lisp-interaction-mode))
  "All lisp major modes.")

(require 'derived)

(dolist (hook (mapcar #'derived-mode-hook-name lispy-modes))
  (add-hook hook 'lisp-setup))

(provide 'init-lisp)
