;;; prelude-org.el --- Emacs Prelude: org-mode configuration.
;;; Commentary:
;;; Code:

(require 'org)

(add-to-list 'auto-mode-alist '("\\.org\\’" . org-mode))

(setq org-directory "~/Dropbox/org/"
      org-default-notes-file "~/Dropbox/org/notes.org"
      org-startup-truncated nil)

(add-hook 'text-mode-hook 'turn-on-visual-line-mode)

(defun pawn-find-file-org-note ()
  "."
  (interactive)
  (find-file org-default-notes-file))


(setq org-agenda-files '("~/Dropbox/org/diary.org"))

(use-package org-agenda
  :ensure nil
  :defer t
  :config
  (setq
   ;; start agenda from the current day.
   org-agenda-start-on-weekday nil
   ;; don't show scheduled or deadline items in agenda when
   ;; they are done.
   org-agenda-skip-scheduled-if-done t
   org-agenda-skip-deadline-if-done t))

(defun pawn-find-file-org-diary ()
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


(global-set-key (kbd "C-t n") 'pawn-find-file-org-note)
(global-set-key (kbd "C-t d") 'pawn-find-file-org-diary)
(global-set-key (kbd "C-t a") 'org-agenda)
(global-set-key (kbd "C-t l") 'org-store-link)

(define-key org-mode-map (kbd "C-x C-u") 'org-open-at-point)


;; For exporting
(use-package ox-html
  :ensure nil
  :defer t
  :config
  (setq org-html-postamble nil                ; html-postamble:nil
        org-export-with-toc nil               ; toc:nil
        org-export-with-section-numbers nil   ; num:nil
        ))


(defun deft-filter-input-with-korean  (someone)
  "Append the string SOMEONE to the filter with korean input method."
  (interactive
   (list
    ((lambda ()
       (activate-input-method "korean-hangul")
       (read-string "Input message: " "" nil "" t)))))
  (-> (deft-whole-filter-regexp)
      (concat  someone)
      (deft-filter t))
  (deactivate-input-method))

(defun deft+ (directory)
  "Run deft in specified DIRECTORY via argument."
  (interactive (->> (default-value 'deft-directory)
                    (read-directory-name "Deft: ")
                    (list)))

  (make-directory directory t)

  (setq mode-line-process
        (->> (default-value 'deft-directory)
             (file-relative-name directory)
             (directory-file-name)
             (format " in %s")))

  ;; Run deft.
  (let ((deft-directory directory))
    (deft))

  ;; Setting local value in deft buffer. And refresh.
  (set (make-local-variable 'deft-directory) directory)
  (deft-refresh))

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
         deft-auto-save-interval nil)

  (use-package smart-mode-line
    :ensure nil
    :defer t
    :config
    (add-to-list 'sml/replacer-regexp-list
                 `(,(concat "^" deft-directory) ":DEFT:"))))


(provide 'prelude-org)
;;; prelude-org.el ends here
