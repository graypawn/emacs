(setq org-directory "~/Dropbox/org/")
(setq org-default-notes-file "~/Dropbox/org/notes.org")

;;; Capture
(setq org-capture-templates
      '(("n" "Note" entry (file org-default-notes-file)
         "* %?" :empty-lines 1)
        ("t" "Todo" entry (file+datetree "~/Dropbox/org/diary.org")
         "* TODO %?\n:DETAIL: \n:CREATE: %U")
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
   (python . t)))

;;; Deft
(require-package 'deft)

(setq deft-extension "org")
(setq deft-directory "~/Dropbox/wiki")
(setq deft-text-mode 'org-mode)
(setq deft-use-filename-as-title nil)

(provide 'init-org)
