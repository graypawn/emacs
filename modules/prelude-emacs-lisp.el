;;; prelude-emacs-lisp.el --- Emacs Prelude: Nice config for Elisp programming.
;;; Commentary:
;;; Code:

(require 'prelude-lisp)
(require 'crux)

(use-package elisp-slime-nav)
(use-package rainbow-mode)


(defvar elisp/repl-original-buffer nil
  "Buffer from which we jumped to this REPL.")

(make-variable-buffer-local 'elisp/repl-original-buffer)

(defvar elisp/repl-switch-function 'switch-to-buffer-other-window)

(defun elisp/switch-to-ielm ()
  "Switch to the ielm buffer."
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

(bind-keys :map emacs-lisp-mode-map
           ("C-c C-m" . macrostep-expand)
           ("C-c C-z" . elisp/switch-to-ielm)
           ("C-c C-c" . eval-defun)
           ("C-c C-k" . eval-buffer))

(eval-after-load "ielm"
  '(progn
     (bind-keys :map ielm-map
                ("C-c C-z" . elisp/repl-switch-back))))

(defun prelude-recompile-elc-on-save ()
  "Recompile your elc when saving an elisp file."
  (add-hook 'after-save-hook
            (lambda ()
              (when (and (->> (file-truename buffer-file-name)
                              (string-prefix-p prelude-dir))
                         (file-exists-p (byte-compile-dest-file buffer-file-name)))
                (emacs-lisp-byte-compile)))
            nil
            t))

(defun prelude-conditional-emacs-lisp-checker ()
  "Don't check doc style in Emacs Lisp test files."
  (let ((file-name (buffer-file-name)))
    (when (and file-name
               (string-match-p ".*-tests?\\.el\\'" file-name))
      (setq-local flycheck-checkers '(emacs-lisp)))))

(defun prelude-emacs-lisp-mode-defaults ()
  "Sensible defaults for `emacs-lisp-mode'."
  (run-hooks 'prelude-lisp-coding-hook)
  (eldoc-mode +1)
  (prelude-recompile-elc-on-save)
  (rainbow-mode +1)
  (setq mode-name "EL")
  (prelude-conditional-emacs-lisp-checker))

(setq prelude-emacs-lisp-mode-hook 'prelude-emacs-lisp-mode-defaults)

(add-hook 'emacs-lisp-mode-hook
          (lambda () (run-hooks 'prelude-emacs-lisp-mode-hook)))

(add-to-list 'auto-mode-alist '("Cask\\'" . emacs-lisp-mode))

;; ielm is an interactive Emacs Lisp shell
(defun prelude-ielm-mode-defaults ()
  "Sensible defaults for `ielm'."
  (run-hooks 'prelude-interactive-lisp-coding-hook)
  (eldoc-mode +1))

(setq prelude-ielm-mode-hook 'prelude-ielm-mode-defaults)

(add-hook 'ielm-mode-hook (lambda ()
                            (run-hooks 'prelude-ielm-mode-hook)))

(eval-after-load "elisp-slime-nav"
  '(diminish 'elisp-slime-nav-mode))
(eval-after-load "rainbow-mode"
  '(diminish 'rainbow-mode))
(eval-after-load "eldoc"
  '(diminish 'eldoc-mode))

;; enable elisp-slime-nav-mode
(dolist (hook '(emacs-lisp-mode-hook ielm-mode-hook))
  (add-hook hook 'elisp-slime-nav-mode))

(defun conditionally-enable-smartparens-mode ()
  "Enable `smartparens-mode' in the minibuffer, during `eval-expression'."
  (when (eq this-command 'eval-expression)
    (smartparens-mode 1)
    (smartparens-strict-mode)
    (sp-local-pair 'minibuffer-inactive-mode "'" nil :actions nil)
    (sp-local-pair 'minibuffer-inactive-mode "`" nil :actions nil)))

(add-hook 'minibuffer-setup-hook 'conditionally-enable-smartparens-mode)

(provide 'prelude-emacs-lisp)
;;; prelude-emacs-lisp.el ends here
