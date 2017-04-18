;;; prelude-css.el --- Emacs Prelude: css support
;;; Commentary:
;;; Code:

(eval-after-load 'css-mode
  '(progn
     (use-package rainbow-mode)

     (setq css-indent-offset 2)

     (defun prelude-css-mode-defaults ()
       (rainbow-mode +1)
       (run-hooks 'prelude-prog-mode-hook))

     (setq prelude-css-mode-hook 'prelude-css-mode-defaults)

     (add-hook 'css-mode-hook (lambda ()
                                (run-hooks 'prelude-css-mode-hook)))))

(provide 'prelude-css)
;;; prelude-css.el ends here
