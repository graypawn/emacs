;;; pawn-tw.el --- Twittering mode
;;; Commentary:
;;; Code:

(use-package twittering-mode
  :ensure t
  :init
  (setq twittering-icon-mode nil
        twittering-fill-column 70
        ;; 텍스트 가로폭
        twittering-status-format "%i %s, %RT{by %s} %@:\n%FILL[]{%T}\n"))

(provide 'pawn-tw)
;;; pawn-tw.el ends here
