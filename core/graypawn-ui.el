;;Disable beep
(setq visible-bell nil)
(setq ring-bell-function 'ignore)

;;mode line
(setq column-number-mode t)
(size-indication-mode t)

;; Supress GUI features
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
(when (fboundp 'menu-bar-mode)
  (menu-bar-mode -1))
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

(setq inhibit-startup-message t)
(setq initial-scratch-message "")

;; show available keybindings after you start typing
(require 'which-key)
(which-key-mode +1)

(provide 'graypawn-ui)
