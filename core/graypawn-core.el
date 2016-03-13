;;show paren mode
(setq show-paren-delay 0)
(show-paren-mode 1)

;;tab -> space
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)

;;Backup Setting
(add-to-list 'backup-directory-alist '("." . "~/.emacs-saves"))

(setq delete-old-versions t
      kept-old-versions 3
      kept-new-versions 5
      version-control t)

;;; Symbolic link to Git-controlled source file
(setq vc-follow-symlinks t)

;;; Whitespace
;; trailing whitespace, tab을 강조한다.
;; prograimming mode에서 80컬럼을 넘어가면 강조한다.

(global-whitespace-mode t)

(add-hook
 'after-change-major-mode-hook
 '(lambda ()
    (if (derived-mode-p 'prog-mode)
        (setq whitespace-line-column 80
              whitespace-style '(face tabs trailing lines-tail))
        (setq whitespace-line-column nil
              whitespace-style '(face tabs trailing)))))

;;; undo-tree
(global-undo-tree-mode t)

;;; helm
(graypawn-require-packages '(helm helm-projectile))
(require 'helm-config)
(setq helm-idle-delay 0.1)
(setq helm-input-idle-delay 0.1)
(setq ad-redefinition-action 'accept)
(helm-mode 1)

;;; projectile
(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)

(provide 'graypawn-core)
