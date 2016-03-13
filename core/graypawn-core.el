;; smart pairing for all
(require 'smartparens-config)
(setq sp-base-key-bindings 'paredit)
(setq sp-autoskip-closing-pair 'always)
(setq sp-hybrid-kill-entire-symbol nil)
(sp-use-paredit-bindings)

(show-smartparens-global-mode +1)

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

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(require 'compile)
(setq compilation-ask-about-save nil  ; Just save before compiling
      compilation-always-kill t       ; Just kill old compile processes before
                                        ; starting the new one
      compilation-scroll-output 'first-error ; Automatically scroll to first
                                        ; error
      )

;;; undo-tree
(global-undo-tree-mode t)

;;; Tramp
(require 'tramp)
(setq tramp-default-method "ssh")

(provide 'graypawn-core)
