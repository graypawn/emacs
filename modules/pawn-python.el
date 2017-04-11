;;; pawn-python.el --- Python
;;; Commentary:

;; | precondition | repository |
;; |--------------+------------|
;; | python-pip   | pacman     |
;; | virtualenv   | pip        |

;; | packages              |
;; |-----------------------|
;; | highlight-indentation |
;; | jdei                  |

;;; Code:

(use-package jedi
  ;;require 'M-x jedi:install-server'
  :ensure t
  :config
  (setq jedi:complete-on-dot t
        jedi:use-shortcuts t))

(use-package highlight-indentation :ensure t)

(use-package python-mode
  :defer t
  :init
  (setq python-indent-guess-indent-offset nil)
  (add-hook 'python-mode-hook '(lambda ()
                                (jedi:setup)
                                (smartparens-mode)
                                (smartparens-strict-mode)
                                (highlight-indentation-mode)))
  :config
  (bind-keys :map python-mode-map
             ("C-c C-c" . python-shell-send-defun)
             ("C-c C-k" . python-shell-send-buffer)
             ("C-c M-:" . python-shell-send-string)
             ("C-c d" . jedi:show-doc)))
;; REFERENCE
;; ==================================================
;; Emacs で Python 開発環境を構築 - http://futurismo.biz/archives/2680

(provide 'pawn-python)
;;; pawn-python.el ends here
