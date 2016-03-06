(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'init-elpa) ; package utils
(require 'init-os)
(require 'init-core)

(require 'init-themes) ;color theme
(require 'init-tramp)
(require 'init-ido)
(require 'init-org)

(require 'init-ui)

(require 'init-keybindings)
(require 'init-eshell)

(require 'init-auto-complete)
(require 'init-gtags)

(require 'init-tw)

(require 'init-lisp)

(require 'init-clisp)
(require 'init-clojure)
(require 'init-cc)
(require 'init-python)
(require 'init-scheme)
;; (require 'init-perl)

;;; Load "custom.el"
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

(provide 'init)

