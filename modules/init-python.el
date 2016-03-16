(eval-when-compile (require 'python))

;;Use IPython
(setq python-shell-interpreter "ipython")
(setq python-shell-buffer-name "IPython")
(setq python-indent-guess-indent-offset nil)

;;jedi
;;require 'M-x jedi:install-server'
(graypawn-require-package 'jedi)
(setq jedi:complete-on-dot t)
(setq jedi:use-shortcuts t)

(with-eval-after-load 'python
  (define-key python-mode-map (kbd "C-c C-c") 'python-shell-send-defun)
  (define-key python-mode-map (kbd "C-c C-k") 'python-shell-send-buffer)
  (define-key python-mode-map (kbd "C-c M-:") 'python-shell-send-string)
  (define-key python-mode-map (kbd "C-c d") 'jedi:show-doc))

(defun python-setup ()
  (jedi:setup)
  (smartparens-mode))

(add-hook 'python-mode-hook 'python-setup)
;;highlight indentation
(graypawn-require-package 'highlight-indentation)
(add-hook 'python-mode-hook 'highlight-indentation-mode)

(provide 'init-python)
