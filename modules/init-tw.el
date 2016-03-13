(graypawn-require-package 'twittering-mode)

(setq twittering-icon-mode nil)
(setq twittering-fill-column 70)
;; 텍스트 가로폭
(setq twittering-status-format "%i %s, %RT{by %s} %@:\n%FILL[]{%T}\n")

(provide 'init-tw)
