;;; pawn-clojure.el --- Clojure
;;; Commentary:
;;; Code:

(use-package cider :ensure t)

(use-package clojure-mode
  :ensure t
  :defer t
  :config

  (bind-key "C-c C-z" 'cider-jack-in clojure-mode-map)
  (add-hook 'clojure-mode-hook 'lisp-setup))

;; REFERENCE
;; ==================================================
;; Emacs で Clojure の開発環境を構築 - http://futurismo.biz/archives/5742

(provide 'pawn-clojure)
;;; pawn-clojure.el ends here
