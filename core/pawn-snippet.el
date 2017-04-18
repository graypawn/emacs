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
  :defer t
  :config
  (setq auto-insert-directory "~/.emacs.d/auto-insert/"
        auto-insert-query nil))

(auto-insert-mode 1)

(defun pawn/autoinsert-yas-expand ()
  "Replace text in yasnippet template."
  (yas-expand-snippet (buffer-string) (point-min) (point-max)))

(defmacro define-pawn-template (condition template)
  "If the CONDITION is true, call `pawn/autoinsert-yas-expand' with TEMPLATE."
  `(define-auto-insert ,(eval condition)
     [,(eval template) pawn/autoinsert-yas-expand]))

(defmacro define-pawn-templates (&rest define-list)
  "DEFINE-LIST is a arguments for `define-pawn-template'."
  `(progn ,@(mapcar (lambda (x) (list 'define-pawn-template (car x) (cdr x)))
                    define-list)))

(define-pawn-templates
  ("\\.\\(c\\|cc\\|cpp\\)$" . "template.c")
  ("\\.\\(h\\|hh\\|hpp\\)$" . "template.h")
  ("\\.java$" . "template.java")
  ("\\.py$" . "template.py")
  ("\\.sh$" . "template.sh")
  ("\\.el$" . "template.el")
  ("\\.desktop$" . "template.desktop")
  ("\\.lisp$" . "template.lisp"))

(provide 'pawn-snippet)
;;; pawn-snippet.el ends here
