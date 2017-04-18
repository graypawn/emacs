;;; pawn-parens.el --- Parens Configuration
;;; Commentary:
;;; Code:
(use-package smartparens-config
  :ensure smartparens
  :diminish smartparens-mode
  :config
  (setq sp-base-key-bindings 'paredit
        sp-autoskip-closing-pair 'always
        sp-hybrid-kill-entire-symbol nil)
  (smartparens-global-mode t)
  (show-smartparens-global-mode t)
  (sp-use-paredit-bindings)

  (sp-local-pair 'org-mode "'" nil :actions nil)
  (sp-local-pair 'org-mode "`" nil :actions nil)

  ;; For lisp modes
  (mapc (lambda (mode)
          ;; disable ', it's the quote chqracter!
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


(defun move-past-close-round ()
  "Move past next `)', delete indentation before it."
  (interactive)
  (up-list 1)
  (forward-char -1)
  (while (save-excursion                ; this is my contribution
           (let ((before-paren (point)))
             (back-to-indentation)
             (and (= (point) before-paren)
                  (progn
                    ;; Move to end of previous line.
                    (beginning-of-line)
                    (forward-char -1)
                    ;; Verify it doesn't end within a string or comment.
                    (let ((end (point))
                          state)
                      (beginning-of-line)
                      ;; Get state at start of line.
                      (setq state  (list 0 nil nil
                                         (null (calculate-lisp-indent))
                                         nil nil nil nil
                                         nil))
                      ;; Parse state across the line to get state at end.
                      (setq state (parse-partial-sexp (point) end nil nil
                                                      state))
                      ;; Check not in string or comment.
                      (and (not (elt state 3)) (not (elt state 4))))))))
    (delete-indentation))
  (just-one-space 0)
  (forward-char 1))

(global-set-key (kbd "M-)") 'move-past-close-round)


;; disable annoying blink-matching-paren
(setq blink-matching-paren nil)

(provide 'pawn-parens)
;;; pawn-parens.el ends here
