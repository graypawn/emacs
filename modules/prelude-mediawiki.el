;;; prelude-mediawiki.el --- Emacs Prelude: mediawiki editing config
;;; Commentary:
;;; Code:

(use-package mediawiki)

(eval-after-load 'mediawiki
  '(progn
     (setq mediawiki-site-alist
           '(("Wikipedia" "http://en.wikipedia.org/w" "" "" "Main Page")
             ("WikEmacs" "http://wikemacs.org/w/" "" "" "Main Page")))

     ;; Emacs users care more for WikEmacs than Wikipedia :-)
     (setq mediawiki-site-default "WikEmacs")))

(provide 'prelude-mediawiki)

;;; prelude-mediawiki.el ends here
