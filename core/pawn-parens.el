;;; pawn-parens.el --- Parens
;;; Commentary:
;;; Code:

(use-package smartparens-config
  :ensure smartparens
  :diminish smartparens-mode
  :config
  (setq sp-base-key-bindings 'paredit
        sp-autoskip-closing-pair 'always)
  (smartparens-global-mode t)
  (show-smartparens-global-mode t)
  (sp-use-paredit-bindings)

  (sp-local-pair 'org-mode "'" nil :actions nil)
  (sp-local-pair 'org-mode "`" nil :actions nil)

  ;; For lisp modes
  (mapc (lambda (mode)
          ;; Smartparens-strict-mode in lispy modes.
          (add-hook (intern (format "%s-hook" (symbol-name mode)))
                    'smartparens-strict-mode)
          ;; disable ', it's the quote character!
          (sp-local-pair mode "'" nil :actions nil)
          ;; also only use the pseudo-quote inside strings where it serve as
          ;; hyperlink.
          (sp-local-pair mode "`" "'" :when '(sp-in-string-p sp-in-comment-p))
          (sp-local-pair
           mode "`" nil
           :skip-match (lambda (ms mb me)
                         (cond
                          ((equal ms "'")
                           (or (sp--org-skip-markup ms mb me)
                               (not (sp-point-in-string-or-comment))))
                          (t (not (sp-point-in-string-or-comment)))))))

        sp-lisp-modes))

(provide 'pawn-parens)
;;; pawn-parens.el ends here
