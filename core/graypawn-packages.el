(require 'cl)
(require 'package)

(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("melpa-stable" . "http://stable.melpa.org/packages/")
        ("gnu" . "http://elpa.gnu.org/packages/")
        ))

(setq package-user-dir (expand-file-name "elpa" user-emacs-directory))
(package-initialize)

(defvar graypawn-packages
  '(projectile
    magit
    undo-tree
    autopair
    paredit
    fold-dwim
    hideshow

    markdown-mode
    cmake-mode
    pkgbuild-mode
    ))

(defun graypawn-packages-installed-p ()
  "Check if all packages in `graypawn-packages' are installed."
  (every #'package-installed-p graypawn-packages))

(defun graypawn-require-package (package)
  "Install PACKAGE unless already installed."
  (unless (memq package graypawn-packages)
    (add-to-list 'graypawn-packages package))
  (unless (package-installed-p package)
    (package-install package)))

(defun graypawn-require-packages (packages)
  "Ensure PACKAGES are installed.
Missing packages are installed automatically."
  (mapc #'graypawn-require-package packages))

(defun graypawn-install-packages ()
  "Install all packages listed in `prelude-packages'."
  (unless (graypawn-packages-installed-p)
    ;; check for new packages (package versions)
    (message "%s" "Emacs is now refreshing its package database...")
    (package-refresh-contents)
    (message "%s" " done.")
    ;; install the missing packages
    (graypawn-require-packages graypawn-packages)))

;; run package installation
(graypawn-install-packages)

(provide 'graypawn-packages)
