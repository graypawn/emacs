;;package
(require 'package)
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/")
	     t)
(package-initialize)

(defconst hamlet/package '(clojure-mode
			   cider
			   auto-complete))

(dolist (pkg hamlet/package)
  (when (not (package-installed-p pkg))
    (package-install pkg)))

;;Dont't use UI
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

;;default start
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)
(setq column-number-mode t)

;;show paren mode
(setq show-paren-delay 0)
(show-paren-mode 1)

;;view-stytle
(setq indent-tabs-mode nil) ; tab -> space
