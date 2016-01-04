(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'init-elpa) ; package utils
(require 'init-os)
(require 'init-core)

(require 'init-themes) ;color theme
(require 'init-ui)

(require 'init-keybindings)
(require 'init-eshell)
(require 'init-dired)
(require 'init-ido)

(require 'init-auto-complete)
(require 'init-gtags)

(require 'init-git)
(require 'init-tw)

;; Language
(require 'init-lisp)
;; (require 'init-clisp)
(require 'init-scheme)
(require 'init-clojure)
(require 'init-python)
(require 'init-perl)
(require 'init-cc)

(provide 'init)
