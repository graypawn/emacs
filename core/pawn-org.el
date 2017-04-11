;;; pawn-org.el --- Org mode
;;; Commentary:
;;; Code:

(use-package org
  :defer t
  :config
  (setq org-directory "~/Dropbox/org/"
        org-default-notes-file "~/Dropbox/org/notes.org")

  (defun pawn/find-file-org-note ()
    "."
    (interactive)
    (find-file org-default-notes-file)))

(use-package org-agenda
  :defer t
  :config
  (setq org-agenda-files '("~/Dropbox/org/diary.org")
        ;; start agenda from the current day.
        org-agenda-start-on-weekday nil
        ;; don't show scheduled or deadline items in agenda when they are done.
        org-agenda-skip-scheduled-if-done t
        org-agenda-skip-deadline-if-done t
        ;; Initial buffer
        initial-buffer-choice (car org-agenda-files)))

(use-package org-capture
  :defer t
  :config
  (setq org-capture-templates
        '(("n" "Note" entry (file org-default-notes-file)
           "* %?" :empty-lines 1)
          ("t" "Todo" entry (file "~/Dropbox/org/diary.org")
           "* TODO %?\nSCHEDULED:\nDEADLINE:\n")
          ("c" "Clipboard" entry (file org-default-notes-file)
           "* %(format-time-string \"%Y-%m-%d %a - %H:%M:%S\")\n%x"
           :immediate-finish t))))

;; Babel
(setq org-src-fontify-natively t
      org-edit-src-content-indentation 0)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((sh . t)
   (emacs-lisp . t)
   (latex . t)))

(add-to-list 'org-structure-template-alist
             '("S" "#+STARTUP: ?"))

(set-face-attribute
 'org-block-background nil :background "#454545")

;; Keybindings
(global-set-key (kbd "C-t n") 'pawn/find-file-org-note)
(global-set-key (kbd "C-t c") 'org-capture)
(global-set-key (kbd "C-t a") 'org-agenda)
(global-set-key (kbd "C-t l") 'org-store-link)

;; For exporting
(use-package htmlize :ensure t)

(use-package ox-html
  :defer t
  :config
  (setq org-html-postamble nil              ; html-postamble:nil
        org-export-with-toc nil             ; toc:nil
        org-export-with-section-numbers nil ; num:nil
        ))

(use-package deft
  ;; Org 문서를 효율적으로 관리하기 위해서 deft를 사용한다.
  ;; deft는 문서의 제목뿐 아니라 내용까지 검색해 준다.
  :ensure t
  :config
  (setq  deft-extensions '("org")
         deft-default-extension "org"
         deft-directory "~/Dropbox/wiki"
         deft-use-filename-as-title nil)

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
    (setq deft+-name
          (format "D: %s" (directory-file-name
                           (file-relative-name
                            directory
                            (default-value 'deft-directory)))))

    ;; Run deft.
    (let ((deft-directory directory))
      (deft))

    ;; Setting local value in deft buffer. And refresh.
    (set (make-local-variable 'deft-directory) directory)
    (set (make-local-variable 'mode-line-boader) deft+-name)
    (deft-refresh))

  (bind-key "S-SPC" 'deft-filter-input-with-korean deft-mode-map)
  (bind-key "<f12>" 'deft)
  (bind-key "<f12>" 'deft+ deft-mode-map))

(provide 'pawn-org)
;;; pawn-org.el ends here
