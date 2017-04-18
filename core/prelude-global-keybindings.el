;;; prelude-global-keybindings.el --- Emacs Prelude: some useful keybindings.
;;; Commentary:
;;; Code:

;; Disable key.
(global-unset-key (kbd "C-z"))
(global-unset-key (kbd "C-x C-z"))

;; Align your code in a pretty way.
(global-set-key (kbd "C-x \\") 'align-regexp)

;; Start proced in a similar manner to dired
(unless (eq system-type 'darwin)
  (global-set-key (kbd "C-x p") 'proced))

;; If you want to be able to M-x without meta
(global-set-key (kbd "C-x C-m") 'smex)

;; A complementary binding to the apropos-command (C-h a)
(define-key 'help-command "A" 'apropos)

;; A quick major mode help with discover-my-major
(define-key 'help-command (kbd "C-m") 'discover-my-major)

(define-key 'help-command (kbd "C-f") 'find-function)
(define-key 'help-command (kbd "C-v") 'find-variable)
(define-key 'help-command (kbd "C-l") 'find-library)

(define-key 'help-command (kbd "C-i") 'info-display-manual)

;; Activate occur easily inside isearch
(define-key isearch-mode-map (kbd "C-o") 'isearch-occur)

;; use hippie-expand instead of dabbrev
(global-set-key (kbd "M-/") 'hippie-expand)

;; replace buffer-menu with ibuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)

(global-set-key (kbd "C-x f") 'rgrep)

(global-set-key (kbd "C-x C-`") 'previous-error)

(global-set-key (kbd "<f5>") 'revert-buffer)

(require 'crux)
(global-set-key (kbd "C-a") 'crux-move-beginning-of-line)
(global-set-key (kbd "M-o") 'crux-smart-open-line)
(global-set-key (kbd "C-^") 'crux-top-join-line)
(global-set-key [remap just-one-space] 'cycle-spacing)

(global-set-key (kbd "C-x C-u") 'browse-url-at-point)
(global-set-key (kbd "M-'") 'crux-visit-term-buffer)

(global-unset-key (kbd "C-t"))
(global-set-key (kbd "C-t i") 'crux-find-user-init-file)
(global-set-key (kbd "C-t C-s") 'crux-find-shell-init-file)
(global-set-key (kbd "C-t s") 'pawn/switch-buffer-scratch)
(global-set-key (kbd "C-t m") 'pawn/switch-buffer-messages)

(global-set-key (kbd "C-x C-r") 'crux-rename-buffer-and-file)
(global-set-key (kbd "C-x C-d") 'crux-delete-file-and-buffer)

(global-set-key (kbd "C-x M-e") 'crux-eval-and-replace)
(global-set-key (kbd "C-`") 'crux-ispell-word-then-abbrev)

(provide 'prelude-global-keybindings)
;;; prelude-global-keybindings.el ends here
