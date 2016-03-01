(require-package 'javadoc-lookup)

(defun cc-mode-setup ()
  (ggtags-mode)
  (c-set-style "k&r")
  (setq c-basic-offset 4)
  (hs-minor-mode t)
  (autopair-mode t))

;;; CC-mode Key Binding
(with-eval-after-load 'cc-mode
  (define-key c-mode-base-map (kbd "C-c k") 'recompile)
  (define-key c-mode-base-map (kbd "C-c C-k") 'compile)
  (define-key c-mode-base-map (kbd "C-c TAB") 'hs-toggle-hiding)
  (define-key c-mode-base-map (kbd "C-c S") 'hs-show-all)
  (define-key c-mode-base-map (kbd "C-c H") 'hs-hide-all)

  ;; java-mode
  (define-key java-mode-map (kbd "C-c C-d h") 'javadoc-lookup))

(add-to-list 'c-mode-common-hook 'cc-mode-setup)
(provide 'init-cc)
