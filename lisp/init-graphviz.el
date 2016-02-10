(require-package 'graphviz-dot-mode)

(with-eval-after-load 'graphviz-dot-mode
  (define-key graphviz-dot-mode-map (kbd "C-c k") 'recompile)
  (define-key graphviz-dot-mode-map (kbd "C-c C-k") 'compile))


(provide 'init-graphviz)
