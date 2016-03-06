(require-package 'clojure-mode)
(require-package 'cider)

(add-hook 'clojure-mode-hook 'lisp-setup)

(eval-when-compile (require 'clojure-mode))
(with-eval-after-load 'clojure-mode
  (define-key clojure-mode-map (kbd "C-c C-z") 'cider-jack-in))

(provide 'init-clojure)
