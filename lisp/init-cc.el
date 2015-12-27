(defun c-mode-setup ()
  (ggtags-mode)
  (c-set-style "bsd")
  (setq c-basic-offset 2))

(with-eval-after-load 'cc-mode
  (define-key c-mode-base-map (kbd "C-c k") 'recompile)
  (define-key c-mode-base-map (kbd "C-c C-k") 'compile))


(add-to-list 'c-mode-common-hook 'c-mode-setup)

(provide 'init-cc)
