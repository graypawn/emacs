(global-unset-key (kbd "C-z"))
(global-unset-key (kbd "C-x C-z"))
(global-unset-key (kbd "C-l"))          ;C-l은 prefix로 사용한다.

;;; shell
(global-set-key (kbd "C-x m") 'eshell)
(global-set-key (kbd "C-x M") 'term)

;;; Custom Save-buffer
(global-set-key (kbd "C-x C-s") 'graypawn-save-buffer)

;;; Input Method
(global-set-key (kbd "C-|") 'set-input-method)

;;; File file as sudo
(global-set-key (kbd "C-x S") 'graypawn-switch-sudo)

;;; helm
(global-set-key (kbd "C-x C-m") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x C-b") 'helm-buffers-list)
(global-set-key (kbd "C-x r b") 'helm-filtered-bookmarks)

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

;; magit
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x M-g") 'magit-dispatch-popup)

;;; Apropos
(global-set-key (kbd "C-h l") 'apropos-library)
(provide 'graypawn-keybindings)
