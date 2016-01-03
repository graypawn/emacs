(setq visible-bell nil)
(setq ring-bell-function 'ignore)

;; Supress GUI features
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
(when (fboundp 'menu-bar-mode)
  (menu-bar-mode -1))
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

(setq inhibit-startup-message t)
(setq initial-scratch-message "")

(provide 'init-gui-frames)
