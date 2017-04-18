;;; prelude-core.el --- Emacs Prelude: Core Prelude functions.
;;; Commentary:
;;; Code:

(require 'thingatpt)
(require 'dash)
(require 'ov)

(defun prelude-buffer-mode (buffer-or-name)
  "Retrieve the `major-mode' of BUFFER-OR-NAME."
  (with-current-buffer buffer-or-name
    major-mode))

(defun prelude-search (query-url prompt)
  "Open the search url constructed with the QUERY-URL.
PROMPT sets the `read-string prompt."
  (browse-url
   (concat query-url
           (url-hexify-string
            (if mark-active
                (buffer-substring (region-beginning) (region-end))
              (read-string prompt))))))

(defmacro prelude-install-search-engine (search-engine-name search-engine-url search-engine-prompt)
  "Given some information regarding a search engine, install the interactive command to search through them"
  `(defun ,(intern (format "prelude-%s" search-engine-name)) ()
       ,(format "Search %s with a query or region if any." search-engine-name)
       (interactive)
       (prelude-search ,search-engine-url ,search-engine-prompt)))

(prelude-install-search-engine "google" "http://www.google.com/search?q=" "Google: ")
(prelude-install-search-engine "github" "https://github.com/search?q=" "Search GitHub: ")

(defun prelude-todo-ov-evaporate (_ov _after _beg _end &optional _length)
  (let ((inhibit-modification-hooks t))
    (if _after (ov-reset _ov))))

(defun prelude-annotate-todo ()
  "Put fringe marker on TODO: lines in the curent buffer."
  (interactive)
  (ov-set (format "[[:space:]]*%s+[[:space:]]*TODO:" comment-start)
          'before-string
          (propertize (format "A")
                      'display '(left-fringe right-triangle))
          'modification-hooks '(prelude-todo-ov-evaporate)))

(defun prelude-recompile-init ()
  "Byte-compile all your dotfiles again."
  (interactive)
  (byte-recompile-directory prelude-dir 0))

(defun prelude-eval-after-init (form)
  "Add `(lambda () FORM)' to `after-init-hook'.

    If Emacs has already finished initialization, also eval FORM immediately."
  (let ((func (list 'lambda nil form)))
    (add-hook 'after-init-hook func)
    (when after-init-time
      (eval form))))

(defun pawn/switch-buffer-scratch ()
  "Switch to the scratch buffer.
If the buffer doesn't exist, create it and write the initial message into it."
  (interactive)
  (let* ((scratch-buffer-name "*scratch*")
         (scratch-buffer (get-buffer scratch-buffer-name)))
    (unless scratch-buffer
      (setq scratch-buffer (get-buffer-create scratch-buffer-name))
      (with-current-buffer scratch-buffer
        (lisp-interaction-mode)
        (insert initial-scratch-message)))
    (switch-to-buffer scratch-buffer)))

(defun pawn/switch-buffer-messages ()
  "Switch to the messages buffer."
  (interactive)
  (switch-to-buffer "*Messages*"))

(defun pawn/directory-name (directory)
  "Return DIRECTORY's namestring."
  (file-name-nondirectory
   (directory-file-name directory)))

(defun pawn/default-directory-name ()
  "Return default directory name."
  (pawn/directory-name default-directory))

(defun pawn/current-lispy-namespace (separator)
  "SEPARATOR."
  (if (projectile-project-p)
      (let ((project-name (projectile-project-name))
            (project-relative-name
             (file-relative-name (file-truename default-directory)
                                 (projectile-project-root))))
        (cond ((string= project-relative-name "./") project-name)
              ((string= project-relative-name "src/") project-name)
              ((concat (projectile-project-name)
                       separator
                       (directory-file-name project-relative-name)))))
    (pawn/default-directory-name)))

(provide 'prelude-core)
;;; prelude-core.el ends here
