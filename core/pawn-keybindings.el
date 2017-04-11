;;; pawn-keybindings.el --- Global Keybindings
;;; Commentary:
;;; Code:

;; Disable key.
(global-unset-key (kbd "C-z"))
(global-unset-key (kbd "C-x C-z"))
(global-unset-key (kbd "C-t"))
(global-unset-key (kbd "C-h C-h"))

;; Switch to the scratch buffer
(global-set-key (kbd "C-t s") 'pawn/switch-buffer-scratch)
;; Switch to the messages buffer
(global-set-key (kbd "C-t m") 'pawn/switch-buffer-messages)

;; open an ansi-term buffer
(global-set-key (kbd "M-'") 'prelude-visit-term-buffer)

;; Move past next ‘)’, delete indentation before it.
(global-set-key (kbd "M-)") 'pawn/move-past-close-round)

;; If you want to be able to M-x without meta
(global-set-key (kbd "C-x C-m") 'execute-extended-command)

;; Move current buffer line to the top.
(global-set-key (kbd "C-l") 'pawn/recenter-top)

;; File finding
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-unset-key (kbd "C-x f"))
(global-set-key (kbd "C-x f l") 'lgrep)
(global-set-key (kbd "C-x f r") 'rgrep)
(global-set-key (kbd "C-x f z") 'zgrep)
(global-set-key (kbd "C-x f g") 'find-grep-dired)
(global-set-key (kbd "C-x f n") 'find-name-dired)

;; Start proced in a similar manner to dired
(global-set-key (kbd "C-x p") 'proced)

;; use hippie-expand instead of dabbrev
(global-set-key (kbd "M-/") 'hippie-expand)

;; Use my custom function to save buffer.
(global-set-key (kbd "C-x C-s") 'pawn/save-buffer)

;; Should be able to pawn/eval-and-replace anywhere.
(global-set-key (kbd "C-x M-e") 'pawn/eval-and-replace)

;; Toggle executable permissions on current file.
(global-set-key (kbd "C-+") 'pawn/toggle-file-executable)

;; Renames current buffer and file it is visiting.
(global-set-key (kbd "C-x C-r") 'pawn/rename-current-buffer-file)

;; Removes file connected to current buffer and kills buffer.
(global-set-key (kbd "C-x C-d") 'pawn/delete-current-buffer-file)

;; Clone current buffer.
;; And if universal-argument is true then, open file.
(global-set-key (kbd "C-x c") 'pawn/clone-file)

;; Input Method
(global-set-key (kbd "C-\\") 'pawn/toggle-input-method)

;; Search
(global-unset-key (kbd "C-x s"))
(global-set-key (kbd "C-x s g") 'prelude-google)
(global-set-key (kbd "C-x s G") 'prelude-github)

;; Replace current buffer text with the text of the visited file on disk
(global-set-key (kbd "<f5>") 'revert-buffer)

;; Select and activate input method.
(global-set-key (kbd "C-|") 'set-input-method)

;; Indentation help
(global-set-key (kbd "C-x ^") 'join-line)

;; Activate occur easily inside isearch
(define-key isearch-mode-map (kbd "C-o") 'isearch-occur)

(global-set-key (kbd "M-F") 'auto-fill-mode)

(provide 'pawn-keybindings)
;;; pawn-keybindings.el ends here
