;;; helm
(graypawn-require-packages '(helm helm-projectile))
(require 'helm-config)
(setq helm-idle-delay 0.1)
(setq helm-input-idle-delay 0.1)
(setq ad-redefinition-action 'accept)
(helm-mode 1)

;;; projectile
(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)

(provide 'init-helm)
