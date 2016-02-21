;;; Useful Shortcut
(global-unset-key (kbd "C-z"))
(global-unset-key (kbd "C-x C-z"))
(global-unset-key (kbd "C-l"))          ;C-l은 prefix로 사용한다.

;;; Eshell
(global-set-key (kbd "C-x m") 'eshell)
(global-set-key (kbd "C-x M") (lambda () (interactive) (eshell t))) ;one more eshell

(global-set-key (kbd "C-x C-m") 'execute-extended-command) ;M-x

;;; Buffer Shortcut
(global-set-key (kbd "C-x C-b") 'ibuffer)

;;; Other Window backward
(global-set-key (kbd "C-x O") (lambda ()
                                (interactive)
                                (other-window -1)))

;;; Org
(global-set-key (kbd "C-l n")
                (lambda () (interactive)
                  (find-file org-default-notes-file)))
(global-set-key (kbd "C-l c") 'org-capture)
(global-set-key (kbd "C-l a") 'org-agenda)
(global-set-key (kbd "C-l l") 'org-store-link)
(global-set-key (kbd "C-l d") 'deft)

;;; Apropos
(global-set-key (kbd "C-h l") 'apropos-library)
(provide 'init-keybindings)
