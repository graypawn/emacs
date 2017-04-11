;;; 0010-projectile.el --- Projectile
;;; Commentary:
;;; Code:

(use-package projectile
  :ensure t
  :diminish projectile-mode
  :config
  (setq projectile-enable-caching t
        projectile-switch-project-action 'projectile-dired)
  (projectile-mode)

  (defun pawn/projectile-test-prefix (project-type)
    "Find default test files prefix based on PROJECT-TYPE."
    (cond
     ((member project-type '(django python-pip python-pkg python-tox)) "test_")
     ((member project-type '(emacs-cask)) "test-")
     ((member project-type '(lein-midje)) "t_")
     ((member project-type '(common-lisp)) "t-")))

  (setq projectile-test-prefix-function 'pawn/projectile-test-prefix)

  (defun projectile-cl ()
    "Identifies a project as being common lisp by the presence of
files with .asd extensions"
    (cl-some (lambda (file)
               (string= (file-name-extension file) "asd"))
             (projectile-current-project-files)))

  (defun projectile-cl-test-function ()
    "Calls into slime to run the current project's tests with asdf."
    (message "Testing %s in slime..." (projectile-project-name))
    (pawn/slime-switch-to-output-buffer)
    (slime-eval-async
        `(asdf:test-system ,(projectile-project-name))
      (lambda (result) (message "Tests finished with result %s" result))
      "CL-USER"))

  (projectile-register-project-type
   'common-lisp
   #'projectile-cl
   nil
   #'projectile-cl-test-function))

(provide 'pawn-projectile)
;;; pawn-projectile.el ends here
