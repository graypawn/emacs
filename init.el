;;; init.el -- emacs init file
;;; Commentary:
;;; Code:

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(require 'ob-tangle)

(setq user-full-name "graypawn")
(setq user-mail-address (concat "choi.pawn" " @" "gmail.com"))

(add-to-list 'load-path (expand-file-name "core" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "modules" user-emacs-directory))

(defun pawn/org-load (filename)
  "Load `modules-org/FILENAME'."
  (org-babel-load-file
   (expand-file-name (concat "modules-org/" filename ".org")
                     user-emacs-directory)))

(require 'pawn-packages)
(require 'pawn-basic)
(require 'pawn-ido)
(require 'pawn-projectile)
(require 'pawn-snippet)
(require 'pawn-avy)
(require 'pawn-utils)
(require 'pawn-keybindings)
(require 'pawn-hydra)
(require 'pawn-os)
(require 'pawn-ui)
(require 'pawn-modeline)
(require 'pawn-parens)
(require 'pawn-org)
(require 'pawn-lisp)

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
