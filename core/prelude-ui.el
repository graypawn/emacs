;;; prelude-ui.el --- Emacs Prelude: UI optimizations and tweaks.
;;; Commentary:
;;; Code:

;; the toolbar is just a waste of valuable screen estate
;; in a tty tool-bar-mode does not properly auto-load, and is
;; already disabled anyway
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

(menu-bar-mode -1)

;; the blinking cursor is nothing, but an annoyance
(blink-cursor-mode -1)

;; disable the annoying bell ring
(setq ring-bell-function 'ignore)

;; startup screen
(setq inhibit-startup-message t
      initial-scratch-message "")

;; mode line settings
(line-number-mode t)
(column-number-mode t)

;; enable y/n answers
(fset 'yes-or-no-p 'y-or-n-p)


;; more useful frame title, that show either a file or a
;; buffer name (if the buffer isn't visiting a file)
(setq frame-title-format
      '("" invocation-name " - "
        (:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name))
                 "%b"))))


;; use zenburn as the default theme
(when prelude-theme
  (load-theme prelude-theme t))


(use-package smart-mode-line
  :config
  (setq sml/no-confirm-load-theme t
        ;; delegate theming to the currently active theme
        sml/theme nil
        sml/show-remote nil)
  (add-hook 'after-init-hook #'sml/setup))


;; show the cursor when moving after big movements in the window
(use-package beacon
  :diminish beacon-mode
  :config
  (beacon-mode +1))


;; show available keybindings after you start typing
(use-package which-key
  :diminish which-key-mode
  :config
  (setq which-key-highlighted-command-list
        '(("bookmark" . error)))
  (which-key-mode +1))


(custom-set-faces
 '(link ((t (:underline t :weight bold :foreground nil)))))


(defun toggle-transparency ()
  "Toggling transparency."
  (interactive)
  (let ((alpha (frame-parameter nil 'alpha)))
    (set-frame-parameter
     nil 'alpha
     (if (eql (cond ((numberp alpha) alpha)
                    ((numberp (cdr alpha)) (cdr alpha))
                    ;; Also handle undocumented (<active> <inactive>) form.
                    ((numberp (cadr alpha)) (cadr alpha))
                    ((not alpha) 100)) ; First use.
              100)
         '(80. 80) '(100 . 100)))))

(global-set-key (kbd "C-x 9") 'toggle-transparency)

(provide 'prelude-ui)
;;; prelude-ui.el ends here
