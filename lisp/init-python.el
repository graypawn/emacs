(setq python-shell-interpreter "ipython")

;;jedi
(require-package 'jedi)
;; require 'M-x jedi:install-server'
(add-hook 'python-mode-hook (lambda ()
			      (jedi:setup)
			      (jedi:ac-setup)
			      (local-set-key (kbd "C-c d") 'jedi:show-doc)
			      (local-set-key (kbd "M-.") 'jedi:goto-definition)))

(setq jedi:complete-on-dot t)

(add-hook 'python-mode-hook 'autopair-mode)
(add-hook 'python-mode-hook 'indent-guide-mode)

(provide 'init-python)










