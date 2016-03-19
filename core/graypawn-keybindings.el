(global-unset-key (kbd "C-z"))
(global-unset-key (kbd "C-x C-z"))
(global-unset-key (kbd "C-l"))          ;C-l은 prefix로 사용한다.

;;; shell
(global-set-key (kbd "C-x m") 'eshell)
(global-set-key (kbd "C-x M") 'term)

;;; Useful functions
(global-set-key (kbd "C-x C-s") 'graypawn-save-buffer)
(global-set-key (kbd "C-x M-e") 'eval-and-replace)
(global-set-key (kbd "C-+") 'set-file-executable)

;;; Input Method
(global-set-key (kbd "C-|") 'set-input-method)

;;; helm
(global-set-key (kbd "C-x C-m") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x C-b") 'helm-buffers-list)
(global-set-key (kbd "C-x r b") 'helm-filtered-bookmarks)

;;; Other Window backward
(global-set-key (kbd "C-x O") 'other-window-backward)

;;; Org
(global-set-key (kbd "C-l n") 'find-file-org-note)
(global-set-key (kbd "C-l c") 'org-capture)
(global-set-key (kbd "C-l a") 'org-agenda)
(global-set-key (kbd "C-l l") 'org-store-link)
(global-set-key (kbd "C-l d") 'deft)

;; magit
(global-set-key (kbd "C-x g") 'magit-status)

;;; Apropos
(global-set-key (kbd "C-h l") 'apropos-library)
(provide 'graypawn-keybindings)
