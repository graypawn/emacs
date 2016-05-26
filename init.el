(require 'ob-tangle)

(setq user-full-name "graypawn")
(setq user-mail-address (concat "choi.pawn" " @" "gmail.com"))

(defun pawn/org-babel-tangle-and-compile-file (file)
  (interactive "fFile to load: ")
  (let* ((base-name file)
         (org-file (concat base-name ".org"))
         (exported-file (concat base-name ".el"))
         (compiled-file (concat base-name ".elc")))
    (unless (and (file-exists-p compiled-file)
                 (file-newer-than-file-p exported-file org-file))
      (org-babel-tangle-file org-file exported-file "emacs-lisp")
      (byte-compile-file exported-file))))

(defun pawn/load (file)
  (interactive "fFile to load: ")
  (let* ((config (expand-file-name file user-emacs-directory)))
    (pawn/org-babel-tangle-and-compile-file config)
    (load (file-name-sans-extension config))))

(pawn/load "core/pawn-packages")
(pawn/load "core/pawn-core")
(pawn/load "core/pawn-os")
(pawn/load "core/pawn-keybindings")
(pawn/load "core/pawn-ui")

;; Byte compile pawn-themes.el if newer than pawn-themes.elc
;; And load pawn-themes.elc
(let ((source-file (expand-file-name "pawn-dark-theme.el" user-emacs-directory))
      (compiled-file (expand-file-name "pawn-dark-theme.elc" user-emacs-directory)))

  (if (file-newer-than-file-p source-file compiled-file)
      (if (byte-compile-file source-file)
          (message (concat "Compiled " compiled-file))
        (error "Failed compiling %s" compiled-file)))
  (load compiled-file))

;;; You can write experimental or private code in `custom.el'.
(let ((custom-file (expand-file-name "custom.el" user-emacs-directory)))
  (when (file-exists-p custom-file)
    (load custom-file)))

;;; Copy sample/pawn-modules.el and select modules to use.
(let ((modules-file (expand-file-name "pawn-modules.el" user-emacs-directory)))
  (if (file-exists-p modules-file)
      (load modules-file)
    (message "Missing modules file %s" modules-file)
    (message "You can get started by copying the bundled example file")))
