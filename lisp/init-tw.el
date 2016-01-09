(require-package 'twittering-mode)

(setq twittering-icon-mode nil)
(setq twittering-fill-column 70)
;; 텍스트 가로폭
(setq twittering-status-format "%i %s, %RT{by %s} %@:\n%FILL[]{%T}\n")

(setq twittering-oauth-access-token-alist '(("oauth_token" . "1893091224-xtrzHOyD5VFooR06il7zbioVcXqAOAKHghSVQML")
 ("oauth_token_secret" . "TwK1ePyziu9qlfXU78zBg2RpSqTOgwhnRQ0jHOP0sFPW7")
 ("user_id" . "1893091224")
 ("screen_name" . "the9ain")
 ("x_auth_expires" . "0")))
(setq twittering-account-authorization 'authorized)

(provide 'init-tw)
