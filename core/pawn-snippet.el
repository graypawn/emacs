;;; pawn-snippet.el --- snippet
;;; Commentary:
;;; Code:

(defun yas-ido-expand ()
  "You select (and expand) a yasnippet keyword."
  (interactive)
  (let ((original-point (point)))
    (while (and
            (not (= (point) (point-min) ))
            (not
             (string-match "[[:space:]\n]" (char-to-string (char-before)))))
      (backward-word 1))
    (let* ((init-word (point))
           (word (buffer-substring init-word original-point))
           (list (yas-active-keys)))
      (goto-char original-point)
      (let ((key (remove-if-not
                  (lambda (s) (string-match (concat "^" word) s)) list)))
        (if (= (length key) 1)
            (setq key (pop key))
          (setq key (ido-completing-read "key: " list nil nil word)))
        (delete-char (- init-word original-point))
        (insert key)
        (yas-expand)))))

(use-package yasnippet
  :diminish yas-minor-mode
  :config
  (setq yas-snippet-dirs
        '("~/.emacs.d/snippets"))

  (yas-global-mode 1)

  (bind-keys :map yas-minor-mode-map
             ("<tab>" . nil)
             ("TAB" . nil)
             ("<C-tab>" . yas-ido-expand)))


;; AUTO INSERT
;; 확장자를 기준으로 새 파일을 열 때, 자동으로 template를 삽입하도록 한다.
(use-package autoinsert
  :config
  (setq auto-insert-directory "~/.emacs.d/auto-insert/"
        auto-insert-query nil)

  (auto-insert-mode 1))

(define-auto-insert "\\.\\(c\\|cc\\|cpp\\)$" "template.c")
(define-auto-insert "\\.\\(h\\|hh\\|hpp\\)$" "template.h")
(define-auto-insert "\\.java$" "template.java")
(define-auto-insert "\\.el$" "template.el")
(define-auto-insert "\\.py$" "template.py")
(define-auto-insert "\\.sh$" "template.sh")
(define-auto-insert "\\.desktop$" "template.desktop")
(define-auto-insert "\\.lisp$" "template.lisp")

(defadvice auto-insert  (around yasnippet-expand-after-auto-insert activate)
  "Expand auto-inserted content as yasnippet templete, \
so that we could use yasnippet in autoinsert mode"
  (let ((is-new-file (and (not buffer-read-only)
                          (or (eq this-command 'auto-insert)
                              (and auto-insert (bobp) (eobp))))))
    ad-do-it
    (let ((old-point-max (point-max))
          (yas-indent-line nil))
      (when is-new-file
        (goto-char old-point-max)
        (yas-expand-snippet (buffer-substring-no-properties
                             (point-min) (point-max)))
        (delete-region (point-min) old-point-max)))))

(provide 'pawn-snippet)
;;; pawn-snippet.el ends here
