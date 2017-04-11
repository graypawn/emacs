;;; pawn-ido.el --- Interactively Do Things
;;; Commentary:

;; * packages:
;; * ----------
;; * flx-ido

;;; Code:

(use-package ido
  :config
  (setq ido-use-filename-at-point nil
        ido-enable-flex-matching t
        ido-ignore-extensions t
        ido-everywhere t

        ;; ido don't look for a file/directory outside the current directory.
        ido-auto-merge-work-directories-length -1
        )
  (ido-mode t))

(add-hook 'ido-setup-hook
          (lambda ()
            (define-key ido-completion-map (kbd "M-n") 'ido-next-match)
            (define-key ido-completion-map (kbd "M-p") 'ido-prev-match)))

(use-package flx-ido
  :ensure t
  :init (flx-ido-mode 1))

;; use icomplete in minibuffer
(icomplete-mode t)

(provide 'pawn-ido)
;;; pawn-ido.el ends here
