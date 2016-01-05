(require 'ielm)

(defvar elisp/repl-original-buffer nil
  "Buffer from which we jumped to this REPL.")
(make-variable-buffer-local 'elisp/repl-original-buffer)

(defvar elisp/repl-switch-function 'switch-to-buffer-other-window)

(defun elisp/switch-to-ielm ()
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
    (error "No original buffer.")))

(with-eval-after-load 'lisp-mode
  (define-key emacs-lisp-mode-map (kbd "C-c C-z") 'elisp/switch-to-ielm)
  (define-key emacs-lisp-mode-map (kbd "C-c C-c") 'eval-defun)
  (define-key emacs-lisp-mode-map (kbd "C-c C-k") 'eval-buffer))

(with-eval-after-load 'ielm
  (define-key ielm-map (kbd "C-c C-z") 'elisp/repl-switch-back))

;;rainbow delimiters
(require-package 'rainbow-delimiters)

(defun lisp-setup ()
  (rainbow-delimiters-mode t)
  (enable-paredit-mode)
  (eldoc-mode))

(require-package 'elisp-slime-nav)

(defun emacs-lisp-setup ()
  (turn-on-elisp-slime-nav-mode))

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

(dolist (hook (mapcar #'derived-mode-hook-name elispy-modes))
  (add-hook hook 'emacs-lisp-setup))

(provide 'init-lisp)
