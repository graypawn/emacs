;;; pawn-avy.el --- avy & ace-window
;;; Commentary:

;; * Packages:
;; * ----------
;; * avy
;; * ace-window

;;; Code:

(use-package avy
  :ensure t
  :bind (("C-:" . avy-goto-word-or-subword-1)
         ("M-g" . avy-goto-line)
         :map isearch-mode-map
         ("C-'" . avy-isearch))
  :config
  (setq avy-background t
        avy-style 'at-full))

(use-package ace-window
  :ensure t
  :bind ("C-;" . ace-window))

(provide 'pawn-avy)
;;; pawn-avy.el ends here
