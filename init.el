;;; init.el -- emacs init file
;;; Commentary:
;;; Code:

(require 'ob-tangle)

(setq user-full-name "graypawn")
(setq user-mail-address (concat "choi.pawn" " @" "gmail.com"))

(defun pawn/load (file)
  (org-babel-load-file (expand-file-name (concat file ".org")
                                         user-emacs-directory)))

(pawn/load "core/pawn-packages")
(pawn/load "core/pawn-basic")
(pawn/load "core/pawn-utils")
(pawn/load "core/pawn-keybindings")
(pawn/load "core/pawn-ui")
(pawn/load "core/pawn-org")

;;; You can write experimental or private code in `custom.el'.
(let ((custom-file (expand-file-name "custom.el" user-emacs-directory)))
  (load custom-file 'noerror))

;;; Copy sample/pawn-modules.el and select modules to use.
(let ((modules-file (expand-file-name "pawn-modules.el" user-emacs-directory)))
  (if (file-exists-p modules-file)
      (load modules-file)
    (message "Missing modules file %s" modules-file)
    (message "You can get started by copying the bundled example file")))

;;; init.el ends here
