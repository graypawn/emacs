(defun c-mode-setup ()
  (setq c-default-style "linux")
  (local-set-key (kbd "C-c k") 'recompile)
  (local-set-key (kbd "C-c C-k") 'compile))

(add-to-list 'c-mode-common-hook 'c-mode-setup)

(provide 'init-cc)
