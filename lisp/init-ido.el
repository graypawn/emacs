(ido-mode t)
(ido-everywhere t)

(setq ido-use-filename-at-point nil)
(setq ido-enable-flex-matching t)

;;; 현재 폴더만을 검색하기 위해서 -1로 설정한다.
(setq ido-auto-merge-work-directories-length -1)

(provide 'init-ido)
