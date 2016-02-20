;;Useful Shortcut
(global-unset-key (kbd "C-z"))
(global-unset-key (kbd "C-x C-z"))

(global-set-key (kbd "C-x m") 'eshell)
(global-set-key (kbd "C-x M") (lambda () (interactive) (eshell t))) ;one more eshell

(global-set-key (kbd "C-x C-m") 'execute-extended-command) ;M-x

;;Buffer Shortcut
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-x r") 'bury-buffer)

;; Other Window backward
(global-set-key (kbd "C-x O") (lambda ()
                                (interactive)
                                (other-window -1)))

;;; deft
(global-set-key (kbd "C-x l") 'deft)

;;Apropos
(global-set-key (kbd "C-h l") 'apropos-library)

(provide 'init-keybindings)
