(add-to-list 'load-path (expand-file-name "core" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "modules" user-emacs-directory))

(require 'graypawn-packages)
(require 'graypawn-os)
(require 'graypawn-core)

(require 'graypawn-themes) ;color theme
(require 'graypawn-ui)
(require 'graypawn-keybindings)

(require 'init-tramp)
(require 'init-org)

(require 'init-eshell)

(require 'init-auto-complete)
(require 'init-gtags)

(require 'init-tw)

(require 'init-lisp)

(require 'init-clisp)
(require 'init-clojure)
(require 'init-cc)
(require 'init-java)
(require 'init-python)
(require 'init-scheme)
;; (require 'init-perl)

;;; Load "custom.el"
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

(provide 'init)

