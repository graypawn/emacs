;;; pawn-ui.el --- UI Preference
;;; Commentary:
;;; Code:

(use-package zenburn-theme
  :ensure t
  :config
  (load-theme 'zenburn t))

;; Disable bell
;; Beep을 끈다. 또한 시각적 bell도 사용하지 않는다.
(setq visible-bell nil
      ring-bell-function 'ignore)

;; Replace 'yes or no' with 'y or n'
(fset 'yes-or-no-p 'y-or-n-p)

;; Disable window chrome
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
(when (fboundp 'menu-bar-mode)
  (menu-bar-mode -1))
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

;; Simple startup
;; 초기 구동 시, 비어있는 sratch를 연다.
(setq inhibit-startup-message t
      initial-scratch-message "")

(use-package which-key
  :ensure t
  :diminish which-key-mode
  :config (which-key-mode))

(provide 'pawn-ui)
;;; pawn-ui.el ends here
