(require-package 'magit)

(global-set-key (kbd "C-x M-g") 'magit-status)
(global-set-key (kbd "C-x g") 'magit-dispatch-popup)

(provide 'init-git)
