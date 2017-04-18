;;; prelude-haskell.el --- Emacs Prelude: Nice config for Haskell programming.
;;; Commentary:
;;; Code:

(require 'prelude-programming)
(use-package haskell-mode)

(eval-after-load 'haskell-mode
  '(progn
     (defun prelude-haskell-mode-defaults ()
       (subword-mode +1)
       (eldoc-mode +1)
       (haskell-indentation-mode +1)
       (interactive-haskell-mode +1))

     (setq prelude-haskell-mode-hook 'prelude-haskell-mode-defaults)

     (add-hook 'haskell-mode-hook (lambda ()
                                    (run-hooks 'prelude-haskell-mode-hook)))))

(provide 'prelude-haskell)

;;; prelude-haskell.el ends here
