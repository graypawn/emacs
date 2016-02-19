;;; Org
;;; code highlight
(setq org-src-fontify-natively t)

;;; Deft
(require-package 'deft)

(setq deft-extension "org")
(setq deft-directory "~/Dropbox/wiki")
(setq deft-text-mode 'org-mode)
(setq deft-use-filename-as-title t)

(provide 'init-org)
