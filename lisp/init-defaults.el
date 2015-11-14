;;Font
(set-default-font "Hack-12" t)
(set-fontset-font "fontset-default" 'hangul '("NanumGothic" . "iso10646-1"))

;;Dont't use UI
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

;;default start
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)
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
