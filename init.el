(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'init-elpa)
(require 'init-defaults)

(require 'init-auto-complete)
(require 'init-lisp)

(provide 'init)
