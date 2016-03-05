;;Disable beep
(setq visible-bell nil)
(setq ring-bell-function 'ignore)

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

;;; Whitespace
(global-whitespace-mode t)

(add-hook
 'after-change-major-mode-hook
 '(lambda ()
    (if (derived-mode-p 'prog-mode)
        (setq whitespace-line-column 80
              whitespace-style
              '(face tabs trailing lines-tail))
      (setq whitespace-line-column nil
            whitespace-style
            '(face tabs trailing lines-tail)))))


;;; required package
(require-package 'autopair)
(require-package 'paredit)
(require-package 'fold-dwim)
(require-package 'hideshow)
(require-package 'magit)

(provide 'init-core)
