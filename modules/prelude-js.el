;;; prelude-js.el --- Emacs Prelude: js-mode configuration.
;;; Commentary:
;;; Code:

(require 'prelude-programming)
(use-package js2-mode)
(use-package json-mode)

(add-to-list 'auto-mode-alist '("\\.js\\'"    . js2-mode))
(add-to-list 'auto-mode-alist '("\\.pac\\'"   . js2-mode))
(add-to-list 'interpreter-mode-alist '("node" . js2-mode))

(eval-after-load 'js2-mode
  '(progn
     (defun prelude-js-mode-defaults ()
       ;; electric-layout-mode doesn't play nice with smartparens
       (setq-local electric-layout-rules '((?\; . after)))
       (setq mode-name "JS2"))

     (setq prelude-js-mode-hook 'prelude-js-mode-defaults)

     (add-hook 'js2-mode-hook (lambda () (run-hooks 'prelude-js-mode-hook)))))

(provide 'prelude-js)

;;; prelude-js.el ends here
