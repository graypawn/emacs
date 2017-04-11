;;; pawn-basic.el --- Basic Configuration
;;; Commentary:
;;; Code:

;; * packages:
;; * --------------
;; * backup-walker
;; * shell-switcher
;; * undo-tree
;; * auto-complete
;; * magit
;; * flycheck
;; * expand-region
;; * markdown-mode
;; * cmake-mode
;; * pkgbuild-mode

;; Set environment coding system
(set-language-environment "Korean")
(prefer-coding-system 'japanese-shift-jis-dos)
(prefer-coding-system 'utf-8)

;; Tab
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)

;; Newline at end of file
(setq require-final-newline t)

;; Do not ask, just follow symbolic links
(setq vc-follow-symlinks t)

;; Fill Column
;; M-x fill-paragraph
(setq-default fill-column 80)
(add-hook 'text-mode-hook 'turn-on-auto-fill)

;; Backup
(setq backup-directory-alist `(("." . "~/.emacs-saves"))
      delete-old-versions t
      kept-old-versions 3
      kept-new-versions 6
      version-control t)

;; Hippie
;; hippie expand is dabbrev expand on steroids
(setq hippie-expand-try-functions-list
      '(try-expand-dabbrev
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill
        try-complete-file-name-partially
        try-complete-file-name
        try-expand-all-abbrevs
        try-expand-list
        try-expand-line
        try-complete-lisp-symbol-partially
        try-complete-lisp-symbol))

(use-package backup-walker
  :ensure t
  :bind (("C-x M-b" . backup-walker-start)))

(use-package tramp
  ;; Tramp는 ssh 접속을 하는데 사용된다.
  ;; 또한 Root 권한으로 파일을 수정하는데도 사용된다.
  :defer t
  :config
  (setq tramp-default-method "ssh"))

(use-package whitespace
  ;; whitespace 모드를 통해 안 좋은 공백을 시각화 한다.
  ;; 라인 끝의 공백 (trailing whitespace), TAB이 이런 공백에 해당된다.
  ;; 또한 Programming 모드에서는 80 컬럼을 넘어가는 문자도 강조한다.
  :diminish global-whitespace-mode
  :config
  (global-whitespace-mode t)

  (add-hook
   'after-change-major-mode-hook
   '(lambda ()
      (if (derived-mode-p 'prog-mode)
          (setq whitespace-line-column 80
                whitespace-style '(face tabs trailing lines-tail))
        (setq whitespace-line-column nil
              whitespace-style '(face tabs trailing))))))

(use-package compile
  :defer t
  :config
  (setq compilation-ask-about-save nil         ;Just save before compiling.
        compilation-scroll-output 'first-error ;Automatically scroll to first
                                               ;error.
        compilation-always-kill t              ;Just kill old compile processes
                                               ;before starting the new one.
   ))

;; Eshell
(use-package em-prompt
  :defer t
  :config
  ;; eshell에서 맨 앞에 붙는 "$" 문구를 변경한다.
  (use-package em-dirs
    :defer t
    :config
    (setq eshell-prompt-function
        (lambda ()
          (concat
           (car (last (split-string (pwd) "/")))
           " $ ")))))

(use-package shell-switcher
  :ensure t
  :config
  (shell-switcher-mode t))

(use-package flyspell
  :diminish flyspell-mode
  :if (executable-find "aspell")
  :init
  (add-hook 'prog-mode-hook 'flyspell-prog-mode)
  (add-hook 'text-mode-hook 'flyspell-mode)
  :config
  (setq ispell-program-name "aspell" ; use aspell instead of ispell
        ispell-extra-args '("--sug-mode=ultra"))

  (bind-keys :map flyspell-mode-map
    ("C-;" . nil)
    ("C-M-i" . nil)
    ("C-," . nil)
    ("C-," . nil)
    ("C-c $" . nil)))

(use-package view
  :init
  (setq view-read-only t)
  :config
  (bind-key "g" 'avy-goto-line view-mode-map)
  (bind-key ";" 'avy-goto-word-or-subword-1 view-mode-map)
  ;; I don't want to leave the view-mode.
  (unbind-key "c" view-mode-map)
  (unbind-key "q" view-mode-map)
  (unbind-key "Q" view-mode-map)
  (unbind-key "e" view-mode-map))

(use-package undo-tree
  :ensure t
  :diminish undo-tree-mode
  :init
  ;;  (setq undo-tree-auto-save-history t)
  ;;  (setq undo-tree-history-directory-alist `(("." . "~/.undo-tree")))
  :config
  (setq undo-tree-visualizer-timestamps t)
  (global-undo-tree-mode t))

(use-package auto-complete
    :ensure t
    :diminish auto-complete-mode
    :config
    (ac-config-default))

(use-package magit
  :ensure t
  :bind ("C-x g" . magit-status))

(use-package flycheck
  :ensure t
  :diminish flycheck-mode
  :config
  (global-flycheck-mode t))

(use-package expand-region
  :ensure t
  :bind ("C-=" . er/expand-region))

;; Extension mode packages
;; ==================================================
(use-package markdown-mode :ensure t)
(use-package cmake-mode
  :ensure t
  :if (executable-find "cmake"))
(use-package pkgbuild-mode
  :ensure t
  :if (executable-find "pacman"))

(provide 'pawn-basic)
;;; pawn-basic.el ends here
