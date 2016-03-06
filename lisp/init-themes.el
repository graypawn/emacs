; This file is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs.  If not, see <http://www.gnu.org/licenses/>.

(defgroup graypawn-theme-group nil
  "graypawn-theme options."
  :group 'faces)

(defcustom graypawn-variable-pitch t
  "Use variable pitch for like latex markdown or org-mode"
  :type 'boolean
  :group 'graypawn-theme-group)

(defcustom graypawn-comment-bg t
  "Use a background for comment lines."
  :type 'boolean
  :group 'graypawn-theme-group)

(defcustom graypawn-org-height t
  "Use varying text heights for org headings."
  :type 'boolean
  :group 'graypawn-theme-group)

(defcustom graypawn-tex-height-90 0.9
  "Font size 90%"
  :type 'number
  :group 'graypawn-theme-group)

(defcustom graypawn-tex-height-110 1.1
  "Font size 110%"
  :type 'number
  :group 'graypawn-theme-group)

(defcustom graypawn-tex-height-120 1.2
  "Font size 120%"
  :type 'number
  :group 'graypawn-theme-group)

(defcustom graypawn-tex-height-130 1.3
  "Font size 130%"
  :type 'number
  :group 'graypawn-theme-group)

(deftheme graypawn-theme)

(let ((class '((class color) (min-colors 89)))
      (base          "#AEBFAE")
      (cursor        "#eddebd")
      (bg1           "#262626")
      (bg2           "#4E4E4E")
      (bg3           "#585858")
      (bg4           "#6C6C6C")
      (key1          "#AF5F87")
      (key2          "#D700AF")
      (builtin       "#957c65")
      (keyword       "#d4576f")
      (const         "#98a299")
      (comment       "#6E756D")
      (comment-bg    "#262626")
      (func          "#adb78d")
      (str           "#87afaf")
      (type          "#5f87af")
      (comp          "#e47376")
      (var           "#d37a60")
      (err           "#8e6a60")
      (war           "#d99481")
      (inf           "#5FAFAF")
      (interop       "#82859c")
      (suc           "#bdc79e")
      (green         "#adb78d")
      (yellow        "#d37a60")
      (cyan          "#8b8b7f")
      (violet        "#75727a")
      (red           "#c5617a")
      (active1       "#585858")
      (active2       "#626262")
      (inactive      "#45b0d3")
      (m-line-brdr   "#4c4c42")
      (org-block-bg  "#36393D")
      (org-h1-bg     "#32434a")
      (org-h2-bg     "#63635a")
      (org-h3-bg     "#73735a")
      (org-h4-bg     "#4D4D44")
      (highlight     "#2a2a24")
      (green-bg      "#7b894f")
      (red-bg        "#512e31")
      (mkwd          "#D7AF87")
      (pth1          "#e19366")
      (pth2          "#f1bc6a")
      (pth3          "#4da0c4")
      (pth4          "#9aba4f")
      (pth5          "#c4556b")
      (pth6          "#5c737c")
      (pth7          "#ac907c")
      (pth8          "#e47376")
      ;; for variable pitch
      (pawn-variable-pitch (if graypawn-variable-pitch
                              'variable-pitch 'default))
      )

  (custom-theme-set-faces
   'graypawn-theme

;;;;; basics
   `(cursor ((,class (:background ,cursor))))
   `(default ((,class (:background ,bg1 :foreground ,base))))
   `(default-italic ((,class (:italic t))))
   `(error ((,class (:foreground ,err))))
   `(eval-sexp-fu-flash ((,class (:background ,suc :foreground ,bg1))))
   `(eval-sexp-fu-flash-error ((,class (:background ,err :foreground ,bg1))))

;;;;; font-locks

   `(font-lock-builtin-face ((,class (:foreground ,builtin))))
   `(font-lock-comment-face
     ((,class (:foreground ,comment
               :background ,(when graypawn-comment-bg comment-bg)))))
   `(font-lock-constant-face ((,class (:foreground ,const))))
   `(font-lock-doc-face ((,class (:foreground ,comment))))
   `(font-lock-doc-string-face ((,class (:foreground ,comment))))
   `(font-lock-function-name-face ((,class (:foreground ,func :weight bold))))
   `(font-lock-keyword-face ((,class (:foreground ,keyword :weight bold))))
   `(font-lock-negation-char-face ((,class (:foreground ,bg4))))
   `(font-lock-preprocessor-face ((,class (:foreground ,func))))
   `(font-lock-reference-face ((,class (:foreground ,violet))))
   `(font-lock-string-face ((,class (:foreground ,str :bold t))))
   `(font-lock-type-face ((,class (:foreground ,type :italic t))))
   `(font-lock-variable-name-face ((,class (:foreground ,var))))
   `(font-lock-warning-face ((,class (:foreground ,war :background ,bg1))))

;;;;; extra font-locks
   `(clojure-keyword-face ((,class (:foreground ,mkwd :weight bold))))
   `(clojure-interop-method-face ((,class (:foreground ,interop))))
   `(elixir-atom-face ((,class (:foreground ,mkwd :weight bold))))
   `(c-annotation-face ((,class (:inherit ,font-lock-constant-face))))
   `(sh-heredoc ((,class (:inherit ,font-lock-doc-face))))
   `(css-selector ((,class (:inherit ,font-lock-keyword-face))))
   `(css-property ((,class (:inherit ,font-lock-string-face))))
   `(sh-quoted-exec ((,class (:inherit ,font-lock-function-name-face))))

;;;;; basic stuffs
   `(fringe ((,class (:background ,bg1 :foreground ,base))))
   `(highlight ((,class (:foreground ,base :background ,bg2))))
   `(hl-line ((,class (:background ,bg2))))
   `(isearch ((,class (:bold t :foreground ,inf :background ,bg1))))
   `(lazy-highlight ((,class (:foreground ,yellow
                              :background ,bg1
                              :weight normal))))
   `(link ((,class (:foreground ,inf :underline t))))
   `(link-visited ((,class (:foreground ,keyword :underline t))))
   `(match ((,class (:background ,bg1 :foreground ,inf :weight bold))))
   `(minibuffer-prompt ((,class (:bold t :foreground ,inf))))
   `(page-break-lines ((,class (:foreground ,active2))))
   `(popup-tip-face ((,class (:background ,active2
                              :foreground ,base
                              :bold nil :italic nil :underline nil))))
   `(region ((,class (:background ,highlight))))
   `(secondary-selection ((,class (:background ,bg3))))
   `(show-paren-match-face ((,class (:background ,suc))))
   `(success ((,class (:foreground ,suc))))
   `(tooltip ((,class (:background ,active2
                       :foreground ,base
                       :bold nil
                       :italic nil
                       :underline nil))))
   `(vertical-border ((,class (:foreground ,bg4))))
   `(warning ((,class (:foreground ,war ))))

;;;;; anzu-mode
   `(anzu-mode-line ((,class (:foreground ,yellow :weight bold))))

;;;;; auctex / latex-mode
   `(font-latex-bold-face ((,class (:foreground ,comp))))
   `(font-latex-italic-face ((,class (:foreground ,key2 :italic t))))
   `(font-latex-match-reference-keywords ((,class (:foreground ,const))))
   `(font-latex-match-variable-keywords ((,class (:foreground ,var))))
   `(font-latex-math-face ((,class (:foreground ,builtin :weight bold))))
   `(font-latex-sectioning-0-face
     ((,class (:inherit font-latex-sectioning-1-face
               :height ,graypawn-tex-height-110))))
   `(font-latex-sectioning-1-face
     ((,class (:inherit font-latex-sectioning-2-face
               :height ,graypawn-tex-height-110))))
   `(font-latex-sectioning-2-face
     ((,class (:inherit font-latex-sectioning-3-face
               :height ,graypawn-tex-height-110))))
   `(font-latex-sectioning-3-face
     ((,class (:inherit font-latex-sectioning-4-face
               :height ,graypawn-tex-height-110))))
   `(font-latex-sectioning-4-face
     ((,class (:inherit font-latex-sectioning-5-face
               :height ,graypawn-tex-height-110))))
   `(font-latex-sectioning-5-face
     ((,class (:inherit ,pawn-variable-pitch :foreground ,violet
               :weight bold))))
   `(font-latex-sedate-face ((,class (:foreground ,bg4))))
   `(font-latex-slide-title-face
     ((,class (:inherit (,pawn-variable-pitch font-lock-type-face)
               :weight bold :height ,graypawn-tex-height-130))))
   `(font-latex-string-face ((,class (:foreground ,str))))
   `(font-latex-subscript-face ((,class (:height ,graypawn-tex-height-90))))
   `(font-latex-superscript-face ((,class (:height ,graypawn-tex-height-90))))
   `(font-latex-warning-face
     ((,class (:inherit bold :foreground ,war :underline t))))

;;;;; company
   `(company-echo-common ((,class (:background ,bg1 :foreground ,base))))
   `(company-preview ((,class (:background ,bg1 :foreground ,key1))))
   `(company-preview-common
     ((,class (:background ,active2 :foreground ,keyword))))
   `(company-preview-search
     ((,class (:background ,active2 :foreground ,green))))
   `(company-scrollbar-bg ((,class (:background ,active2))))
   `(company-scrollbar-fg ((,class (:background ,bg3))))
   `(company-template-field ((,class (:inherit region))))
   `(company-tooltip
     ((,class (:background ,active2 :foreground ,base :bold t))))
   `(company-tooltip-annotation ((,class (:foreground ,const))))
   `(company-tooltip-common ((,class (:foreground ,type))))
   `(company-tooltip-common-selection
     ((,class (:background ,bg2 :foreground ,keyword))))
   ;;`(company-tooltip-mouse ((,class (:inherit highlight))))
   ;;`(company-tooltip-search ((,class (:inherit match))))
   `(company-tooltip-selection
     ((,class (:background ,bg2 :foreground ,const :bold t))))

;;;;; diff
   `(diff-added             ((,class :background nil :foreground ,green)))
   `(diff-changed           ((,class :background nil :foreground ,inf)))
   `(diff-indicator-added   ((,class :background nil :foreground ,green)))
   `(diff-indicator-changed ((,class :background nil :foreground ,inf)))
   `(diff-indicator-removed ((,class :background nil :foreground ,red)))
   `(diff-refine-added      ((,class :background nil :foreground ,bg4)))
   `(diff-refine-changed    ((,class :background ,green-bg :foreground ,green)))
   `(diff-refine-removed    ((,class :background ,red-bg :foreground ,red)))
   `(diff-removed           ((,class :background nil :foreground ,red)))

;;;;; dired
   `(dired-directory
     ((,class (:foreground ,key1 :background ,bg1 :weight bold))))
   `(dired-flagged ((,class (:foreground ,red))))
   `(dired-header ((,class (:foreground ,comp :weight bold))))
   `(dired-ignored ((,class (:inherit shadow))))
   `(dired-mark ((,class (:foreground ,comp :weight bold))))
   `(dired-marked ((,class (:foreground ,violet :weight bold))))
   `(dired-perm-write ((,class (:foreground ,base :underline t))))
   `(dired-symlink ((,class (:foreground ,cyan :background ,bg1 :weight bold))))
   `(dired-warning ((,class (:foreground ,war))))

;;;;; ediff
   `(ediff-current-diff-A ((,class(:background ,org-h1-bg :foreground ,inf))))
   `(ediff-current-diff-Ancestor
     ((,class(:background ,org-h2-bg :foreground ,str))))
   `(ediff-current-diff-B
     ((,class(:background ,org-h4-bg :foreground ,yellow))))
   `(ediff-current-diff-C ((,class(:background ,org-h3-bg :foreground ,green))))
   `(ediff-even-diff-A ((,class(:background ,bg3))))
   `(ediff-even-diff-Ancestor ((,class(:background ,bg3))))
   `(ediff-even-diff-B ((,class(:background ,bg3))))
   `(ediff-even-diff-C ((,class(:background ,bg3))))
   `(ediff-fine-diff-A ((,class(:background nil :bold t :underline t))))
   `(ediff-fine-diff-Ancestor ((,class(:background nil :bold t :underline t))))
   `(ediff-fine-diff-B ((,class(:background nil :bold t :underline t))))
   `(ediff-fine-diff-C ((,class(:background nil :bold t :underline t))))
   `(ediff-odd-diff-A ((,class(:background ,bg4))))
   `(ediff-odd-diff-Ancestor ((,class(:background ,bg4))))
   `(ediff-odd-diff-B ((,class(:background ,bg4))))
   `(ediff-odd-diff-C ((,class(:background ,bg4))))

;;;;; ein
   `(ein:cell-input-area((,class (:background ,bg2))))
   `(ein:cell-input-prompt ((,class (:foreground ,suc))))
   `(ein:cell-output-prompt ((,class (:foreground ,err))))
   `(ein:notification-tab-normal ((,class (:foreground ,builtin))))
   `(ein:notification-tab-selected ((,class (:foreground ,suc :bold t))))

;;;;; eldoc
   `(eldoc-highlight-function-argument ((,class (:foreground ,suc :bold t))))

;;;;; erc
   `(erc-input-face ((,class (:foreground ,func))))
   `(erc-my-nick-face ((,class (:foreground ,key1))))
   `(erc-nick-default-face ((,class (:foreground ,inf))))
   `(erc-nick-prefix-face ((,class (:foreground ,yellow))))
   `(erc-notice-face ((,class (:foreground ,str))))
   `(erc-prompt-face ((,class (:foreground ,suc :bold t))))
   `(erc-timestamp-face ((,class (:foreground ,builtin))))

;;;;; eshell
   `(eshell-ls-archive ((,class (:foreground ,red :weight bold))))
   `(eshell-ls-backup ((,class (:inherit font-lock-comment-face))))
   `(eshell-ls-clutter ((,class (:inherit font-lock-comment-face))))
   `(eshell-ls-directory ((,class (:foreground ,inf :weight bold))))
   `(eshell-ls-executable ((,class (:foreground ,suc :weight bold))))
   `(eshell-ls-missing ((,class (:inherit font-lock-warning-face))))
   `(eshell-ls-product ((,class (:inherit font-lock-doc-face))))
   `(eshell-ls-special ((,class (:foreground ,yellow :weight bold))))
   `(eshell-ls-symlink ((,class (:foreground ,cyan :weight bold))))
   `(eshell-ls-unreadable ((,class (:foreground ,base))))
   `(eshell-prompt ((,class (:foreground ,keyword :weight bold))))

;;;;; flycheck
   `(flycheck-error
     ((,(append '((supports :underline (:style line))) class)
       (:underline (:style line :color ,err)))
      (,class (:foreground ,base :background ,err :weight bold :underline t))))
   `(flycheck-error-list-checker-name ((,class (:foreground ,keyword))))
   `(flycheck-fringe-error ((,class (:foreground ,err :weight bold))))
   `(flycheck-fringe-info ((,class (:foreground ,inf :weight bold))))
   `(flycheck-fringe-warning ((,class (:foreground ,war :weight bold))))
   `(flycheck-info
     ((,(append '((supports :underline (:style line))) class)
       (:underline (:style line :color ,inf)))
      (,class (:foreground ,base :background ,inf :weight bold :underline t))))
   `(flycheck-warning
     ((,(append '((supports :underline (:style line))) class)
       (:underline (:style line :color ,war)))
      (,class (:foreground ,base :background ,war :weight bold :underline t))))

;;;;; git-gutter-fr
   `(git-gutter-fr:added ((,class (:foreground ,green :weight bold))))
   `(git-gutter-fr:deleted ((,class (:foreground ,war :weight bold))))
   `(git-gutter-fr:modified ((,class (:foreground ,inf :weight bold))))

;;;;; git-timemachine
   `(git-timemachine-minibuffer-detail-face
     ((,class (:foreground ,inf :bold t :background ,org-h1-bg))))

;;;;; gnus
   `(gnus-emphasis-highlight-words
     ((,class (:background ,err :foreground ,nil))))
   `(gnus-header-content ((,class (:foreground ,keyword))))
   `(gnus-header-from ((,class (:foreground ,var))))
   `(gnus-header-name ((,class (:foreground ,comp))))
   `(gnus-header-subject ((,class (:foreground ,func :bold t))))
   `(gnus-summary-cancelled ((,class (:background ,err :foreground ,bg1))))

;;;;; guide-key
   `(guide-key/highlight-command-face ((,class (:foreground ,base))))
   `(guide-key/key-face ((,class (:foreground ,key1))))
   `(guide-key/prefix-command-face ((,class (:foreground ,key2 :weight bold))))

;;;;; helm
   `(helm-bookmark-directory ((,class (:inherit helm-ff-directory))))
   `(helm-bookmark-file ((,class (:foreground ,base))))
   `(helm-bookmark-gnus ((,class (:foreground ,comp))))
   `(helm-bookmark-info ((,class (:foreground ,comp))))
   `(helm-bookmark-man ((,class (:foreground ,comp))))
   `(helm-bookmark-w3m ((,class (:foreground ,comp))))
   `(helm-buffer-directory ((,class (:foreground ,base :background ,bg1))))
   `(helm-buffer-file ((,class (:foreground ,base :background ,bg1))))
   `(helm-buffer-not-saved ((,class (:foreground ,comp :background ,bg1))))
   `(helm-buffer-process ((,class (:foreground ,builtin :background ,bg1))))
   `(helm-buffer-saved-out ((,class (:foreground ,base :background ,bg1))))
   `(helm-buffer-size ((,class (:foreground ,base :background ,bg1))))
   `(helm-candidate-number
     ((,class (:background ,bg1 :foreground ,inf :bold t))))
   `(helm-ff-directory
     ((,class (:foreground ,key1 :background ,bg1 :weight bold))))
   `(helm-ff-dotted-directory
     ((,class (:foreground ,key1 :background ,bg1 :weight bold))))
   `(helm-ff-executable
     ((,class (:foreground ,suc :background ,bg1 :weight normal))))
   `(helm-ff-file
     ((,class (:foreground ,base :background ,bg1 :weight normal))))
   `(helm-ff-invalid-symlink
     ((,class (:foreground ,red :background ,bg1 :weight bold))))
   `(helm-ff-prefix
     ((,class (:foreground ,bg1 :background ,keyword :weight normal))))
   `(helm-ff-symlink
     ((,class (:foreground ,cyan :background ,bg1 :weight bold))))
   `(helm-grep-cmd-line ((,class (:foreground ,base :background ,bg1))))
   `(helm-grep-file ((,class (:foreground ,base :background ,bg1))))
   `(helm-grep-finish ((,class (:foreground ,base :background ,bg1))))
   `(helm-grep-lineno ((,class (:foreground ,base :background ,bg1))))
   `(helm-grep-match
     ((,class (:foreground nil :background nil :inherit helm-match))))
   `(helm-grep-running ((,class (:foreground ,func :background ,bg1))))
   `(helm-header
     ((,class (:foreground ,base :background ,bg1 :underline nil :box nil))))
   `(helm-header-line-left-margin
     ((,class (:foreground ,inf :background ,nil))))
   `(helm-match ((,class (:foreground ,inf :background ,bg1))))
   `(helm-match-item ((,class (:inherit match))))
   `(helm-moccur-buffer ((,class (:foreground ,func :background ,bg1))))
   `(helm-selection ((,class (:background ,bg2 :foreground ,keyword))))
   `(helm-selection-line ((,class (:background ,bg3))))
   `(helm-separator ((,class (:foreground ,comp :background ,bg1))))
   `(helm-source-header ((,class (:background ,comp :foreground ,bg1 :bold t))))
   `(helm-time-zone-current ((,class (:foreground ,builtin :background ,bg1))))
   `(helm-time-zone-home ((,class (:foreground ,comp :background ,bg1))))
   `(helm-visible-mark ((,class (:foreground ,bg1 :background ,green))))

;;;;; helm-swoop
   `(helm-swoop-target-line-block-face
     ((,class (:foreground ,base :background ,highlight))))
   `(helm-swoop-target-line-face
     ((,class (:foreground ,base :background ,highlight))))
   `(helm-swoop-target-word-face ((,class (:foreground ,bg1 :background ,suc))))

;;;;; ido
   `(ido-first-match ((,class (:foreground ,comp :bold t))))
   `(ido-only-match ((,class (:foreground ,suc :bold t))))
   `(ido-subdir ((,class (:foreground ,key1))))
   `(ido-vertical-match-face ((,class (:foreground ,comp :underline nil))))

;;;;; info
   `(info-header-xref ((,class (:foreground ,func :underline t))))
   `(info-menu ((,class (:foreground ,suc))))
   `(info-node ((,class (:foreground ,func :bold t))))
   `(info-quoted-name ((,class (:foreground ,builtin))))
   `(info-reference-item ((,class (:background nil :underline t :bold t))))
   `(info-string ((,class (:foreground ,str))))
   `(info-title-1 ((,class (:height 1.4 :bold t))))
   `(info-title-2 ((,class (:height 1.3 :bold t))))
   `(info-title-3 ((,class (:height 1.3))))
   `(info-title-4 ((,class (:height 1.2))))

;;;;; linum-mode
   `(linum ((,class (:foreground ,bg4 :background ,bg1))))

;;;;; magit
   `(magit-blame-culprit ((,class :background ,org-h4-bg :foreground ,yellow)))
   `(magit-blame-header  ((,class :background ,org-h4-bg :foreground ,green)))
   `(magit-blame-sha1    ((,class :background ,org-h4-bg :foreground ,func)))
   `(magit-blame-subject ((,class :background ,org-h4-bg :foreground ,yellow)))
   `(magit-blame-time    ((,class :background ,org-h4-bg :foreground ,green)))
   `(magit-blame-name    ((,class :background ,org-h4-bg :foreground ,yellow)))
   `(magit-blame-heading ((,class :background ,org-h4-bg :foreground ,green)))
   `(magit-blame-hash    ((,class :background ,org-h4-bg :foreground ,func)))
   `(magit-blame-summary ((,class :background ,org-h4-bg :foreground ,yellow)))
   `(magit-blame-date    ((,class :background ,org-h4-bg :foreground ,green)))
   `(magit-branch ((,class (:foreground ,const :weight bold))))
   `(magit-branch-current
     ((,class (:background ,org-h1-bg :foreground ,inf :weight bold :box t))))
   `(magit-branch-local
     ((,class (:background ,org-h1-bg :foreground ,inf :weight bold))))
   `(magit-branch-remote
     ((,class (:background ,org-h2-bg :foreground ,str :weight bold))))
   `(magit-diff-context-highlight
     ((,class (:background ,bg3 :foreground ,base))))
   `(magit-diff-file-header ((,class (:background nil :foreground ,str))))
   `(magit-diff-hunk-header ((,class (:background nil :foreground ,builtin))))
   `(magit-hash ((,class (:foreground ,var))))
   `(magit-hunk-heading           ((,class (:background ,bg3))))
   `(magit-hunk-heading-highlight ((,class (:background ,bg3))))
   `(magit-item-highlight ((,class :background ,bg2)))
   `(magit-log-author ((,class (:foreground ,func))))
   `(magit-log-head-label-head
     ((,class (:background ,yellow :foreground ,bg1 :bold t))))
   `(magit-log-head-label-local
     ((,class (:background ,inf :foreground ,bg1 :bold t))))
   `(magit-log-head-label-remote
     ((,class (:background ,suc :foreground ,bg1 :bold t))))
   `(magit-log-head-label-tags
     ((,class (:background ,violet :foreground ,bg1 :bold t))))
   `(magit-log-head-label-wip
     ((,class (:background ,cyan :foreground ,bg1 :bold t))))
   `(magit-log-sha1 ((,class (:foreground ,str))))
   `(magit-process-ng ((,class (:foreground ,war :weight bold))))
   `(magit-process-ok ((,class (:foreground ,func :weight bold))))
   `(magit-section-heading
     ((,class (:foreground ,keyword :weight bold))))
   `(magit-section-highlight      ((,class (:background ,bg2))))
   `(magit-section-title
     ((,class (:background ,bg1 :foreground ,builtin :weight bold))))

;;;;; mode-line
   `(mode-line
     ((,class (:foreground ,base
               :background ,active1
               :box (:color ,m-line-brdr :line-width 1)))))
   `(mode-line-inactive
     ((,class (:foreground ,base
               :background ,bg1
               :box (:color ,m-line-brdr :line-width 1)))))
   `(mode-line-buffer-id ((,class (:bold t :foreground ,func))))

;;;;; neotree
   `(neo-dir-link-face ((,class (:foreground ,inf :weight bold))))
   `(neo-expand-btn-face ((,class (:foreground ,base))))
   `(neo-file-link-face ((,class (:foreground ,base))))
   `(neo-root-dir-face ((,class (:foreground ,func :weight bold))))

;;;;; org
   `(org-agenda-clocking ((,class (:foreground ,comp))))
   `(org-agenda-date
     ((,class (:foreground ,var :height ,(if graypawn-org-height 1.1 1.0)))))
   `(org-agenda-date-today
     ((,class (:weight bold
               :foreground ,keyword
               :height ,(if graypawn-org-height 1.3 1.0)))))
   `(org-agenda-date-weekend ((,class (:weight normal :foreground ,var))))
   `(org-agenda-done ((,class (:foreground ,suc :bold t))))
   `(org-agenda-structure ((,class (:weight bold :foreground ,comp))))
   `(org-block ((,class (:foreground ,base))))
   `(org-block-background ((,class (:background ,org-block-bg))))
   `(org-clock-overlay ((,class (:foreground ,comp))))
   `(org-code ((,class (:foreground ,cyan))))
   `(org-column ((,class (:background ,highlight))))
   `(org-column-title ((,class (:background ,highlight))))
   `(org-date ((,class (:underline t :foreground ,var) )))
   `(org-date-selected ((,class (:background ,func :foreground ,bg1) )))
   `(org-document-info-keyword ((,class (:foreground ,str))))
   `(org-document-title
     ((,class (:foreground ,green
               :weight bold
               :height ,(if graypawn-org-height 1.4 1.0) :underline t))))
   `(org-done ((,class (:foreground ,suc
                        :bold t
                        :overline t
                        :background ,org-h3-bg))))
   `(org-ellipsis ((,class (:foreground ,builtin))))
   `(org-footnote  ((,class (:underline t :foreground ,base))))
   `(org-hide ((,class (:foreground ,base))))
   `(org-level-1 ((,class (:bold t
                           :foreground ,type
                           :height ,(if graypawn-org-height 1.25 1.0)
                           :background ,org-h1-bg :overline t))))
   `(org-level-2 ((,class (:bold t
                           :foreground ,keyword
                           :height ,(if graypawn-org-height 1.2 1.0)
                           :background ,org-h2-bg))))
   `(org-level-3 ((,class (:bold nil
                           :foreground ,str
                           :height ,(if graypawn-org-height 1.1 1.0)
                           :background ,org-h3-bg))))
   `(org-level-4
     ((,class (:bold nil :foreground ,yellow :background ,org-h4-bg))))
   `(org-level-5 ((,class (:bold nil :foreground ,inf))))
   `(org-level-6 ((,class (:bold nil :foreground ,str))))
   `(org-level-7 ((,class (:bold nil :foreground ,green))))
   `(org-level-8 ((,class (:bold nil :foreground ,yellow))))
   `(org-link ((,class (:underline t :foreground ,comment))))
   `(org-mode-line-clock-overrun ((,class (:foreground ,err))))
   `(org-priority ((,class (:foreground ,war :bold t))))
   `(org-quote ((,class (:inherit org-block :slant italic))))
   `(org-scheduled ((,class (:foreground ,comp))))
   `(org-scheduled-today
     ((,class (:foreground ,func :weight bold :height 1.2))))
   `(org-sexp-date ((,class (:foreground ,base))))
   `(org-special-keyword ((,class (:foreground ,keyword))))
   `(org-table ((,class (:foreground ,yellow :background ,org-h4-bg))))
   `(org-todo
     ((,class (:foreground ,war :bold t :overline t :background ,org-h4-bg))))
   `(org-verbatim ((,class (:foreground ,inf))))
   `(org-verse ((,class (:inherit org-block :slant italic))))
   `(org-warning ((,class (:foreground ,err))))

;;;;; perspective
   `(persp-selected-face ((,class (:bold t :foreground ,func))))


;;;;; rainbow-delimiters
   `(rainbow-delimiters-depth-1-face ((,class :foreground ,pth1 :weight bold)))
   `(rainbow-delimiters-depth-2-face ((,class :foreground ,pth2 :weight bold)))
   `(rainbow-delimiters-depth-3-face ((,class :foreground ,pth3 :weight bold)))
   `(rainbow-delimiters-depth-4-face ((,class :foreground ,pth4 :weight bold)))
   `(rainbow-delimiters-depth-5-face ((,class :foreground ,pth5 :weight bold)))
   `(rainbow-delimiters-depth-6-face ((,class :foreground ,pth6 :bold t)))
   `(rainbow-delimiters-depth-7-face ((,class :foreground ,pth7 :bold t)))
   `(rainbow-delimiters-depth-8-face ((,class :foreground ,pth8 :bold t)))
   `(rainbow-delimiters-depth-9-face ((,class :foreground ,green :bold t)))
   `(rainbow-delimiters-depth-10-face ((,class :foreground ,yellow :bold t)))
   `(rainbow-delimiters-depth-11-face ((,class :foreground ,type :bold t)))
   `(rainbow-delimiters-depth-12-face ((,class :foreground ,pth8 :bold t)))
   `(rainbow-delimiters-unmatched-face ((,class :foreground ,war :bold t)))

;;;;; shm
   `(shm-current-face ((,class (:background ,green-bg))))
   `(shm-quarantine-face ((,class (:background ,red-bg))))

;;;;; smartparens
   `(sp-pair-overlay-face ((,class (:background ,highlight :foreground nil))))
   `(sp-show-pair-match-face
     ((,class (:foreground ,suc :weight bold :underline t))))

;;;;; term
   `(term ((,class (:foreground ,base :background ,bg1))))
   `(term-color-black ((,class (:foreground ,bg4))))
   `(term-color-blue ((,class (:foreground ,inf))))
   `(term-color-cyan ((,class (:foreground ,cyan))))
   `(term-color-green ((,class (:foreground ,green))))
   `(term-color-magenta ((,class (:foreground ,violet))))
   `(term-color-red ((,class (:foreground ,red))))
   `(term-color-white ((,class (:foreground ,base))))
   `(term-color-yellow ((,class (:foreground ,yellow))))

;;;;; which-key
   `(which-key-command-description-face ((,class (:foreground ,base))))
   `(which-key-group-description-face ((,class (:foreground ,key2))))
   `(which-key-key-face ((,class (:foreground ,func :bold t))))
   `(which-key-separator-face ((,class (:background nil :foreground ,str))))
   `(which-key-special-key-face ((,class (:background ,func :foreground ,bg1))))

;;;;; auto-complete
   `(ac-candidate-face ((,class (:background ,active2 :foreground ,base))))
   `(ac-selection-face ((,class (:background ,type :foreground ,base))))
   `(popup-tip-face ((,class (:background ,red :foreground ,base))))
   `(popup-scroll-bar-foreground-face ((,class (:background ,type))))
   `(popup-scroll-bar-background-face ((,class (:background ,active2))))
   `(popup-isearch-match
     ((,class (:background ,bg1 :foreground ,base :bold t))))
   `(ac-completion-face ((,class (:underline t :foreground ,keyword))))

;;;;; whitespace
   `(whitespace-line ((,class (:bold t :background ,war))))
   `(whitespace-trailing ((,class (:bold t :background ,war))))
   `(whitespace-tab ((,class (:bold t :background ,active1))))

;;;;; other, need more work
   `(ffap ((,class (:foreground ,base))))
   `(flx-highlight-face ((,class (:foreground ,comp :underline nil))))
   `(font-latex-string-face ((,class (:foreground ,str))))
   `(icompletep-determined ((,class :foreground ,builtin)))
   `(js2-external-variable ((,class (:foreground ,comp  ))))
   `(js2-function-param ((,class (:foreground ,const))))
   `(js2-jsdoc-html-tag-delimiter ((,class (:foreground ,type))))
   `(js2-jsdoc-html-tag-name ((,class (:foreground ,key1))))
   `(js2-jsdoc-value ((,class (:foreground ,str))))
   `(js2-private-function-call ((,class (:foreground ,const))))
   `(js2-private-member ((,class (:foreground ,base))))
   `(js3-error-face ((,class (:underline ,war))))
   `(js3-external-variable-face ((,class (:foreground ,var))))
   `(js3-function-param-face ((,class (:foreground ,key2))))
   `(js3-instance-member-face ((,class (:foreground ,const))))
   `(js3-jsdoc-tag-face ((,class (:foreground ,keyword))))
   `(js3-warning-face ((,class (:underline ,keyword))))
   `(mu4e-cited-1-face ((,class (:foreground ,base))))
   `(mu4e-cited-7-face ((,class (:foreground ,base))))
   `(mu4e-header-marks-face ((,class (:foreground ,comp))))
   `(mu4e-view-url-number-face ((,class (:foreground ,comp))))
   `(slime-repl-inputed-output-face ((,class (:foreground ,comp))))
   `(trailing-whitespace ((,class :foreground nil :background ,err)))
   `(undo-tree-visualizer-current-face ((,class :foreground ,builtin)))
   `(undo-tree-visualizer-default-face ((,class :foreground ,base)))
   `(undo-tree-visualizer-register-face ((,class :foreground ,comp)))
   `(undo-tree-visualizer-unmodified-face ((,class :foreground ,var)))
   `(web-mode-builtin-face ((,class (:inherit ,font-lock-builtin-face))))
   `(web-mode-comment-face ((,class (:inherit ,font-lock-comment-face))))
   `(web-mode-constant-face ((,class (:inherit ,font-lock-constant-face))))
   `(web-mode-doctype-face ((,class (:inherit ,font-lock-comment-face))))
   `(web-mode-function-name-face
     ((,class (:inherit ,font-lock-function-name-face))))
   `(web-mode-html-attr-name-face ((,class (:foreground ,func))))
   `(web-mode-html-attr-value-face ((,class (:foreground ,keyword))))
   `(web-mode-html-tag-face ((,class (:foreground ,builtin))))
   `(web-mode-keyword-face ((,class (:foreground ,keyword))))
   `(web-mode-string-face ((,class (:foreground ,str))))
   `(web-mode-type-face ((,class (:inherit ,font-lock-type-face))))
   `(web-mode-warning-face ((,class (:inherit ,font-lock-warning-face))))
   `(highlight-indentation-face ((,class (:background ,bg2))))
   ))

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide 'init-themes)
