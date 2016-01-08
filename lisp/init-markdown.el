(require-package 'markdown-mode)

;;http://increasinglyfunctional.com/2014/12/18/github-flavored-markdown-previews-emacs/
;;위 링크에서 '수정한' ruby script를 공개했다.


(setq markdown-open-command "/usr/local/bin/mark")

(add-to-list 'auto-mode-alist '("\\.md\\'" . gfm-mode))
(add-to-list 'auto-mode-alist '("\\.text\\'" . gfm-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . gfm-mode))

(setq markdown-command "/usr/local/bin/flavor")

(provide 'init-markdown)
