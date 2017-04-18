;;; prelude-yaml.el --- Emacs Prelude: YAML programming support.
;;; Commentary:
;;; Code:
(use-package yaml-mode)

;; yaml-mode doesn't derive from prog-mode, but we can at least enable
;; whitespace-mode and apply cleanup.
(add-hook 'yaml-mode-hook 'subword-mode)

(provide 'prelude-yaml)
;;; prelude-yaml.el ends here
