(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'init-elpa) ; package utils
(require 'init-defaults)
(require 'init-themes) ;color theme
(require 'init-gui-frames)

(require 'init-git)
(require 'init-ido)
(require 'init-auto-complete)
(require 'init-edit)

(require 'init-lisp)
(require 'init-clojure)
(require 'init-python)

(provide 'init)
