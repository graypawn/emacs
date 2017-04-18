;;; prelude-scala.el --- Emacs Prelude: scala-mode configuration.
;;; Commentary:
;;; Code:

(require 'prelude-programming)
(use-package scala-mode)
(use-package ensime)

(defun prelude-scala-mode-defaults ()
  (subword-mode +1)
  (ensime-mode +1))

(setq prelude-scala-mode-hook 'prelude-scala-mode-defaults)

(add-hook 'scala-mode-hook (lambda ()
                             (run-hooks 'prelude-scala-mode-hook)))
(provide 'prelude-scala)

;;; prelude-scala.el ends here
