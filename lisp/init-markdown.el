(require-package 'markdown-mode)

(defun convert-markdown-to (newtype)
  "Converts the current buffer, assumed to be in Markdown format,
into a new format.  The new format must be one acceptable to
`Pandoc'.  The function opens the new file in a buffer if called
interactively.  If not called interactively then it returns the
name of the new file."
  (interactive "sOutput: ")
  (let ((current-document (buffer-file-name))
        (temp-filename (concat "/tmp/output." newtype)))
    (with-temp-file temp-filename
      (call-process-shell-command (concat "pandoc -f markdown -t " newtype)
                                  nil t nil current-document))
    (cond ((called-interactively-p 'any)
           (with-current-buffer (find-file temp-filename)))
          (t temp-filename))))

(with-eval-after-load 'markdown-mode
  (define-key markdown-mode-map (kbd "C-c c") 'convert-markdown-to))

(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))

(setq markdown-command "pandoc -s --highlight-style zenburn -f markdown -t html")

(provide 'init-markdown)
