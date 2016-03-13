(defvar graypawn-core-dir
  (expand-file-name "core" user-emacs-directory))
(defvar graypawn-modules-dir
  (expand-file-name "modules" user-emacs-directory))
(defvar graypawn-modules-file
  (expand-file-name "graypawn-modules.el" user-emacs-directory)
  "This files contains a list of modules.")

(add-to-list 'load-path graypawn-core-dir)
(add-to-list 'load-path graypawn-modules-dir)

(require 'graypawn-packages)
(require 'graypawn-os)
(require 'graypawn-core)

(require 'graypawn-themes) ;color theme
(require 'graypawn-ui)
(require 'graypawn-keybindings)

;;; Load "custom.el"
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

;; the modules
(if (file-exists-p graypawn-modules-file)
    (load graypawn-modules-file)
    (message "Missing modules file %s" graypawn-modules-file)
    (message "You can get started by copying the bundled example file"))

(provide 'init)

