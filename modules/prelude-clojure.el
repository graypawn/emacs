;;; prelude-clojure.el --- Emacs Prelude: Clojure programming configuration.
;;; Commentary:
;;; Code:

(require 'prelude-lisp)
(use-package clojure-mode)
(use-package cider)

(eval-after-load 'clojure-mode
  '(progn
     (defun prelude-clojure-mode-defaults ()
       (subword-mode +1)
       (run-hooks 'prelude-lisp-coding-hook))

     (setq prelude-clojure-mode-hook 'prelude-clojure-mode-defaults)

     (add-hook 'clojure-mode-hook (lambda ()
                                    (run-hooks 'prelude-clojure-mode-hook)))))

(eval-after-load 'cider
  '(progn
     (setq nrepl-log-messages t)

     (add-hook 'cider-mode-hook 'eldoc-mode)

     (defun prelude-cider-repl-mode-defaults ()
       (subword-mode +1)
       (run-hooks 'prelude-interactive-lisp-coding-hook))

     (setq prelude-cider-repl-mode-hook 'prelude-cider-repl-mode-defaults)

     (add-hook 'cider-repl-mode-hook
               (lambda () (run-hooks 'prelude-cider-repl-mode-hook)))))

(provide 'prelude-clojure)

;;; prelude-clojure.el ends here
