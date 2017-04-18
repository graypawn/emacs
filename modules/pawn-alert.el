;;; pawn-alert.el --- Org Alert
;;; Commentary:
;;; Code:
(use-package org-alert
  :config
  (require 'org-agenda)
  (setq alert-default-style 'libnotify
        org-alert-interval 3600         ; 1 hour
        org-alert-notification-title "TODO:")
  (org-alert-enable))

(provide 'pawn-alert)
;;; pawn-alert.el ends here
