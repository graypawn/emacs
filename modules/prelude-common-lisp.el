;;; prelude-common-lisp.el --- Emacs Prelude: lisp-mode and SLIME config.
;;; Commentary:
;;; Code:

(require 'prelude-lisp)
(use-package slime)
(require 'slime-repl)

;; the SBCL configuration file is in Common Lisp
(add-to-list 'auto-mode-alist '("\\.sbclrc\\'" . lisp-mode))

;; Open files with .cl extension in lisp-mode
(add-to-list 'auto-mode-alist '("\\.cl\\'" . lisp-mode))

;; a list of alternative Common Lisp implementations that can be
;; used with SLIME. Note that their presence render
;; inferior-lisp-program useless. This variable holds a list of
;; programs and if you invoke SLIME with a negative prefix
;; argument, M-- M-x slime, you can select a program from that list.
(setq slime-lisp-implementations
      '((ccl ("ccl"))
        (clisp ("clisp" "-q"))
        (cmucl ("cmucl" "-quiet"))
        (sbcl ("sbcl" "--noinform") :coding-system utf-8-unix)))

;; select the default value from slime-lisp-implementations
(if (and (eq system-type 'darwin)
         (executable-find "ccl"))
    ;; default to Clozure CL on OS X
    (setq slime-default-lisp 'ccl)
  ;; default to SBCL on Linux and Windows
  (setq slime-default-lisp 'sbcl))

;; Add fancy slime contribs
(setq slime-contribs '(slime-fancy slime-repl-ansi-color))

(add-hook 'lisp-mode-hook (lambda () (run-hooks 'prelude-lisp-coding-hook)))
;; rainbow-delimeters messes up colors in slime-repl, and doesn't seem to work
;; anyway, so we won't use prelude-lisp-coding-defaults.
(add-hook 'slime-repl-mode-hook (lambda ()
                                  (smartparens-strict-mode +1)
                                  (whitespace-mode -1)))


(defvar pawn-slime-repl-original-buffer nil
  "Buffer from which we jumped to this REPL.")

(defvar pawn-slime-repl-switch-function 'switch-to-buffer-other-window)

(defun pawn-slime-switch-to-output-buffer ()
  "Switch to the slime buffer."
  (interactive)
  (setq pawn-slime-repl-original-buffer (current-buffer))
  (if (slime-connected-p)
      (slime-switch-to-output-buffer)
    (slime)))

(defun pawn-slime-repl-switch-back ()
  "Switch back to the buffer from witch we reached this REPL."
  (interactive)
  (if pawn-slime-repl-original-buffer
      (funcall pawn-slime-repl-switch-function
               pawn-slime-repl-original-buffer)
    (error "No original buffer")))

(defun pawn-slime-eval-and-replace ()
  "Replace the preceding sexp with its value."
  (interactive)
  (slime-eval-async `(swank:eval-and-grab-output ,(slime-last-expression))
    (lambda (result)
      (cl-destructuring-bind (output value) result
        (backward-kill-sexp)
        (insert output value)))))


(eval-after-load "slime"
  '(progn
     (setq slime-complete-symbol-function 'slime-fuzzy-complete-symbol
           slime-fuzzy-completion-in-place t
           slime-enable-evaluate-in-emacs t
           slime-autodoc-use-multiline-p t
           slime-auto-start 'always)

     (bind-keys :map slime-mode-map
                ("C-c C-z" . pawn-slime-switch-to-output-buffer)
                ("C-x M-e" . pawn-slime-eval-and-replace)
                ("C-c C-t" . projectile-find-test-file)
                ("C-c t" . projectile-test-project)
                ("C-c M-t" . slime-toggle-trace-fdefinition)
                :map slime-repl-mode-map
                ("C-c C-z" . pawn-slime-repl-switch-back))

     (defun projectile-cl ()
       "Identifies a project as being common lisp by the presence of
files with .asd extensions"
       (cl-some (lambda (file)
                  (string= (file-name-extension file) "asd"))
                (projectile-current-project-files)))

     (defun projectile-cl-test-function ()
       "Calls into slime to run the current project's tests with asdf."
       (message "Testing %s in slime..." (projectile-project-name))
       (pawn-slime-switch-to-output-buffer)
       (slime-eval-async
           `(asdf:test-system ,(projectile-project-name))
         (lambda (result) (message "Tests finished with result %s" result))
         "CL-USER"))

     (require 'projectile)
     (projectile-register-project-type
      'common-lisp
      #'projectile-cl
      :test #'projectile-cl-test-function)))

(provide 'prelude-common-lisp)
;;; prelude-common-lisp.el ends here
