(setq org-directory "~/Dropbox/org/")
(setq org-default-notes-file "~/Dropbox/org/notes.org")

;;; Capture
(setq org-capture-templates
      '(("n" "Note" entry (file org-default-notes-file)
         "* %?" :empty-lines 1)
        ("t" "Todo" entry (file "~/Dropbox/org/diary.org")
         "* TODO %?\nSCHEDULED:\nDEADLINE:\n")
        ("c" "Clipboard" entry (file org-default-notes-file)
         "* %(format-time-string \"%Y-%m-%d %a - %H:%M:%S\")\n%x"
         :immediate-finish t)))

;;; Agenda
(setq org-agenda-files '("~/Dropbox/org/diary.org"))

;;; Org Source
(setq org-src-fontify-natively t)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((sh . t)
   (calc . t)
   (emacs-lisp . t)
   (scheme . t)
   (python . t)))

;;; Deft
(graypawn-require-package 'deft)

(setq deft-extensions '("org"))
(setq deft-directory "~/Dropbox/wiki")
(setq deft-text-mode 'org-mode)
(setq deft-use-filename-as-title nil)

(provide 'init-org)
