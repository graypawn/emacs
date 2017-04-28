;;; prelude-ido.el --- Ido setup
;;
;; Copyright © 2011-2017 Bozhidar Batsov
;;
;; Author: Bozhidar Batsov <bozhidar@batsov.com>
;; URL: https://github.com/bbatsov/prelude
;; Version: 1.0.0
;; Keywords: convenience

;; This file is not part of GNU Emacs.

;;; Commentary:

;; Ido-related config.

;;; License:

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License
;; as published by the Free Software Foundation; either version 3
;; of the License, or (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Code:

(require 'ido)
(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-ignore-extensions t
      ido-create-new-buffer 'always
      ido-use-filename-at-point nil
      ido-max-prospects 10
      ido-everywhere t
      ido-save-directory-list-file (expand-file-name "ido.hist"
                                                     prelude-savefile-dir)
      ido-default-file-method 'selected-window
      ido-auto-merge-work-directories-length -1)
(ido-mode +1)

(add-hook 'ido-setup-hook
          (lambda ()
            (define-key ido-completion-map (kbd "M-n") 'ido-next-match)
            (define-key ido-completion-map (kbd "M-p") 'ido-prev-match)))


(use-package ido-ubiquitous
  :config
  (ido-ubiquitous-mode +1))

;;; smarter fuzzy matching for ido
(use-package flx-ido
  :config
  (flx-ido-mode +1)
  ;; disable ido faces to see flx highlights
  (setq ido-use-faces nil))

;;; smex, remember recently and most frequently used commands
(use-package smex
  :bind (([remap execute-extended-command] . smex)
         ("M-X" . smex-major-mode-commands))
  :config
  (setq smex-save-file (expand-file-name ".smex-items" prelude-savefile-dir))
  (smex-initialize))

;; use icomplete in minibuffer
(icomplete-mode t)


(add-hook 'ibuffer-hook
          (lambda ()
            (ibuffer-vc-set-filter-groups-by-vc-root)
            (unless (eq ibuffer-sorting-mode 'alphabetic)
              (ibuffer-do-sort-by-alphabetic))))

(eval-after-load 'ibuffer
  (use-package ibuffer-vc))

(setq ibuffer-formats
      '((mark modified read-only vc-status-mini " "
              (name 18 18 :left :elide)
              " "
              (mode 16 16 :left :elide)
              " "
              filename-and-process)))

(provide 'prelude-ido)
;;; prelude-ido.el ends here
