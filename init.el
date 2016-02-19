(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'init-elpa) ; package utils
(require 'init-os)
(require 'init-core)

(require 'init-dired)
(require 'init-themes) ;color theme
(require 'init-tramp)
(require 'init-ido)

(require 'init-ui)

(require 'init-keybindings)
(require 'init-eshell)

(require 'init-auto-complete)
(require 'init-graphviz)
;;(require 'init-gtags)

(require 'init-git)
(require 'init-tw)
(require 'init-org)

;; Language
(require 'init-lisp)
;; (require 'init-markdown)
;; (require 'init-clisp)
(require 'init-scheme)
(require 'init-clojure)
(require 'init-python)
;; (require 'init-perl)
(require 'init-cc)

(provide 'init)
