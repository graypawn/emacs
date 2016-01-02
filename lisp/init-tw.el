(require-package 'twittering-mode)

(setq twittering-icon-mode nil)
(setq twittering-fill-column 70)
;; 텍스트 가로폭
(setq twittering-status-format "%i %s, %RT{by %s} %@:\n%FILL[]{%T}\n")

;;(setq twittering-oauth-access-token-alist '(PIN 입력 후 생성된 access token 값 입력))
;;(setq twittering-account-authorization 'authorized)

(provide 'init-tw)
