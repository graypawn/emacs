;;; prelude-shell.el --- Emacs Prelude: sh-mode configuration.
;;; Commentary:
;;; Code:

(require 'sh-script)

;; recognize prezto files as zsh scripts
(defvar prelude-prezto-files
  '("zlogin" "zlogin" "zlogout" "zpreztorc" "zprofile" "zshenv" "zshrc"))

(mapc (lambda (file)
        (add-to-list 'auto-mode-alist `(,(format "\\%s\\'" file) . sh-mode)))
      prelude-prezto-files)

(add-hook 'sh-mode-hook
          (lambda ()
            (if (and buffer-file-name
                     (member (file-name-nondirectory buffer-file-name)
                             prelude-prezto-files))
                (sh-set-shell "zsh"))))

(provide 'prelude-shell)
;;; prelude-shell.el ends here
