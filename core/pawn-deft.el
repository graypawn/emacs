;;; pawn-deft.el --- deft
;;; Commentary:
;;; Code:

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

(defun deft+ ()
  "Run deft in specified directory."
  (interactive)
  (if (derived-mode-p 'deft-mode)
      (let ((directory (->> (default-value 'deft-directory)
                            (read-directory-name "Deft: "))))
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
        (set (make-local-variable 'deft-directory) directory))
    (deft))
  (deft-filter-clear)
  (deft-refresh))

(use-package deft
  :bind (("<f12>" . deft+)
         :map deft-mode-map
         ("S-SPC" . deft-filter-input-with-korean))
  :config
  (setq  deft-extensions '("org")
         deft-default-extension "org"
         deft-directory "~/Dropbox/wiki/"
         deft-use-filename-as-title nil
         deft-auto-save-interval nil
         deft-use-filter-string-for-filename t
         )

  (setq deft-file-naming-rules '((noslash . "-")
                                 (nospace . "-")
                                 (case-fn . downcase)))

  (use-package smart-mode-line
    :ensure nil
    :defer t
    :config
    (add-to-list 'sml/replacer-regexp-list
                 `(,(concat "^" deft-directory) ":DEFT:"))))


(defvar deft+-filter-regexp nil)

;; Override
(eval-after-load 'deft
  '(progn
     (defun deft-new-file-named (slug)
       "Create a new file named SLUG.
SLUG is the short file name, without a path or a file extension."
       (interactive "sNew filename (without extension): ")
       (let ((file (deft-absolute-filename slug)))
         (if (file-exists-p file)
             (message "Aborting, file already exists: %s" file)
           (deft-cache-update-file file)
           (deft-refresh-filter)
           (let ((deft+-filter-regexp deft-filter-regexp)
                 (deft-filter-regexp nil))
             (deft-open-file file)))))))

(defun deft+-whole-filter-regexp ()
  "Join incremental filters into one."
  (mapconcat 'identity (reverse deft+-filter-regexp) " "))

(provide 'pawn-deft)
;;; pawn-deft.el ends here
