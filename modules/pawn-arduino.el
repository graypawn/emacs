;;; pawn-arduino.el --- arduino
;;; Commentary:
;;; Code:

(use-package arduino-mode
  :config
  (add-hook 'arduino-mode-hook 'origami-mode)
  (add-to-list 'origami-parser-alist '(arduino-mode . origami-c-style-parser)))

(provide 'pawn-arduino)
;;; pawn-arduino.el ends here
