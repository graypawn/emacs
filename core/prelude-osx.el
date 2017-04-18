;;; prelude-osx.el --- Emacs Prelude: OSX specific settings.
;;; Commentary:
;;; Code:

;; On OS X Emacs doesn't use the shell PATH if it's not started from
;; the shell. Let's fix that:
(use-package exec-path-from-shell :ensure t)
(use-package vkill :ensure t)

(exec-path-from-shell-initialize)

;; It's all in the Meta
(setq ns-function-modifier 'hyper)

;; proced-mode doesn't work on OS X so we use vkill instead
(autoload 'vkill "vkill" nil t)
(global-set-key (kbd "C-x p") 'vkill)

(defun prelude-swap-meta-and-super ()
  "Swap the mapping of Meta and Super.
Very useful for people using their Mac with a
Windows external keyboard from time to time."
  (interactive)
  (if (eq mac-command-modifier 'super)
      (progn
        (setq mac-command-modifier 'meta)
        (setq mac-option-modifier 'super)
        (message "Command is now bound to META and Option is bound to SUPER."))
    (progn
      (setq mac-command-modifier 'super)
      (setq mac-option-modifier 'meta)
      (message "Command is now bound to SUPER and Option is bound to META."))))

(menu-bar-mode +1)

;; Enable emoji, and stop the UI from freezing when trying to display them.
(if (fboundp 'set-fontset-font)
    (set-fontset-font t 'unicode "Apple Color Emoji" nil 'prepend))


(provide 'prelude-osx)
;;; prelude-osx.el ends here
