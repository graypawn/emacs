(require-package 'javadoc-lookup)

(defun cc-mode-setup ()
  (ggtags-mode)
  (c-set-style "k&r")
  (setq c-basic-offset 4)
  (setq comment-style 'extra-line)
  (hs-minor-mode t)
  (autopair-mode t))

;;; cclookup
;;; cpp 레퍼런스를 offline에서 확인할 수 있다.
;;; https://github.com/tsgates/cclookup/tree/master
(setq cclookup-dir (expand-file-name "cclookup" user-emacs-directory))
(add-to-list 'load-path cclookup-dir)

(eval-when-compile (require 'cclookup))
(setq cclookup-program (concat cclookup-dir "/cclookup.py"))
(setq cclookup-db-file (concat cclookup-dir "/cclookup.db"))

(autoload 'cclookup-lookup "cclookup"
  "Lookup SEARCH-TERM in the Python HTML indexes." t)
(autoload 'cclookup-update "cclookup" 
  "Run cclookup-update and create the database at `cclookup-db-file'." t)

;;; CC-mode Key Binding
(with-eval-after-load 'cc-mode
  (define-key c-mode-base-map (kbd "C-c k") 'recompile)
  (define-key c-mode-base-map (kbd "C-c C-k") 'compile)
  (define-key c-mode-base-map (kbd "C-c TAB") 'hs-toggle-hiding)
  (define-key c-mode-base-map (kbd "C-c S") 'hs-show-all)
  (define-key c-mode-base-map (kbd "C-c H") 'hs-hide-all)

  ;; c++-mode
  (define-key c++-mode-map (kbd "C-c C-d h") 'cclookup-lookup)

  ;; java-mode
  (define-key java-mode-map (kbd "C-c C-d h") 'javadoc-lookup))


(add-to-list 'c-mode-common-hook 'cc-mode-setup)
(provide 'init-cc)
