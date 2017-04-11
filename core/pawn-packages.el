;;; pawn-packages.el --- Packages Configuration
;;; Commentary:

;; * Packages:
;; * ---------
;; * use-package
;; * diminish

;;; Code:

;; PACKAGE
;; ==================================================
(require 'package)
(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("melpa-stable" . "http://stable.melpa.org/packages/")
        ("gnu" . "http://elpa.gnu.org/packages/")))

(setq package-user-dir (expand-file-name "elpa" user-emacs-directory))
(eval-and-compile
  (package-initialize))

;; USE-PACKAGE
;; ==================================================
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-and-compile
  (require 'use-package))
(require 'diminish)

(provide 'pawn-packages)
;;; pawn-packages.el ends here
