(global-linum-mode 1)

;;mode line
(setq column-number-mode t)
;;show paren mode
(setq show-paren-delay 0)
(show-paren-mode 1)

;;tab -> space
(setq indent-tabs-mode nil)

;;Useful Shortcut
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

;;Apropos
(global-set-key (kbd "C-h l") 'apropos-library)

(provide 'init-defaults)
