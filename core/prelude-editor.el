;;; prelude-editor.el --- Emacs Prelude: enhanced core editing experience.
;;; Commentary:
;;; Code:

;; Death to the tabs!  However, tabs historically indent to the next
;; 8-character offset; specifying anything else will cause *mass*
;; confusion, as it will change the appearance of every existing file.
;; In some cases (python), even worse -- it will change the semantics
;; (meaning) of the program.
;;
;; Emacs modes typically provide a standard means to change the
;; indentation width -- eg. c-basic-offset: use that to adjust your
;; personal indentation width, while maintaining the style (and
;; meaning) of any files you load.

;; Set environment coding system
(set-language-environment "Korean")
(prefer-coding-system 'japanese-shift-jis-dos)
(prefer-coding-system 'utf-8)
(setq default-input-method 'japanese)

;;; Tab
(setq-default indent-tabs-mode nil)   ; don't use tabs to indent
(setq-default tab-width 4)            ; but maintain correct appearance

;; Newline at end of file
(setq require-final-newline t)

;; Do not ask, just follow symbolic links
(setq vc-follow-symlinks t)

;; delete the selection with a keypress
(delete-selection-mode t)

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


;; saveplace remembers your location in a file when saving files
(setq save-place-file (expand-file-name "saveplace" prelude-savefile-dir))
;; activate it for all buffers
(if (< emacs-major-version 25)
    (progn (require 'saveplace)
           (setq-default save-place t))
  (save-place-mode 1))


;; savehist keeps track of some history
(require 'savehist)
(setq savehist-additional-variables
      ;; search entries
      '(search-ring regexp-search-ring)
      ;; save every minute
      savehist-autosave-interval 60
      ;; keep the home clean
      savehist-file (expand-file-name "savehist" prelude-savefile-dir))
(savehist-mode +1)


;; automatically save buffers associated with files on buffer switch
;; and on windows switch
(defun prelude-auto-save-command ()
  "Save the current buffer if `prelude-auto-save' is not nil."
  (when (and prelude-auto-save
             buffer-file-name
             (buffer-modified-p (current-buffer))
             (file-writable-p buffer-file-name))
    (save-buffer)))

(defmacro advise-commands (advice-name commands class &rest body)
  "Apply advice named ADVICE-NAME to multiple COMMANDS.

The body of the advice is in BODY."
  `(progn
     ,@(mapcar (lambda (command)
                 `(defadvice ,command
                      (,class
                       ,(intern (concat (symbol-name command) "-" advice-name))
                       activate)
                    ,@body))
               commands)))

;; advise all window switching functions
(advise-commands "auto-save"
                 (switch-to-buffer other-window)
                 before
                 (prelude-auto-save-command))

(add-hook 'mouse-leave-buffer-hook 'prelude-auto-save-command)

(when (version<= "24.4" emacs-version)
  (add-hook 'focus-out-hook 'prelude-auto-save-command))


;; revert buffers automatically when underlying files are changed externally
(global-auto-revert-mode t)
(diminish 'auto-revert-mode)


(defadvice set-buffer-major-mode (after set-major-mode activate compile)
  "Set buffer major mode according to `auto-mode-alist'."
  (let* ((name (buffer-name buffer))
         (mode (assoc-default name auto-mode-alist 'string-match)))
    (when (and mode (consp mode))
      (setq mode (car mode)))
    (with-current-buffer buffer (if mode (funcall mode)))))


;; enable case region command
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

(global-unset-key (kbd "C-x C-l"))
(global-unset-key (kbd "C-x C-u"))


;; note - this should be after volatile-highlights is required
;; add the ability to cut the current line, without marking it
(require 'rect)
(crux-with-region-or-line kill-region)


;; tramp, for sudo access
(require 'tramp)
;; keep in mind known issues with zsh - see emacs wiki
(setq tramp-default-method "ssh")


;; enable erase-buffer command
(put 'erase-buffer 'disabled nil)


;; bookmarks
(require 'bookmark)
(setq bookmark-default-file (expand-file-name "bookmarks" prelude-savefile-dir)
      bookmark-save-flag 1)


;; dired - reuse current buffer by pressing 'a'
(put 'dired-find-alternate-file 'disabled nil)

;; always delete and copy recursively
(setq dired-recursive-deletes 'always)
(setq dired-recursive-copies 'always)

;; if there is a dired buffer displayed in the next window, use its
;; current subdir, instead of the current subdir of this dired buffer
(setq dired-dwim-target t)

;; enable some really cool extensions like C-x C-j(dired-jump)
(require 'dired-x)


;; ediff - don't start another frame
(require 'ediff)
(setq ediff-window-setup-function 'ediff-setup-windows-plain)


;; clean up obsolete buffers automatically
(require 'midnight)


(defadvice exchange-point-and-mark (before deactivate-mark activate compile)
  "When called with no active region, do not activate mark."
  (interactive
   (list (not (region-active-p)))))


(require 'tabify)
(defmacro with-region-or-buffer (func)
  "When called with no active region, call FUNC on current buffer."
  `(defadvice ,func (before with-region-or-buffer activate compile)
     (interactive
      (if mark-active
          (list (region-beginning) (region-end))
        (list (point-min) (point-max))))))

(with-region-or-buffer indent-region)
(with-region-or-buffer untabify)


;; automatically indenting yanked text if in programming-modes
(defun yank-advised-indent-function (beg end)
  "Do indentation, as long as the region isn't too large."
  (when (<= (- end beg) prelude-yank-indent-threshold)
    (indent-region beg end nil)))

(advise-commands
 "indent" (yank yank-pop) after
 "If current mode is one of `prelude-yank-indent-modes', indent yanked text (with prefix arg don't indent)."
 (if (and (not (ad-get-arg 0))
          (not (member major-mode prelude-indent-sensitive-modes))
          (or (derived-mode-p 'prog-mode)
              (member major-mode prelude-yank-indent-modes)))
     (let ((transient-mark-mode nil))
       (yank-advised-indent-function (region-beginning) (region-end)))))


;; saner regex syntax
(require 're-builder)
(setq reb-re-syntax 'string)

(setq semanticdb-default-save-directory
      (expand-file-name "semanticdb" prelude-savefile-dir))


;; Compilation from Emacs
(defun prelude-colorize-compilation-buffer ()
  "Colorize a compilation mode buffer."
  (interactive)
  ;; we don't want to mess with child modes such as grep-mode, ack, ag, etc
  (when (eq major-mode 'compilation-mode)
    (let ((inhibit-read-only t))
      (ansi-color-apply-on-region (point-min) (point-max)))))

(require 'compile)
(setq
 ;; Just save before compiling
 compilation-ask-about-save nil
 ;; Just kill old compile processes before starting the new one
 compilation-always-kill t
 ;; Automatically scroll to first error
 compilation-scroll-output 'first-error
 )


;; Colorize output of Compilation Mode, see
;; http://stackoverflow.com/a/3072831/355252
(require 'ansi-color)
(add-hook 'compilation-filter-hook #'prelude-colorize-compilation-buffer)


;; Rectangle selections, and overwrite text when the selection is active
(cua-selection-mode t)                  ; for rectangles, CUA is nice


(defun origami-cycle (recursive)
  "Receive RECURSIVE and use origami like `org-mode'."
  (interactive "P")
  (call-interactively
   (if recursive 'origami-toggle-all-nodes 'origami-toggle-node)))

(use-package origami
  :config
  (defun origami-elisp-parser (create)
    (origami-lisp-parser
     create
     "(\\(use-package\\|def\\)\\w*\\s-*\\(\\s_\\|\\w\\|[:?!]\\)*\\([ \\t]*(.*?)\\)?"))

  (add-hook 'prog-mode-hook 'origami-mode)
  (bind-key "M-`" 'origami-cycle origami-mode-map))


(use-package flycheck
  :config
  (setq flycheck-mode-line-prefix "FC"))


;; projectile is a project management mode
(use-package projectile
  :diminish projectile-mode
  :config
  (setq projectile-enable-caching t)
  (setq projectile-cache-file
        (expand-file-name  "projectile.cache" prelude-savefile-dir)
        projectile-switch-project-action 'projectile-dired)
  (projectile-mode)

  ;; projectile가 root를 찾는 루틴
  ;; `projectile-project-root-files-functions' 에 정의된 순서대로 함수를 실행한다.
  ;; 1. `projectile-root-local' 신경쓰지 말자.
  ;; 2. `projectile-root-bottom-up'
  ;;     projectile-project-root-files-bottom-up 에 정의된 파일을 찾는다.
  ;;     상위로 올라가며 가장 먼저 발견하는 곳이 root다.
  ;;     (ex: .projectile .git)
  ;; 3. `projectile-root-top-down'
  ;;     projectile-project-root-files 에 정의된 파일을 찾는다.
  ;;     상위로 올라가며 가장 먼저 발견하는 곳이 root다.
  ;;     (ex: .GTAGS setup.py project.clj)
  ;; 4. `projectile-root-top-down-recurring'
  ;;     가장 최상위에 존재하는 projectile-project-root-files-top-down-recurring
  ;;     에 정의된 파일을 찾는다.
  ;;     (ex: Makefile)

  (defun pawn-projectile-test-prefix (project-type)
    "Find default test files prefix based on PROJECT-TYPE."
    (cond
     ((member project-type '(django python-pip python-pkg python-tox)) "test_")
     ((member project-type '(emacs-cask)) "test-")
     ((member project-type '(lein-midje)) "t_")
     ((member project-type '(common-lisp)) "t-")))

  (setq projectile-test-prefix-function 'pawn-projectile-test-prefix))


(use-package magit
  :bind ("C-x g" . magit-status))


(require 'eshell)
(setq eshell-directory-name (expand-file-name "eshell" prelude-savefile-dir))

(require 'em-prompt)
(setq eshell-prompt-function
      (lambda ()
        (-> (eshell/pwd)
            (split-string "/")
            (last)
            (car)
            (concat " $ "))))

(use-package shell-switcher
  :config
  (shell-switcher-mode t))


(setq backup-directory-alist
      `((".*" . "~/.emacs-saves")))
(setq auto-save-file-name-transforms
      `((".*" "~/.emacs-saves" t)))

(setq delete-old-versions t
      kept-old-versions 3
      kept-new-versions 6
      version-control t)

(use-package backup-walker
  :bind (("C-x M-b" . backup-walker-start)))


;; make a shell script executable automatically on save
(add-hook 'after-save-hook
          'executable-make-buffer-file-executable-if-script-p)

;; .zsh file is shell script too
(add-to-list 'auto-mode-alist '("\\.zsh\\'" . shell-script-mode))


;; NAVIGATE
(use-package avy
  :bind (("C-:" . avy-goto-word-or-subword-1)
         ("M-g" . avy-goto-line)
         :map isearch-mode-map
         ("C-'" . avy-isearch))
  :config
  (setq avy-background t)
  (setq avy-style 'at-full))

(use-package ace-window
  :bind ("C-;" . ace-window))


(use-package view
  :init
  (setq view-read-only t)
  :config
  (bind-keys :map view-mode-map
             ("g" . avy-goto-line)
             (";" . avy-goto-word-or-subword-1)
             ;; I don't want to leave the view-mode.
             ("c" . nil)
             ("q" . nil)
             ("Q" . nil)
             ("e" . nil)))


(use-package expand-region
  :bind ("C-=" . er/expand-region))


;; flyspell-mode does spell-checking on the fly as you type
(require 'flyspell)
(diminish 'flyspell-mode)
(setq ispell-program-name "aspell" ; use aspell instead of ispell
      ispell-extra-args '("--sug-mode=ultra"))

(defun prelude-enable-flyspell ()
  "Enable command `flyspell-mode' if `prelude-flyspell' is not nil."
  (when (and prelude-flyspell
             (executable-find ispell-program-name))
    (flyspell-mode +1)))

(add-hook 'text-mode-hook 'prelude-enable-flyspell)

(setq flyspell-use-meta-tab nil)

(bind-keys :map flyspell-mode-map
           ("C-;" . nil)
           ("C-." . nil)
           ("C-," . nil)
           ("C-M-i" . nil)
           ("C-c $" . nil))


;; meaningful names for buffers with the same name
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)
(setq uniquify-separator "/")
(setq uniquify-after-kill-buffer-p t)    ; rename after killing uniquified
(setq uniquify-ignore-buffers-re "^\\*") ; don't muck with special buffers


;; smarter kill-ring navigation
(use-package browse-kill-ring
  :bind (("C-x C-y" . browse-kill-ring)
         :map browse-kill-ring-mode-map
         ("C-g" . browse-kill-ring-quit)
         ("M-n" . browse-kill-ring-forward)
         ("M-p" . browse-kill-ring-previous))
  :config
  (browse-kill-ring-default-keybindings))


;; anzu-mode enhances isearch & query-replace by showing total matches
;; and current match position
(use-package anzu
  :diminish anzu-mode
  :bind (([remap query-replace] . anzu-query-replace)
         ([remap query-replace-regexp] . anzu-query-replace-regexp)
         :map isearch-mode-map
         ([remap isearch-query-replace] . anzu-isearch-query-replace)
         ([remap isearch-query-replace-regexp] . anzu-isearch-query-replace-regexp))
  :config
  (global-anzu-mode))


(require 'whitespace)
(global-whitespace-mode t)
(diminish 'whitespace-mode)
(diminish 'global-whitespace-mode)
(setq whitespace-line-column 80)
(setq whitespace-style '(face tabs trailing empty))

(custom-set-faces '(whitespace-empty ((t (:background nil)))))

(use-package whitespace-cleanup-mode
  :diminish whitespace-cleanup-mode
  :config
  (global-whitespace-cleanup-mode t))


(use-package multiple-cursors
  :bind (("C->" . mc/mark-next-like-this)
         ("C-<" . mc/mark-previous-like-this)
         ("C-c C->" . mc/mark-all-like-this))
  :init
  (setq mc/list-file (expand-file-name ".mc-lists.el" prelude-savefile-dir)))


(use-package undo-tree
  :diminish undo-tree-mode
  :config
  ;; autosave the undo-tree history
  (setq undo-tree-history-directory-alist
        `((".*" . ,(concat temporary-file-directory "undo-tree/"))))
  (setq undo-tree-auto-save-history t
        undo-tree-visualizer-timestamps t)

  (global-undo-tree-mode))


(use-package diff-hl
  :config
  (global-diff-hl-mode +1)
  (add-hook 'dired-mode-hook 'diff-hl-dired-mode)
  (add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh))


(defadvice server-visit-files (before
                               parse-numbers-in-lines
                               (files proc &optional nowait)
                               activate)
  "Open file with emacsclient with cursors positioned on requested line.
Most of console-based utilities prints filename in format
'filename:linenumber'.  So you may wish to open filename in that format.
Just call:

  emacsclient filename:linenumber

and file 'filename' will be opened and cursor set on line 'linenumber'"
  (ad-set-arg
   0
   (mapcar (lambda (fn)
             (let ((name (car fn)))
               (if (string-match "^\\(.*?\\):\\([0-9]+\\)\\(?::\\([0-9]+\\)\\)?$"
                                 name)
                   (cons
                    (match-string 1 name)
                    (cons (string-to-number (match-string 2 name))
                          (string-to-number (or (match-string 3 name) ""))))
                 fn)))
           files)))


;; use settings from .editorconfig file when present
(use-package editorconfig
  :diminish editorconfig-mode
  :config
  (editorconfig-mode 1))


(use-package page-break-lines
  :diminish page-break-lines-mode
  :config
  (global-page-break-lines-mode))


(use-package highlight-symbol
  :diminish highlight-symbol-mode
  :bind (("C-%" . highlight-symbol-query-replace)
         :map highlight-symbol-nav-mode-map
         ("M-n" . nil)
         ("M-p" . nil)
         ("M-N" . highlight-symbol-next)
         ("M-P" . highlight-symbol-prev)
         :map isearch-mode-map
         ("M-o". highlight-symbol-occur))
  :init
  (dolist (hook '(prog-mode-hook html-mode-hook css-mode-hook))
    (add-hook hook 'highlight-symbol-mode)
    (add-hook hook 'highlight-symbol-nav-mode))
  :config
  (defadvice highlight-symbol-temp-highlight (around
                                              sanityinc/maybe-suppress
                                              activate)
    "Suppress symbol highlighting while isearching."
    (unless (or isearch-mode
                (and (boundp 'multiple-cursors-mode) multiple-cursors-mode))
      ad-do-it)))

(custom-set-faces
 '(highlight-symbol-face ((t (:background "#545454")))))


;; ISearch Yank
(require 'thingatpt)

(defun isearch-yank-word-or-char-from-beginning ()
  "Move to beginning of word before yanking word in `isearch-mode'."
  (interactive)
  (if (= 0 (length isearch-string))
      (beginning-of-thing 'word))
  (isearch-yank-word-or-char)
  (substitute-key-definition 'isearch-yank-word-or-char-from-beginning
                             'isearch-yank-word-or-char
                             isearch-mode-map))

(add-hook 'isearch-mode-hook
          (lambda ()
            "Activate my customized Isearch word yank command."
            (substitute-key-definition 'isearch-yank-word-or-char
                                       'isearch-yank-word-or-char-from-beginning
                                       isearch-mode-map)))

(defun isearch-yank-symbol ()
  "Pull symbol from point."
  (interactive)
  (beginning-of-thing 'symbol)
  (isearch-yank-internal
   (lambda ()
     (end-of-thing 'symbol)
     (point))))

(define-key isearch-mode-map (kbd "M-w") 'isearch-yank-symbol)

(defun mark-symbol ()
  "Put mark at end of this symbol, point at beginning."
  (interactive)
  (end-of-thing 'symbol)
  (set-mark (point))
  (beginning-of-thing 'symbol))

(global-set-key (kbd "C-*") 'mark-symbol)


(defun toggle-default-input-method ()
  "Turn on or off a default input method."
  (interactive)
  (if (string= current-input-method
               default-input-method)
      (deactivate-input-method)
    (activate-input-method default-input-method)))

(global-set-key (kbd "C-\\") 'toggle-default-input-method)
(global-set-key (kbd "C-|") 'set-input-method) ;Select and activate input method.


(defun just-one-space-in-rect-line (start end)
  (save-restriction
    (save-match-data
      (narrow-to-region (+ (point) start)
                        (+ (point) end))
      (while (re-search-forward "\\s-+" nil t)
        (replace-match " ")))))

(defun just-one-space-in-rect (start end)
  "replace all whitespace in the rectangle with single spaces"
  (interactive "r")
  (apply-on-rectangle 'just-one-space-in-rect-line start end))

(define-key cua--region-keymap [remap just-one-space] 'just-one-space-in-rect)


(add-hook 'prog-mode-hook 'goto-address-prog-mode)

(provide 'prelude-editor)
;;; prelude-editor.el ends here
