;;Use IPython
(setq python-shell-interpreter "ipython")
(setq python-shell-buffer-name "IPython")
(setq python-indent-guess-indent-offset nil)

;;jedi
;;require 'M-x jedi:install-server'
(require-package 'jedi)
(setq jedi:complete-on-dot t)

;;jedi keybind
(setq jedi:key-show-doc (kbd "C-c C-d d"))
(setq jedi:key-goto-definition (kbd "M-."))
(setq jedi:key-goto-definition-pop-marker (kbd "M-,"))

(defun python-setup ()
  (jedi:setup)
  (local-set-key (kbd "C-c M-j") 'run-python)
  (local-set-key (kbd "C-c C-c") 'python-shell-send-defun)
  (local-set-key (kbd "C-c C-k") 'python-shell-send-buffer)
  (local-set-key (kbd "C-c M-:") 'python-shell-send-string))

(add-hook 'python-mode-hook 'python-setup)
;;autopair
(add-hook 'python-mode-hook 'autopair-mode)
(add-hook 'inferior-python-mode-hook 'autopair-mode)
;;highlight indentation
(require-package 'highlight-indentation)
(add-hook 'python-mode-hook 'highlight-indentation-mode)

(provide 'init-python)
