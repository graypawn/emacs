;;; prelude-org.el --- Emacs Prelude: org-mode configuration.
;;; Commentary:
;;; Code:

(require 'org)

(add-to-list 'auto-mode-alist '("\\.org\\’" . org-mode))

(setq org-directory "~/Dropbox/org/"
      org-default-notes-file "~/Dropbox/org/notes.org"
      org-startup-truncated nil)

(add-hook 'text-mode-hook 'turn-on-visual-line-mode)

(defun pawn/find-file-org-note ()
  "."
  (interactive)
  (find-file org-default-notes-file))


(setq org-agenda-files '("~/Dropbox/org/diary.org"))

(eval-after-load "org-agenda"
  '(progn
     (setq ;; start agenda from the current day.
           org-agenda-start-on-weekday nil
           ;; don't show scheduled or deadline items in agenda when
           ;; they are done.
           org-agenda-skip-scheduled-if-done t
           org-agenda-skip-deadline-if-done t)))

(defun pawn/find-file-org-diary ()
  "."
  (interactive)
  (find-file (car org-agenda-files)))


;; Babel
(setq org-src-fontify-natively t
      org-edit-src-content-indentation 0)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((sh . t)
   (emacs-lisp . t)
   (latex . t)))

(set-face-attribute
 'org-block-background nil :background "#454545")


(global-set-key (kbd "C-t n") 'pawn/find-file-org-note)
(global-set-key (kbd "C-t d") 'pawn/find-file-org-diary)
(global-set-key (kbd "C-t a") 'org-agenda)
(global-set-key (kbd "C-t l") 'org-store-link)

(define-key org-mode-map (kbd "C-x C-u") 'org-open-at-point)


;; For exporting
(eval-after-load "ox-html"
  '(progn
     (setq org-html-postamble nil              ; html-postamble:nil
           org-export-with-toc nil             ; toc:nil
           org-export-with-section-numbers nil ; num:nil
           )))


(use-package deft
  :bind (("<f12>" . deft)
         :map deft-mode-map
         ("<f12>" . deft+)
         ("S-SPC" . deft-filter-input-with-korean))
  :config
  (setq  deft-extensions '("org")
         deft-default-extension "org"
         deft-directory "~/Dropbox/wiki/"
         deft-use-filename-as-title nil
         deft-auto-save-interval nil
         )

  (eval-after-load "smart-mode-line"
    '(progn
       (add-to-list 'sml/replacer-regexp-list
                    `(,(concat "^" deft-directory) ":DEFT:"))))

  (defun deft-filter-input-with-korean  (someone)
    "Append the input message to the filter with korean input method."
    (interactive
     (list
      ((lambda ()
         (activate-input-method "korean-hangul")
         (read-string "Input message: " "" nil "" t)))))
    (deft-filter
      (concat (deft-whole-filter-regexp) someone) t)
    (deactivate-input-method))

  (defun deft+ (directory)
    "Run deft in specified directory via argument."
    (interactive (list (read-directory-name "Deft: "
                                            (default-value 'deft-directory))))

    (make-directory directory t)

    ;; global value for deft+
    (setq mode-line-process
          (format " in %s"
                  (directory-file-name
                   (file-relative-name directory
                                       (default-value 'deft-directory)))))

    ;; Run deft.
    (let ((deft-directory directory))
      (deft))

    ;; Setting local value in deft buffer. And refresh.
    (set (make-local-variable 'deft-directory) directory)
    (deft-refresh)))


(provide 'prelude-org)
;;; prelude-org.el ends here
