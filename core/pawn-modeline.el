;;; pawn-modeline.el --- Modeline
;;; Commentary:
;;; Code:

(setq column-number-mode t)

(defadvice vc-mode-line (after strip-backend () activate)
  "Mode line construct for displaying vc."
  (when (stringp vc-mode)
    (let ((vc-text (replace-regexp-in-string
                    (format "^ %s:" (vc-backend buffer-file-name))
                    " " vc-mode)))
      (setq vc-mode vc-text))))

(defvar mode-line-boader nil)

(defvar mode-line-projectile-or-boader
  '(:eval (propertize
           (format "[%s]"
                   (or mode-line-boader
                       (projectile-project-name)))
           'face '(:weight bold)))
  "Mode line construct for displaying project name or `mode-line-boader'.")

(put 'mode-line-projectile-or-boader 'risky-local-variable t)

(setq-default mode-line-format
              '("%e" mode-line-front-space
                mode-line-mule-info
                ;;   mode-line-client
                mode-line-modified
                mode-line-remote
                ;;   mode-line-frame-identification
                mode-line-buffer-identification
                "   "
                mode-line-position
                mode-line-projectile-or-boader
                (vc-mode vc-mode)
                "  "
                mode-line-modes
                mode-line-misc-info
                mode-line-end-spaces))

;; DIMINISH
;; ==================================================
(use-package abbrev :diminish abbrev-mode)

(provide 'pawn-modeline)
;;; pawn-modeline.el ends here
