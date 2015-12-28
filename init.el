(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'init-elpa) ; package utils
(require 'init-os)
(require 'init-defaults)
(require 'init-eshell)
(require 'init-themes) ;color theme
(require 'init-gui-frames)
(require 'init-dired)
(require 'init-git)
(require 'init-ido)
(require 'init-auto-complete)
(require 'init-edit)
(require 'init-gtags)

(require 'init-lisp)
(require 'init-clisp)
(require 'init-clojure)
(require 'init-python)
(require 'init-cc)

(provide 'init)
