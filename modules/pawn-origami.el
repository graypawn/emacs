;;; pawn-origami.el --- Folding
;;; Commentary:
;;; Code:
(use-package origami
  :ensure t
  :config
  (defun origami-elisp-parser (create)
    (origami-lisp-parser
     create
     "(\\(use-package\\|def\\)\\w*\\s-*\\(\\s_\\|\\w\\|[:?!]\\)*\\([ \\t]*(.*?)\\)?"))

  (defun origami-cycle (recursive)
    "Origami like org-mode."
    (interactive "P")
    (call-interactively
     (if recursive 'origami-toggle-all-nodes 'origami-toggle-node)))

  (add-hook 'prog-mode-hook 'origami-mode)

  (bind-key "C-/" 'origami-cycle origami-mode-map))

(provide 'pawn-origami)
;;; pawn-origami.el ends here
