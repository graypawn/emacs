(setq  python-shell-interpreter "ipython")

;;jedi
(require-package 'jedi)
;; require 'M-x jedi:install-server'
(add-hook 'python-mode-hook (lambda ()
			      (jedi:setup)
			      (jedi:ac-setup)
			      (local-set-key (kbd "C-c M-j") 'run-python)
			      (local-set-key (kbd "C-c C-c") 'python-shell-send-defun)
			      (local-set-key (kbd "C-c C-k") 'python-shell-send-buffer)
			      (local-set-key (kbd "C-c C-d d") 'jedi:show-doc)
			      (local-set-key (kbd "M-.") 'jedi:goto-definition)
			      (local-set-key (kbd "M-,") 'jedi:goto-definition-pop-marker)
			      (local-set-key (kbd "C-c M-:") 'python-shell-send-string)))
(setq jedi:complete-on-dot t)

(add-hook 'python-mode-hook 'autopair-mode)
(require-package 'highlight-indentation)
(add-hook 'python-mode-hook 'highlight-indentation-mode)

(provide 'init-python)










