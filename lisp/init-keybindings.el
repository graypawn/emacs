;;Useful Shortcut
(global-unset-key (kbd "C-z"))
(global-unset-key (kbd "C-x C-z"))

(global-set-key (kbd "C-x m") 'eshell)
(global-set-key (kbd "C-x M") (lambda () (interactive) (eshell t))) ;one more eshell

(global-set-key (kbd "C-x C-m") 'execute-extended-command) ;M-x

;;Buffer Shortcut
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; Other Window backward
(global-set-key (kbd "C-x O") (lambda ()
                                (interactive)
                                (other-window -1)))

;;; Org
(global-set-key (kbd "C-c o")
                (lambda () (interactive)
                  (find-file org-default-notes-file)))
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c l") 'deft)

;;Apropos
(global-set-key (kbd "C-h l") 'apropos-library)

(provide 'init-keybindings)
