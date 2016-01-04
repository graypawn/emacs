;;(require-package 'c-eldoc)

(defun c-mode-setup ()
  (ggtags-mode)
  (c-set-style "bsd")
  (setq c-basic-offset 2)
;;  (c-turn-on-eldoc-mode)
;;  (setq c-eldoc-buffer-regenerate-time 60)
;;  (flymake-mode t)
  )

;;; c-eldoc
(when (require-package 'c-eldoc)
  (add-hook 'c-mode-common-hook
            (lambda ()
              (set (make-local-variable 'eldoc-idle-delay) 0.2)
              (set (make-local-variable 'eldoc-minor-mode-string) "")
              (c-turn-on-eldoc-mode))))

;;; Fold-dwim & hideshow
(add-hook 'c-mode-common-hook 'hs-minor-mode)


(with-eval-after-load 'cc-mode
  (define-key c-mode-base-map (kbd "C-c k") 'recompile)
  (define-key c-mode-base-map (kbd "C-c C-k") 'compile))

(add-to-list 'c-mode-common-hook 'c-mode-setup)

(provide 'init-cc)
