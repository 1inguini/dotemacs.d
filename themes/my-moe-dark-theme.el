;;; package --- Summary
;;; Commentary: my-moe-dark-theme.el --- An eye-candy theme for Emacser

;; Author: linguini
;; Based on "moe-dark-theme"

;;; Code:

(deftheme my-moe-dark
  "Created 2019-02-08.")

(custom-theme-set-faces
 'my-moe-dark)

(setq-default unspecified
	      '(
		:width 'unspecified
		:weight 'unspecified
		:slant 'unspecified
		:underline 'unspecified
		:overline 'unspecified
		:strike-through 'unspecified
		:box 'unspecified
		:inverse-video 'unspecified
		:foreground 'unspecified
		:background 'unspecified
		:stipple 'unspecified))

(defmacro set-face-attribute! (attribute frame &rest argvs)
  `(set-face-attribute ,attribute ,frame ,@unspecified ,@argvs))


(setq-default yellow-1 "#fce94f")
(setq-default yellow-2 "#ffd700")
(setq-default yellow-3 "#c4a000")
(setq-default yellow-3-5 "#aaaa11")
(setq-default yellow-4 "#875f00")

(setq-default orange-1 "#ffaf5f")
(setq-default orange-2 "#ff8700")
(setq-default orange-3 "#ff5d17")
(setq-default orange-4 "#d75f00")
(setq-default orange-5 "#af5f00")

(setq-default magenta-1 "#ff7bbb")
(setq-default magenta-2 "#ff4ea3")
(setq-default magenta-3 "#ff1f8b")

(setq-default green-1 "#afff00")
(setq-default green-2 "#a1db00")
(setq-default green-3 "#5faf00")
(setq-default green-4 "#008700")
(setq-default green-5 "#005f00")

(setq-default cyan-1 "#87ffff")
(setq-default cyan-2 "#87d7af")
(setq-default cyan-3 "#00d7af")
(setq-default cyan-4 "#00ac8a")
(setq-default cyan-5 "#5faf87")
(setq-default cyan-6 "#005f5f")
(setq-default cyan-7 "#236f73")

(setq-default blue-1 "#5fafd7")
(setq-default blue-2 "#1f5bff")
(setq-default blue-3 "#005f87")
(setq-default blue-4 "#005faf")
(setq-default blue-5 "#0000af")
(setq-default blue-6 "#00005f")

(setq-default purple-1 "#d18aff")
(setq-default purple-2 "#af5fff")
(setq-default purple-3 "#9a08ff")
(setq-default purple-4 "#6c0099")

(setq-default red-1 "#ef2929")
(setq-default red-2 "#dd0000")
(setq-default red-3 "#a40000")
(setq-default red-4 "#5f0000")

(setq-default white-1 "#c6c6c6")
(setq-default white-2 "#c6c6c6")
(setq-default white-3 "#b2b2b2")

(setq-default black-1 "#a8a8a8")
(setq-default black-2 "#8a8a8a")
(setq-default black-2-5 "#6c6c6c")
(setq-default black-3 "#4e4e4e")
(setq-default black-4 "#3a3a3a")
(setq-default black-5 "#303030")
(setq-default black-6 "#000000")

(setq-default LIGHT_BG "#fdfde7")
(setq-default white-0 "#eeeeee")

(setq-default green-01 "#d7ff00")
(setq-default green-02 "#5fd700")
(setq-default green-0 "#d7ff5f")
(setq-default green-00 "#d7ff87")

(setq-default cyan-0 "#d7ffd7")

(setq-default blue-01 "#c3c9f8")
(setq-default blue-0 "#afd7ff")
(setq-default blue-00 "#d7d7ff")

(setq-default yellow-0 "#ffff87")
(setq-default yellow-00 "#ffffaf")

(setq-default purple-0 "#af87ff")
(setq-default purple-00 "#e6a8df")

(setq-default red-0 "#ff4b4b")
(setq-default red-00 "#ffafaf")

(setq-default magenta-0 "#ffafd7")
(setq-default magenta-00 "#ffd7ff")

(setq-default orange-0 "#ffaf87")
(setq-default orange-00 "#ffd787")
(setq-default orange-000 "#ffd7af")

(setq-default linum-dark "#87875f")
(setq-default linum-light "#d7d7af")





;; 'my-moe-dark
(ignore-errors
  (set-face-attribute! 'default nil
		       :foreground white-1
		       :background black-5)

  (set-face-attribute! 'cursor nil
		       :background white-0)

  (set-face-attribute! 'vertical-border nil
		       :foreground black-3
		       :background black-3)

  (set-face-attribute! 'escape-glyph nil
		       :foreground yellow-3)

  (set-face-attribute! 'homoglyph nil
		       :foreground "cyan")

  (set-face-attribute! 'minibuffer-prompt nil
		       :foreground black-4
		       :background green-2)

  (set-face-attribute! 'highlight nil
		       :background black-4)

  (set-face-attribute! 'region nil
		       :foreground black-4
		       :background green-0)

  (set-face-attribute! 'shadow nil
		       :foreground white-3)

  (set-face-attribute! 'secondary-selection nil
		       :foreground white-0
		       :background blue-3)

  (set-face-attribute! 'trailing-whitespace nil
		       :background red-3)

  (set-face-attribute! 'font-lock-builtin-face nil
		       :foreground purple-1)

  (set-face-attribute! 'font-lock-comment-delimiter-face nil
		       :foreground black-2-5
		       :slant 'italic)

  (set-face-attribute! 'font-lock-comment-face nil
		       :foreground black-2-5
		       :slant 'italic)

  (set-face-attribute! 'font-lock-constant-face nil
		       :foreground blue-1)

  (set-face-attribute! 'font-lock-doc-face nil
		       :foreground red-0)

  (set-face-attribute! 'font-lock-function-name-face nil
		       :foreground yellow-2)

  (set-face-attribute! 'font-lock-keyword-face nil
		       :foreground green-2)

  (set-face-attribute! 'font-lock-negation-char-face nil
		       :foreground red-0)

  (set-face-attribute! 'font-lock-preprocessor-face nil
		       :foreground purple-1)

  (set-face-attribute! 'font-lock-regexp-grouping-backslash nil
		       :weight 'bold
		       :foreground yellow-1)

  (set-face-attribute! 'font-lock-regexp-grouping-construct nil
		       :weight 'bold
		       :foreground purple-1)

  (set-face-attribute! 'font-lock-string-face nil
		       :foreground magenta-2)

  (set-face-attribute! 'font-lock-type-face nil
		       :foreground cyan-3)

  (set-face-attribute! 'font-lock-variable-name-face nil
		       :foreground orange-2)

  (set-face-attribute! 'font-lock-warning-face nil
		       :weight 'bold
		       :foreground red-2)

  (set-face-attribute! 'button nil
		       :inherit 'link)

  (set-face-attribute! 'link nil
		       :underline '(
				    :color foreground-color
				    :style line)
		       :foreground blue-1)

  (set-face-attribute! 'link-visited nil
		       :underline '(
				    :color foreground-color
				    :style line)
		       :foreground blue-2)
  

  (set-face-attribute! 'header-line nil
		       :foreground white-0
		       :background blue-3)

  (set-face-attribute! 'tooltip nil
		       :foreground "lightyellow"
		       :background "black"
		       :inherit 'variable-pitch)


  (set-face-attribute! 'isearch nil
		       :foreground white-1
		       :background orange-3)

  ;; (set-face-attribute! 'isearch-fail nil
  ;;   ((((class color) (min-colors 88) (background light))
  ;;     '(:background "RosyBrown1"))
  ;;    (((class color) (min-colors 88) (background dark))
  ;;     '(:background "red4"))
  ;;    (((class color) (min-colors 16))
  ;;     '(:background "red"))
  ;;    (((class color) (min-colors 8))
  ;;     '(:background "red"))
  ;;    (((class color grayscale))
  ;;     '(:foreground "grey"))
  ;;    (t '(:inverse-video t))))

  (set-face-attribute! 'lazy-highlight nil
		       :foreground white-1
		       :background magenta-3)

  ;; (set-face-attribute! 'match nil
  ;;   ((((class color) (min-colors 88) (background light))
  ;;     :background "yellow1"))

  ;;    (((class color) (min-colors 88) (background dark))
  ;;     '(:background "RoyalBlue3"))

  ;;    (((class color) (min-colors 8) (background light))
  ;;     (
  ;;      :foreground "black"
  ;;      :background "yellow"))

  ;;    (((class color) (min-colors 8) (background dark))
  ;;     (
  ;;      :foreground "white"
  ;;      :background "blue"))

  ;;    (((type tty) (class mono))
  ;;     '(:inverse-video t))

  ;;    '(:background "gray")))

  (set-face-attribute! 'next-error nil
		       :inherit 'region)

  (set-face-attribute! 'query-replace nil
		       :inherit 'isearch)
 
  ;; Highlighting faces
  (set-face-attribute! 'fringe nil
		       ;; :foreground black-1
		       ;; :background black-3
		       :inherit 'linum)

  (set-face-attribute! 'linum nil
		       :stipple nil
		       :background black-4
		       :foreground black-1)
  
  (set-face-attribute! 'line-number nil
		       :foreground white-3
		       :background black-3)

  (set-face-attribute! 'linum-highlight-face nil
		       :background green-0
		       :foreground black-4)

  (set-face-attribute! 'line-number-current-line nil
		       :background green-0
		       :foreground black-4)

  (set-face-attribute! 'highlight nil
		       :background black-3)

  (set-face-attribute! 'hl-line nil
		       :background black-4)

  (set-face-attribute! 'highlight-symbol-face nil
		       :background green-5)

  (set-face-attribute! 'region nil
		       :foreground black-3
		       :background green-0)

  (set-face-attribute! 'secondary-selection nil
		       :background blue-3
		       :foreground white-0)

  (set-face-attribute! 'isearch nil
		       :foreground white-1
		       :background orange-3)

  (set-face-attribute! 'lazy-highlight nil
		       :background magenta-3
		       :foreground white-1)

  (set-face-attribute! 'trailing-whitespace nil
		       :background red-3)

  (set-face-attribute! 'show-paren-match nil
		       :background blue-3
		       :foreground nil)

  (set-face-attribute! 'header-line nil
		       :background blue-3
		       :foreground white-0)

  (set-face-attribute! 'help-argument-name nil
		       :foreground magenta-1
		       :italic t)

  (set-face-attribute! 'eldoc-highlight-function-argument nil
	 	       :foreground green-01
		       :bold t
		       :underline t
		       :background green-5))

;; Mode line & frames' faces
(ignore-errors
  (set-face-attribute! 'mode-line nil
		       :foreground blue-3
		       :background blue-0
		       :box nil)

  (set-face-attribute! 'mode-line-buffer-id nil
		       :foreground black-5
		       :bold t
		       :inherit 'mode-line)

  (set-face-attribute! 'mode-line-inactive nil
		       :foreground white-1
		       :background black-2-5)

  (set-face-attribute! 'mode-line-buffer-id-inactive nil
		       ;; :foreground white-1
		       ;; :background black-2-5
		       :inherit 'mode-line-inactive)

  (set-face-attribute! 'mode-line-emphasis nil
		       :background black-5
		       :weight 'bold
		       :inherit 'default)

  (set-face-attribute! 'mode-line-highlight nil
		       :box '(
			      :line-width 2
			      :style released-button)
		       :inherit 'highlight))

;; telephone-line

;; Escape and prompt faces
(ignore-errors
  (set-face-attribute! 'minibuffer-prompt nil
		       :foreground black-3
		       :background green-2)

  (set-face-attribute! 'escape-glyph nil
		       :foreground yellow-3)

  (set-face-attribute! 'error nil
		       :foreground red-0)

  (set-face-attribute! 'warning nil
		       :foreground orange-1)

  (set-face-attribute! 'success nil
		       :foreground green-1))


;; Font lock faces
(ignore-errors
  (set-face-attribute! 'font-lock-builtin-face nil
		       :foreground purple-1)

  (set-face-attribute! 'font-lock-comment-delimiter-face nil
		       :foreground black-2-5
		       :slant 'italic)

  (set-face-attribute! 'font-lock-comment-face nil
		       :foreground black-2-5
		       :slant 'italic)

  (set-face-attribute! 'font-lock-constant-face nil
		       :foreground blue-1)

  (set-face-attribute! 'font-lock-doc-face nil
		       :foreground red-0)

  (set-face-attribute! 'font-lock-doc-string-face nil
		       :foreground yellow-3)

  (set-face-attribute! 'font-lock-function-name-face nil
		       :foreground yellow-2)

  (set-face-attribute! 'font-lock-keyword-face nil
		       :foreground green-2)

  (set-face-attribute! 'font-lock-negation-char-face nil
		       :foreground red-0)

  (set-face-attribute! 'font-lock-preprocessor-face nil
		       :foreground purple-1)

  (set-face-attribute! 'font-lock-regexp-grouping-backslash nil
		       :foreground yellow-1)

  (set-face-attribute! 'font-lock-regexp-grouping-construct nil
		       :foreground purple-1)

  (set-face-attribute! 'font-lock-string-face nil
		       :foreground magenta-2)

  (set-face-attribute! 'font-lock-type-face nil
		       :foreground cyan-3)

  (set-face-attribute! 'font-lock-variable-name-face nil
		       :foreground orange-2)

  (set-face-attribute! 'font-lock-warning-face nil
		       :weight bold
		       :foreground red-2)
  )

(ignore-errors
  ;; company
  (set-face-attribute! 'company-echo nil
		       :background nil
		       :foreground white-1)

  (set-face-attribute! 'company-echo-common nil
		       :background black-3
		       :foreground red-1)

  (set-face-attribute! 'company-preview nil
		       :background black-5
		       :foreground magenta-2)

  (set-face-attribute! 'company-preview-common nil
		       :background black-5
		       :foreground magenta-2)

  (set-face-attribute! 'company-preview-search nil
		       :background black-4
		       :foreground magenta-2
		       :weight 'bold)

  (set-face-attribute! 'company-scrollbar-bg nil
		       :background black-3)

  (set-face-attribute! 'company-scrollbar-fg nil
		       :background white-3)


  (set-face-attribute! 'company-template-field nil
		       :background yellow-00
		       :foreground black-4)

  (set-face-attribute! 'company-tooltip nil
		       :background black-3
		       :foreground blue-1)

  (set-face-attribute! 'company-tooltip-annotation nil
		       :background black-4
		       :foreground red-1)

  (set-face-attribute! 'company-tooltip-common nil
		       :background black-2-5
		       :foreground blue-0)

  (set-face-attribute! 'company-tooltip-common-selection nil
		       :background blue-3
		       :foreground blue-0
		       :weight 'bold)

  (set-face-attribute! 'company-tooltip-mouse nil
		       :background green-0
		       :foreground black-5)

  (set-face-attribute! 'company-tooltip-selection nil
		       :background blue-3
		       :foreground blue-0)
  )
;; popup
(ignore-errors
  (set-face-attribute! 'popup-face nil
		       :background black-3
		       :foreground blue-1
		       :stipple nil)

  (set-face-attribute! 'popup-isearch-match nil
		       :background black-3
		       :foreground magenta-2
		       :weight 'bold
		       :stipple nil)

  (set-face-attribute! 'popup-menu-face nil
		       :background black-3
		       :foreground blue-1
		       :stipple nil)

  (set-face-attribute! 'popup-menu-mouse-face nil
		       :background green-0
		       :foreground black-4
		       :stipple nil)

  (set-face-attribute! 'popup-menu-selection-face nil
		       :background blue-3
		       :foreground blue-0
		       :stipple nil)

  (set-face-attribute! 'popup-menu-summary-face nil
		       :background black-3
		       :foreground blue-1
		       :stipple nil)

  (set-face-attribute! 'popup-scroll-bar-background-face nil
		       :background black-3
		       :foreground black-3
		       :stipple nil)

  (set-face-attribute! 'popup-scroll-bar-foreground-face nil
		       :background black-2
		       :foreground white-3
		       :stipple nil)

  (set-face-attribute! 'popup-summary-face nil
		       :background black-3
		       :foreground blue-1
		       :stipple nil)

  (set-face-attribute! 'popup-tip-face nil
		       :background black-2-5
		       :foreground white-1
		       :stipple nil))


;; Dired
(ignore-errors
  (set-face-attribute! 'dired-directory nil
		       :foreground blue-1
		       :bold t)

  (set-face-attribute! 'dired-flagged nil
		       :foreground red-1)

  (set-face-attribute! 'dired-header nil

		       :foreground black-5
		       :background green-2
		       :bold t)

  (set-face-attribute! 'dired-ignored nil
		       :foreground black-1)

  (set-face-attribute! 'dired-mark nil
		       :foreground green-1)

  (set-face-attribute! 'dired-marked nil
		       :foreground green-2)

  (set-face-attribute! 'dired-perm-write nil
		       :foreground red-2
		       :bold t)

  (set-face-attribute! 'dired-symlink nil
		       :foreground magenta-2)

  (set-face-attribute! 'dired-warning nil
		       :foreground white-1
		       :background red-3
		       :bold t)
  )
;; Dired+
(ignore-errors
  (set-face-attribute! 'diredp-compressed-file-suffix nil
		       :foreground purple-2)

  (set-face-attribute! 'diredp-date-time nil
		       :foreground blue-1
		       :background black-4)

  (set-face-attribute! 'diredp-deletion nil
		       :foreground white-1
		       :background red-3)

  (set-face-attribute! 'diredp-deletion-file-name nil
		       :foreground red-2)

  (set-face-attribute! 'diredp-dir-heading nil
		       :foreground black-5
		       :background green-2)

  (set-face-attribute! 'diredp-dir-priv nil
		       :foreground blue-1
		       :background black-5
		       :bold t)

  (set-face-attribute! 'diredp-display-msg nil
		       :foreground orange-2)

  (set-face-attribute! 'diredp-executable-tag nil

		       :foreground green-2)

  (set-face-attribute! 'diredp-file-name nil
		       :foreground white-1)

  (set-face-attribute! 'diredp-file-suffix nil
		       :foreground orange-2)

  (set-face-attribute! 'diredp-flag-mark nil
		       :foreground white-1
		       :background magenta-3
		       :bold t)

  (set-face-attribute! 'diredp-flag-mark-line nil
		       :foreground black-5
		       :background magenta-1)

  (set-face-attribute! 'diredp-ignored-file-name nil
		       :foreground black-2)

  (set-face-attribute! 'diredp-link-priv nil
		       :foreground magenta-3)

  (set-face-attribute! 'diredp-mode-line-flagged nil
		       :foreground black-5
		       :background green-2)

  (set-face-attribute! 'diredp-mode-line-marked nil
		       :foreground white-1
		       :background magenta-3
		       :bold t)

  (set-face-attribute! 'diredp-no-priv nil
		       :foreground white-1
		       :background black-4)

  (set-face-attribute! 'diredp-number nil
		       :foreground yellow-1)

  (set-face-attribute! 'diredp-other-priv nil
		       :foreground white-1
		       :background blue-3)

  (set-face-attribute! 'diredp-rare-priv nil
		       :foreground white-1
		       :background purple-2)

  (set-face-attribute! 'diredp-symlink nil
		       :foreground magenta-3)

  (set-face-attribute! 'diredp-read-priv nil
		       :foreground green-4
		       :background green-0)

  (set-face-attribute! 'diredp-write-priv nil
		       :foreground blue-5
		       :background blue-0)

  (set-face-attribute! 'diredp-exec-priv nil
		       :foreground red-3
		       :background orange-0))

;; Completions
(ignore-errors
  (set-face-attribute! 'completions-annotations nil
		       :foreground green-2)

  (set-face-attribute! 'completions-common-part nil
		       :foreground black-2-5)

  (set-face-attribute! 'completions-first-difference nil
		       :weight 'bold
		       :foreground orange-2))

;; org-mode
(ignore-errors
  (set-face-attribute! 'org-document-title nil
		       :foreground blue-0
		       :background black-5
		       :weight 'bold)

  (set-face-attribute! 'org-document-info nil
		       :foreground blue-1
		       :background black-5
		       :weight 'bold)

  (set-face-attribute! 'org-document-info-keyword nil
		       :foreground orange-1
		       :background black-2-5)

  (set-face-attribute! 'org-archived nil
		       :slant 'italic)

  (set-face-attribute! 'org-checkbox nil
		       :background white-2
		       :foreground black-3
		       :box '(
			      :line-width 1
			      :style released-button))

  (set-face-attribute! 'org-date nil
		       :foreground blue-0
		       :underline t)

  (set-face-attribute! 'org-done nil
		       :bold t
		       :weight 'bold
		       :foreground green-4
		       :background green-0
		       :box '(
			      :line-width 1
			      :style none))

  (set-face-attribute! 'org-todo nil
		       :bold t
		       :weight 'bold
		       :foreground red-3
		       :background orange-0
		       :box '(
			      :line-width 1
			      :style none))

  (set-face-attribute! 'org-level-1 nil
		       :foreground blue-1)

  (set-face-attribute! 'org-level-2 nil :foreground green-2)

  (set-face-attribute! 'org-level-3 nil :foreground orange-2)

  (set-face-attribute! 'org-level-4 nil :foreground cyan-3)

  (set-face-attribute! 'org-level-5 nil :foreground red-1)

  (set-face-attribute! 'org-level-6 nil :foreground purple-2)

  (set-face-attribute! 'org-level-7 nil :foreground magenta-2)

  (set-face-attribute! 'org-level-8 nil :foreground yellow-2)

  (set-face-attribute! 'org-tag nil
		       :background black-3
		       :foreground white-1
		       :bold t
		       :weight 'bold)


  (set-face-attribute! 'org-column nil
		       :background black-4
		       :foreground black-3)

  (set-face-attribute! 'org-column-title nil
		       :background blue-0
		       :foreground black-5
		       :underline t
		       :weight 'bold)

  (set-face-attribute! 'org-agenda-structure nil
		       :foreground cyan-4
		       :background nil
		       :bold t)

  (set-face-attribute! 'org-upcoming-deadline nil
		       :foreground red-3)

  (set-face-attribute! 'org-scheduled nil
		       :foreground white-3)

  (set-face-attribute! 'org-scheduled-previously nil
		       :foreground red-1)

  (set-face-attribute! 'org-scheduled-today nil
		       :foreground blue-1)

  (set-face-attribute! 'org-special-keyword nil
		       :background black-3
		       :foreground white-1)

  (set-face-attribute! 'org-table nil
		       :background black-3
		       :foreground white-1)

  (set-face-attribute! 'org-time-grid nil
		       :foreground black-2)

  (set-face-attribute! 'org-upcoming-deadline nil
		       :foreground red-1)

  (set-face-attribute! 'org-warning nil
		       :bold t
		       :foreground white-0
		       :background red-3)

  (set-face-attribute! 'org-formula nil
		       :foreground purple-2)

  (set-face-attribute! 'org-headline-done nil
		       :foreground green-2)

  (set-face-attribute! 'org-hide nil
		       :foreground black-5)

  (set-face-attribute! 'org-code nil
		       :foreground blue-1
		       :background black-4)

  (set-face-attribute! 'org-link nil
		       :foreground blue-1
		       :underline t)

  (set-face-attribute! 'org-footnote nil
		       :foreground magenta-3)

  (set-face-attribute! 'org-ellipsis nil
		       :foreground red-2)

  (set-face-attribute! 'org-agenda-clocking nil
		       :foreground blue-3
		       :background blue-0
		       :bold t)

  (set-face-attribute! 'org-agenda-date nil
		       :foreground blue-1
		       :background black-5
		       :underline nil)

  (set-face-attribute! 'org-agenda-date-weekend nil
		       :foreground purple-1
		       :underline nil
		       :bold nil)

  (set-face-attribute! 'org-agenda-date-today nil
		       :foreground blue-0
		       :background black-2-5
		       :slant 'italic
		       :weight 'bold)

  (set-face-attribute! 'org-agenda-column-dateline nil
		       :foreground white-0
		       :background black-3
		       :underline t)

  ;; (set-face-attribute! 'org-agenda-todo nil
  ;;		    :foreground white-0
  ;;		    :background red-2)

  (set-face-attribute! 'org-agenda-done nil
		       :foreground green-2
		       :background nil)

  (set-face-attribute! 'org-agenda-dimmed-todo-face nil
		       :foreground white-0
		       :background red-2)

  (set-face-attribute! 'org-priority nil
		       :foreground red-1
		       :background nil)

  (set-face-attribute! 'org-block nil
		       :foreground blue-1
		       :background black-4)

  ;; (set-face-attribute! 'org-block-background nil
  ;;		    :foreground nil
  ;;		    :background black-4)

  (set-face-attribute! 'org-block-begin-line nil
		       :foreground white-0
		       :background blue-3)

  (set-face-attribute! 'org-block-end-line nil
		       :foreground black-3
		       :background black-4)

  (set-face-attribute! 'org-quote nil
		       :foreground blue-1
		       :background black-3)

  (set-face-attribute! 'org-mode-line-clock nil
		       :foreground blue-3
		       :background blue-0
		       :bold t)

  (set-face-attribute! 'org-mode-line-clock-overrun nil
		       :foreground white-0
		       :background red-1
		       :bold t)

  (set-face-attribute! 'org-verbatim nil
		       :foreground blue-1
		       :background black-3
		       :bold nil)
  )

;; outline
(ignore-errors
  (set-face-attribute! 'outline-1 nil :foreground blue-1)

  (set-face-attribute! 'outline-2 nil :foreground green-2)

  (set-face-attribute! 'outline-3 nil :foreground orange-2)

  (set-face-attribute! 'outline-4 nil :foreground cyan-3)

  (set-face-attribute! 'outline-5 nil :foreground red-1)

  (set-face-attribute! 'outline-6 nil :foreground purple-2)

  (set-face-attribute! 'outline-7 nil :foreground magenta-2)

  (set-face-attribute! 'outline-8 nil :foreground yellow-2))


;; undo-tree
(ignore-errors
  (set-face-attribute! 'undo-tree-visualizer-default-face nil
		       :foreground white-1)

  (set-face-attribute! 'undo-tree-visualizer-current-face nil
		       :foreground green-2
		       :weight 'bold)

  (set-face-attribute! 'undo-tree-visualizer-active-branch-face nil
		       :foreground red-2)

  (set-face-attribute! 'undo-tree-visualizer-register-face nil
		       :foreground yellow-2))


;; Markdown-mode
(ignore-errors
  (set-face-attribute! 'markdown-blockquote-face nil
		       :foreground orange-2
		       :background black-3
		       :italic t)

  (set-face-attribute! 'markdown-bold-face nil
		       :foreground white-1
		       :bold t)

  (set-face-attribute! 'markdown-comment-face nil
		       :foreground black-2
		       :italic t)

  (set-face-attribute! 'markdown-header-delimiter-face nil
		       :foreground green-3
		       :bold t)

  (set-face-attribute! 'markdown-header-face nil
		       :foreground green-2
		       :bold t)

  (set-face-attribute! 'markdown-header-rule-face nil
		       :foreground green-2
		       :bold t)

  (set-face-attribute! 'markdown-header-face-1 nil :foreground green-2 :bold t)

  (set-face-attribute! 'markdown-header-face-2 nil :foreground green-2 :bold t)

  (set-face-attribute! 'markdown-header-face-3 nil :foreground green-2 :bold t)

  (set-face-attribute! 'markdown-header-face-4 nil :foreground green-2 :bold t)

  (set-face-attribute! 'markdown-header-face-5 nil :foreground green-2 :bold t)

  (set-face-attribute! 'markdown-header-face-6 nil :foreground green-2 :bold t)

  (set-face-attribute! 'markdown-link-face nil
		       :foreground magenta-1
		       :underline t)

  (set-face-attribute! 'markdown-inline-code-face nil :foreground blue-1
		       :background black-3)

  (set-face-attribute! 'markdown-italic-face nil
		       :foreground white-1
		       :italic t
		       :underline white-1)

  (set-face-attribute! 'markdown-list-face nil
		       :foreground green-2
		       :background black-5
		       :bold t)

  (set-face-attribute! 'markdown-math-face nil
		       :foreground magenta-1)

  (set-face-attribute! 'markdown-missing-link-face nil
		       :foreground red-1
		       :bold t)

  (set-face-attribute! 'markdown-pre-face nil
		       :foreground blue-1)

  (set-face-attribute! 'markdown-reference-face nil
		       :foreground orange-2
		       :italic t)

  (set-face-attribute! 'markdown-url-face nil
		       :foreground magenta-3
		       :underline magenta-3))


;; Twittering-mode
(ignore-errors
  (set-face-attribute! 'twittering-username-face nil
		       :foreground blue-1
		       :background black-4
		       :bold t
		       :underline t)

  (set-face-attribute! 'twittering-uri-face nil
		       :foreground blue-1
		       :underline t)

  (set-face-attribute! 'twittering-timeline-footer-face nil
		       :foreground white-3)

  (set-face-attribute! 'twittering-timeline-header-face nil
		       :foreground white-3))


;; Jabber
(ignore-errors
  (set-face-attribute! 'jabber-activity-face nil
		       :foreground magenta-2)

  (set-face-attribute! 'jabber-activity-personal-face nil
		       :foreground cyan-3)

  (set-face-attribute! 'jabber-chat-error nil
		       :foreground red-00
		       :background red-2)

  (set-face-attribute! 'jabber-chat-prompt-foreign nil
		       :foreground orange-2)

  (set-face-attribute! 'jabber-chat-prompt-local nil
		       :foreground blue-1)

  (set-face-attribute! 'jabber-chat-prompt-system nil
		       :foreground yellow-2
		       :weight 'bold)

  (set-face-attribute! 'jabber-chat-text-foreign nil
		       :foreground white-0)

  (set-face-attribute! 'jabber-chat-text-local nil
		       :foreground white-3)

  (set-face-attribute! 'jabber-rare-time-face nil
		       :foreground black-1)

  (set-face-attribute! 'jabber-roster-user-away nil
		       :foreground orange-2)

  (set-face-attribute! 'jabber-roster-user-chatty nil
		       :foreground purple-1)

  (set-face-attribute! 'jabber-roster-user-dnd nil
		       :foreground red-1)

  (set-face-attribute! 'jabber-roster-user-error nil
		       :foreground red-00
		       :background red-3)

  (set-face-attribute! 'jabber-roster-user-offline nil
		       :foreground black-1)

  (set-face-attribute! 'jabber-roster-user-online nil
		       :foreground green-2)

  (set-face-attribute! 'jabber-roster-user-xa nil
		       :foreground black-1))


;; Button and link faces
(ignore-errors
  (set-face-attribute! 'link nil
		       :underline t
		       :foreground blue-1)

  (set-face-attribute! 'link-visited nil
		       :underline t
		       :foreground blue-2)
  )

;; Gnus
(ignore-errors
  (set-face-attribute! 'gnus-button nil
		       :weight 'normal
		       :foreground blue-1
		       :underline t)

  (set-face-attribute! 'gnus-cite-1 nil
		       :foreground blue-1
		       :background black-4
		       :slant 'italic)

  (set-face-attribute! 'gnus-cite-10 nil
		       :foreground magenta-1
		       :background black-4
		       :slant 'italic)

  (set-face-attribute! 'gnus-cite-11 nil
		       :foreground cyan-3
		       :background black-4
		       :slant 'italic)

  (set-face-attribute! 'gnus-cite-2 nil
		       :foreground green-2
		       :background black-4
		       :slant 'italic)

  (set-face-attribute! 'gnus-cite-3 nil
		       :foreground magenta-2
		       :background black-4
		       :slant 'italic)

  (set-face-attribute! 'gnus-cite-4 nil
		       :foreground cyan-3
		       :background black-4
		       :slant 'italic)

  (set-face-attribute! 'gnus-cite-5 nil
		       :foreground red-0
		       :background black-4
		       :slant 'italic)

  (set-face-attribute! 'gnus-cite-6 nil
		       :foreground purple-1
		       :background black-4
		       :slant 'italic)

  (set-face-attribute! 'gnus-cite-7 nil
		       :foreground orange-2
		       :background black-4
		       :slant 'italic)

  (set-face-attribute! 'gnus-cite-8 nil
		       :foreground blue-1
		       :background black-4
		       :slant 'italic)

  (set-face-attribute! 'gnus-cite-9 nil
		       :foreground green-2
		       :background black-4
		       :slant 'italic)

  (set-face-attribute! 'gnus-emphasis-highlight-words nil
		       :foreground red-3
		       :background red-00
		       :bold t)

  (set-face-attribute! 'gnus-group-mail-1 nil
		       :foreground blue-1)

  (set-face-attribute! 'gnus-group-mail-1-empty nil
		       :foreground black-2)

  (set-face-attribute! 'gnus-group-mail-1-low nil
		       :foreground blue-2)

  (set-face-attribute! 'gnus-group-mail-2 nil
		       :foreground orange-2)

  (set-face-attribute! 'gnus-group-mail-2-empty nil
		       :foreground black-2)

  (set-face-attribute! 'gnus-group-mail-2-low nil
		       :foreground orange-3)

  (set-face-attribute! 'gnus-group-mail-3 nil
		       :foreground magenta-2)

  (set-face-attribute! 'gnus-group-mail-3-empty nil
		       :foreground black-2)

  (set-face-attribute! 'gnus-group-mail-3-low nil
		       :foreground magenta-3)

  (set-face-attribute! 'gnus-group-mail-low nil
		       :foreground yellow-3)

  (set-face-attribute! 'gnus-group-mail-low-empty nil
		       :foreground black-2)

  (set-face-attribute! 'gnus-group-news-1 nil
		       :foreground blue-1)

  (set-face-attribute! 'gnus-group-news-1-empty nil
		       :foreground black-2)

  (set-face-attribute! 'gnus-group-news-1-low nil
		       :foreground blue-2)

  (set-face-attribute! 'gnus-group-news-2 nil
		       :foreground orange-2)

  (set-face-attribute! 'gnus-group-news-2-empty nil
		       :foreground black-2)

  (set-face-attribute! 'gnus-group-news-2-low nil
		       :foreground orange-3)

  (set-face-attribute! 'gnus-group-news-3 nil
		       :foreground magenta-2)

  (set-face-attribute! 'gnus-group-news-3-empty nil
		       :foreground black-2)

  (set-face-attribute! 'gnus-group-news-3-low nil
		       :foreground magenta-3)

  (set-face-attribute! 'gnus-group-news-4 nil
		       :foreground purple-2)

  (set-face-attribute! 'gnus-group-news-4-empty nil
		       :foreground black-2)

  (set-face-attribute! 'gnus-group-news-4-low nil
		       :foreground purple-3)

  (set-face-attribute! 'gnus-group-news-5 nil
		       :foreground cyan-3)

  (set-face-attribute! 'gnus-group-news-5-empty nil
		       :foreground black-2)

  (set-face-attribute! 'gnus-group-news-5-low nil
		       :foreground cyan-4)

  (set-face-attribute! 'gnus-group-news-6 nil
		       :foreground green-1)

  (set-face-attribute! 'gnus-group-news-6-empty nil
		       :foreground black-2)

  (set-face-attribute! 'gnus-group-news-6-low nil
		       :foreground green-3)

  (set-face-attribute! 'gnus-group-news-low nil
		       :foreground yellow-3)

  (set-face-attribute! 'gnus-group-news-low-empty nil
		       :foreground black-2)

  (set-face-attribute! 'gnus-header-content nil
		       :foreground magenta-1 )

  (set-face-attribute! 'gnus-header-from nil
		       :foreground blue-1
		       :underline t)

  (set-face-attribute! 'gnus-header-name nil
		       :foreground black-1)

  (set-face-attribute! 'gnus-header-newsgroups nil
		       :foreground magenta-2)

  (set-face-attribute! 'gnus-header-subject nil
		       :foreground white-0
		       :bold t)

  (set-face-attribute! 'gnus-server-agent nil
		       :foreground black-2)

  (set-face-attribute! 'gnus-server-closed nil
		       :foreground black-2)

  (set-face-attribute! 'gnus-server-denied nil
		       :foreground black-2)

  (set-face-attribute! 'gnus-server-offline nil
		       :foreground black-2)

  (set-face-attribute! 'gnus-server-opened nil
		       :foreground black-2)

  (set-face-attribute! 'gnus-signature nil
		       :slant 'italic
		       :foreground black-2)

  (set-face-attribute! 'gnus-splash nil
		       :foreground black-1)

  (set-face-attribute! 'gnus-summary-cancelled nil
		       :foreground black-2
		       :background black-5)

  (set-face-attribute! 'gnus-summary-high-ancient nil
		       :bold t
		       :foreground red-3
		       :background nil)

  (set-face-attribute! 'gnus-summary-high-read nil
		       :bold t
		       :foreground white-1)

  (set-face-attribute! 'gnus-summary-high-ticked nil
		       :slant 'italic
		       :bold t
		       :foreground red-2
		       :background nil)

  (set-face-attribute! 'gnus-summary-high-undownloaded nil
		       :slant 'italic
		       :foreground red-2
		       :background nil)

  (set-face-attribute! 'gnus-summary-high-unread nil
		       :bold t
		       :foreground red-0)

  (set-face-attribute! 'gnus-summary-low-ancient nil
		       :foreground green-3)

  (set-face-attribute! 'gnus-summary-low-read nil
		       :foreground white-1)

  (set-face-attribute! 'gnus-summary-low-ticked nil
		       :slant 'italic
		       :foreground green-1)

  (set-face-attribute! 'gnus-summary-low-undownloaded nil
		       :slant 'italic
		       :foreground green-2)

  (set-face-attribute! 'gnus-summary-low-unread nil
		       :slant 'italic
		       :foreground green-0)

  (set-face-attribute! 'gnus-summary-normal-ancient nil
		       :foreground blue-2)

  (set-face-attribute! 'gnus-summary-normal-read nil
		       :foreground white-1)

  (set-face-attribute! 'gnus-summary-normal-ticked nil
		       :slant 'italic
		       :foreground blue-1)

  (set-face-attribute! 'gnus-summary-normal-undownloaded nil
		       :slant 'italic
		       :foreground blue-1)

  (set-face-attribute! 'gnus-summary-normal-unread nil
		       :foreground blue-0
		       :bold t)

  (set-face-attribute! 'gnus-summary-selected nil
		       :background green-0
		       :foreground green-5)
  )
;; Helm
(ignore-errors
  (set-face-attribute! 'helm-bookmark-directory nil
		       :foreground blue-1
		       :background black-5
		       :bold t)

  (set-face-attribute! 'helm-bookmark-file nil
		       :foreground yellow-4
		       :background yellow-0)

  (set-face-attribute! 'helm-bookmark-info nil
		       :foreground green-4
		       :background green-0)

  (set-face-attribute! 'helm-buffer-directory nil
		       :foreground blue-1
		       :bold t)

  (set-face-attribute! 'helm-buffer-process nil
		       :foreground magenta-2)

  (set-face-attribute! 'helm-buffer-saved-out nil
		       :foreground red-2
		       :background black-5)

  (set-face-attribute! 'helm-buffer-size nil
		       :foreground orange-2)

  (set-face-attribute! 'helm-candidate-number nil
		       :foreground blue-3
		       :background white-0)

  (set-face-attribute! 'helm-ff-directory nil
		       :foreground blue-1
		       :background black-5
		       :bold t)

  (set-face-attribute! 'helm-ff-excutable nil
		       :foreground green-1
		       :background black-5
		       :bold t)

  (set-face-attribute! 'helm-ff-file nil
		       :foreground white-1
		       :background black-5)

  (set-face-attribute! 'helm-ff-invalid-symlink nil
		       :foreground white-1
		       :background red-2)

  (set-face-attribute! 'helm-ff-prefix nil
		       :foreground white-1
		       :background orange-2)

  (set-face-attribute! 'helm-grep-cmd-line nil
		       :foreground green-4
		       :background green-00
		       :bold t)

  (set-face-attribute! 'helm-grep-file nil
		       :foreground purple-1)

  (set-face-attribute! 'helm-grep-finish nil
		       :foreground green-2)

  (set-face-attribute! 'helm-grep-lineno nil
		       :foreground orange-2)

  (set-face-attribute! 'helm-grep-match nil
		       :background black-4
		       :foreground yellow-1
		       :bold t)

  (set-face-attribute! 'helm-grep-running nil
		       :foreground red-0
		       :background nil)

  (set-face-attribute! 'helm-header nil
		       :foreground blue-3
		       :background blue-0)

  (set-face-attribute! 'helm-lisp-show-completion nil
		       :foreground black-3
		       :background green-0)

  (set-face-attribute! 'helm-match nil
		       :foreground green-2
		       :background black-5
		       :bold t)

  (set-face-attribute! 'helm-selection nil
		       :foreground nil
		       :background blue-3)

  (set-face-attribute! 'helm-selection-line nil
		       :foreground nil
		       :background yellow-4)

  (set-face-attribute! 'helm-source-header nil
		       :foreground white-0
		       :background black-2-5
		       :bold t)

  (set-face-attribute! 'helm-visible-mark nil
		       :foreground magenta-2
		       :background magenta-0))


;; Magit >= 2.1.0
(ignore-errors
  (set-face-attribute! 'magit-bisect-bad nil
		       :foreground red-3
		       :background red-00)

  (set-face-attribute! 'magit-bisect-good nil
		       :foreground green-4
		       :background green-0)

  (set-face-attribute! 'magit-bisect-skip nil
		       :foreground yellow-4
		       :background orange-00)

  (set-face-attribute! 'magit-blame-date nil
		       :foreground orange-2
		       :background black-3)

  (set-face-attribute! 'magit-blame-hash nil
		       :foreground orange-2
		       :background black-3)

  (set-face-attribute! 'magit-blame-heading nil
		       :foreground white-1
		       :background black-3)

  (set-face-attribute! 'magit-blame-name nil
		       :foreground green-1
		       :background black-3)

  (set-face-attribute! 'magit-blame-summary nil
		       :foreground white-2
		       :background black-3)

  (set-face-attribute! 'magit-branch-current nil
		       :foreground white-0
		       :background orange-2
		       :bold t
		       :underline nil)

  (set-face-attribute! 'magit-branch-local nil
		       :foreground green-4
		       :background green-00
		       :bold t
		       :underline t)

  (set-face-attribute! 'magit-branch-remote nil
		       :foreground blue-3
		       :background blue-0
		       :bold t
		       :underline t)

  (set-face-attribute! 'magit-cherry-equivalent nil
		       :foreground purple-2)

  (set-face-attribute! 'magit-cherry-unmatched nil
		       :foreground cyan-4)

  (set-face-attribute! 'magit-diff-added nil
		       :foreground green-0
		       :background nil
		       :bold t)

  (set-face-attribute! 'magit-diff-added-highlight nil
		       :foreground green-0
		       :bold t
		       :inherit 'magit-section-highlight)

  (set-face-attribute! 'magit-diff-base nil
		       :foreground yellow-1
		       :background nil)

  (set-face-attribute! 'magit-diff-base-highlight nil
		       :foreground yellow-1
		       :bold t
		       :inherit 'magit-section-highlight)

  (set-face-attribute! 'magit-diff-conflict-heading nil
		       :foreground white-0
		       :background orange-2)

  (set-face-attribute! 'magit-diff-context nil
		       :foreground white-1
		       :background nil)

  (set-face-attribute! 'magit-diff-context-highlight nil
		       :foreground white-1
		       :inherit 'magit-section-highlight)

  (set-face-attribute! 'magit-diff-file-heading nil
		       :foreground white-0
		       :bold t)

  (set-face-attribute! 'magit-diff-file-heading-highlight nil
		       :background blue-3
		       :bold t)

  (set-face-attribute! 'magit-diff-file-heading-selection nil
		       :foreground white-0
		       :background black-2
		       :bold t)

  (set-face-attribute! 'magit-diff-hunk-heading nil
		       :foreground black-2
		       :background black-3
		       :bold t)

  (set-face-attribute! 'magit-diff-hunk-heading-highlight nil
		       :foreground black-4
		       :background blue-01)

  (set-face-attribute! 'magit-diff-hunk-heading-selection nil
		       :foreground white-1
		       :background white-1)

  (set-face-attribute! 'magit-diff-lines-boundary nil
		       :foreground white-1
		       :background red-0)

  (set-face-attribute! 'magit-diff-lines-heading nil
		       :foreground white-1
		       :background red-0)

  (set-face-attribute! 'magit-diff-our nil
		       :foreground magenta-3)

  (set-face-attribute! 'magit-diff-our-highlight nil
		       :foreground magenta-3
		       :background magenta-00)

  (set-face-attribute! 'magit-diff-removed nil
		       :foreground red-0
		       :background nil
		       :bold t)

  (set-face-attribute! 'magit-diff-removed-highlight nil
		       :foreground red-0
		       :bold t
		       :inherit 'magit-section-highlight)

  (set-face-attribute! 'magit-diff-their nil
		       :foreground cyan-4)
					;
  (set-face-attribute! 'magit-diff-their-highlight nil
		       :foreground cyan-6
		       :background cyan-1)

  (set-face-attribute! 'magit-diff-whitespace-warning nil
		       :foreground red-3
		       :background red-3)

  (set-face-attribute! 'magit-diffstat-added nil
		       :foreground green-3
		       :background green-0
		       :bold t)

  (set-face-attribute! 'magit-diffstat-removed nil
		       :foreground red-3
		       :background red-0
		       :bold t)

  (set-face-attribute! 'magit-dimmed nil
		       :foreground black-2)

  (set-face-attribute! 'magit-filename nil
		       :foreground blue-1)

  (set-face-attribute! 'magit-hash nil
		       :foreground orange-2
		       :background nil)

  (set-face-attribute! 'magit-head nil
		       :foreground orange-4
		       :background orange-000)

  (set-face-attribute! 'magit-header-line nil
		       :foreground orange-2)

  (set-face-attribute! 'magit-log-author nil
		       :foreground green-2
		       :background nil)

  (set-face-attribute! 'magit-log-date nil
		       :foreground black-2
		       :background nil)

  (set-face-attribute! 'magit-log-graph nil
		       :foreground black-2
		       :background nil)

  (set-face-attribute! 'magit-process-ng nil
		       :foreground red-3
		       :background red-00
		       :underline t)

  (set-face-attribute! 'magit-process-ok nil
		       :foreground green-3
		       :background green-00
		       :underline t)

  (set-face-attribute! 'magit-reflog-amend nil
		       :foreground magenta-3
		       :background magenta-00)

  (set-face-attribute! 'magit-reflog-checkout nil
		       :foreground green-3
		       :background green-00)

  (set-face-attribute! 'magit-reflog-cherry-pick nil
		       :foreground orange-4
		       :background orange-00)

  (set-face-attribute! 'magit-reflog-commit nil
		       :foreground yellow-4
		       :background yellow-0)

  (set-face-attribute! 'magit-reflog-merge nil
		       :foreground purple-4
		       :background purple-00)

  (set-face-attribute! 'magit-reflog-other nil
		       :foreground white-0
		       :background black-3)

  (set-face-attribute! 'magit-reflog-rebase nil
		       :foreground cyan-6
		       :background cyan-2)

  (set-face-attribute! 'magit-reflog-remote nil
		       :foreground blue-4
		       :background blue-0)

  (set-face-attribute! 'magit-reflog-reset nil
		       :foreground red-3
		       :background red-00)

  (set-face-attribute! 'magit-section-heading nil
		       :foreground orange-3
		       :background nil
		       :bold t
		       :underline t)

  (set-face-attribute! 'magit-section-heading-selection nil
		       :background blue-0)

  (set-face-attribute! 'magit-section-highlight nil
		       :background black-3)

  (set-face-attribute! 'magit-sequence-done nil
		       :foreground green-3)

  (set-face-attribute! 'magit-sequence-drop nil
		       :foreground orange-2)

  (set-face-attribute! 'magit-sequence-head nil
		       :foreground blue-2)

  (set-face-attribute! 'magit-sequence-onto nil
		       :foreground purple-2)

  (set-face-attribute! 'magit-sequence-part nil
		       :foreground cyan-4)

  (set-face-attribute! 'magit-sequence-pick nil
		       :foreground magenta-2)

  (set-face-attribute! 'magit-sequence-stop nil
		       :foreground red-3)

  (set-face-attribute! 'magit-signature-bad nil
		       :foreground red-2)

  (set-face-attribute! 'magit-signature-good nil
		       :foreground green-3)

  (set-face-attribute! 'magit-signature-untrusted nil
		       :foreground yellow-3)

  (set-face-attribute! 'magit-tag nil
		       :foreground blue-3
		       :background blue-0)

  (set-face-attribute! 'magit-valid-signature nil
		       :foreground cyan-4
		       :background LIGHT_BG
		       :bold t)

  (set-face-attribute! 'magit-whitespace-warning-face nil
		       :foreground white-0
		       :background red-2
		       :bold t))


;; Magit
(ignore-errors
  (set-face-attribute! 'magit-branch nil
		       :foreground green-4
		       :background green-01
		       :bold t
		       :underline t)

  (set-face-attribute! 'magit-diff-add nil
		       :foreground green-0
		       :background nil
		       :bold t)

  (set-face-attribute! 'magit-diff-del nil
		       :foreground red-0
		       :background nil
		       :bold t)

  (set-face-attribute! 'magit-diff-file-header nil
		       :foreground white-0
		       :background black-2
		       :bold t)

  (set-face-attribute! 'magit-diff-hunk-header nil
		       :foreground white-2
		       :background black-2-5
		       :bold t)

  (set-face-attribute! 'magit-diff-merge-current nil
		       :foreground purple-1)

  (set-face-attribute! 'magit-diff-merge-diff3-separator nil
		       :foreground purple-1)

  (set-face-attribute! 'magit-diff-merge-proposed nil
		       :foreground purple-1)

  (set-face-attribute! 'magit-diff-merge-separator nil
		       :foreground purple-1)

  (set-face-attribute! 'magit-diff-none nil
		       :foreground black-2)

  (set-face-attribute! 'magit-header nil
		       :foreground blue-2
		       :background white-0
		       :underline blue-2)

  (set-face-attribute! 'magit-item-highlight nil
		       :background "#444444"
		       :foreground white-0)

  (set-face-attribute! 'magit-item-mark nil
		       :foreground white-0
		       :background blue-3)

  (set-face-attribute! 'magit-log-author nil
		       :foreground green-0
		       :background black-4)

  (set-face-attribute! 'magit-log-author-date-cutoff nil
		       :foreground red-1
		       :bold t)

  (set-face-attribute! 'magit-log-date nil
		       :foreground white-1
		       :background black-4)

  (set-face-attribute! 'magit-log-graph nil
		       :foreground white-2
		       :background black-4)

  (set-face-attribute! 'magit-log-head-label-bisect-bad nil
		       :foreground red-3
		       :background red-00)

  (set-face-attribute! 'magit-log-head-label-bisect-good nil
		       :foreground green-4
		       :background green-0)

  (set-face-attribute! 'magit-log-head-label-bisect-skip nil
		       :foreground yellow-3
		       :background orange-00)

  (set-face-attribute! 'magit-log-head-label-default nil
		       :foreground green-4
		       :background green-2
		       :bold t
		       :underline t)

  (set-face-attribute! 'magit-log-head-label-head nil
		       :foreground green-4
		       :background green-01
		       :bold t
		       :underline t)

  (set-face-attribute! 'magit-log-head-label-local nil
		       :foreground green-4
		       :background green-00
		       :bold t
		       :underline t)

  (set-face-attribute! 'magit-log-head-label-patches nil
		       :foreground orange-4
		       :background orange-0
		       :bold t
		       :underline t)

  (set-face-attribute! 'magit-log-head-label-remote nil
		       :foreground blue-4
		       :background blue-0
		       :bold t
		       :underline t)

  (set-face-attribute! 'magit-log-head-label-tags nil
		       :foreground yellow-4
		       :background yellow-00
		       :bold t
		       :underline t)

  (set-face-attribute! 'magit-log-head-label-wip nil
		       :foreground white-2
		       :background black-2)

  (set-face-attribute! 'magit-log-message nil
		       :foreground white-1
		       :background nil)

  (set-face-attribute! 'magit-log-reflog-label-amend nil
		       :foreground magenta-3
		       :background magenta-0)

  (set-face-attribute! 'magit-log-reflog-label-checkout nil
		       :foreground green-4
		       :background green-00)

  (set-face-attribute! 'magit-log-reflog-label-cherry-pick nil
		       :foreground orange-4
		       :background orange-00)

  (set-face-attribute! 'magit-log-reflog-label-commit nil
		       :foreground yellow-4
		       :background yellow-0)

  (set-face-attribute! 'magit-log-reflog-label-merge nil
		       :foreground purple-4
		       :background purple-0)

  (set-face-attribute! 'magit-log-reflog-label-other nil
		       :foreground white-0
		       :background black-3)

  (set-face-attribute! 'magit-log-reflog-label-rebase nil
		       :foreground cyan-6
		       :background cyan-2)

  (set-face-attribute! 'magit-log-reflog-label-remote nil
		       :foreground blue-4
		       :background blue-0)

  (set-face-attribute! 'magit-log-reflog-label-reset nil
		       :foreground red-3
		       :background red-00)

  (set-face-attribute! 'magit-log-sha1 nil
		       :foreground orange-2
		       :background black-4)

  (set-face-attribute! 'magit-process-ng nil
		       :foreground red-3
		       :background red-00
		       :underline t
		       :bold t)

  (set-face-attribute! 'magit-process-ok nil
		       :foreground green-4
		       :background green-00
		       :underline t
		       :bold t)

  (set-face-attribute! 'magit-section-title nil
		       :foreground orange-2
		       :background black-5
		       :underline t
		       :bold t)

  (set-face-attribute! 'magit-signature-bad nil
		       :foreground red-1)

  (set-face-attribute! 'magit-signature-good nil
		       :foreground green-1)

  (set-face-attribute! 'magit-signature-none nil
		       :foreground white-1)

  (set-face-attribute! 'magit-signature-untrusted nil
		       :foreground cyan-3)

  (set-face-attribute! 'magit-tag nil
		       :foreground blue-3
		       :background blue-0)

  (set-face-attribute! 'magit-valid-signature nil
		       :foreground cyan-3
		       :background black-5
		       :bold t)

  (set-face-attribute! 'magit-whitespace-warning-face nil
		       :foreground white-0
		       :background red-3
		       :bold t))


;; git-commit-mode
(ignore-errors
  (set-face-attribute! 'git-commit-branch-face nil
		       :foreground blue-4
		       :background white-0
		       :bold t
		       :underline t)

  (set-face-attribute! 'git-commit-comment-action-face nil
		       :foreground orange-2
		       :background black-5
		       :underline t)

  (set-face-attribute! 'git-commit-comment-file-face nil
		       :foreground magenta-2)

  (set-face-attribute! 'git-commit-comment-heading-face nil
		       :foreground green-01
		       :background black-3
		       :bold t)

  (set-face-attribute! 'git-commit-known-pseudo-header-face nil
		       :foreground green-1)

  (set-face-attribute! 'git-commit-no-branch-face nil
		       :foreground orange-3)

  (set-face-attribute! 'git-commit-nonempty-second-line-face nil
		       :foreground red-2)

  (set-face-attribute! 'git-commit-note-face nil
		       :foreground cyan-3)

  (set-face-attribute! 'git-commit-overlong-summary-face nil
		       :foreground red-2)

  (set-face-attribute! 'git-commit-pseudo-header-face nil
		       :foreground magenta-3)

  (set-face-attribute! 'git-commit-summary-face nil
		       :foreground blue-1)

  (set-face-attribute! 'git-rebase-description-face nil
		       :foreground black-3)

  (set-face-attribute! 'git-rebase-killed-action-face nil
		       :foreground black-3))


;; Message faces
(ignore-errors
  (set-face-attribute! 'message-cited-text nil
		       :foreground green-1)

  (set-face-attribute! 'message-header-cc nil
		       :foreground blue-0)

  (set-face-attribute! 'message-header-name nil
		       :foreground white-3)

  (set-face-attribute! 'message-header-newsgroups nil
		       :foreground blue-1
		       :bold t)

  (set-face-attribute! 'message-header-other nil
		       :foreground magenta-1)

  (set-face-attribute! 'message-header-subject nil
		       :foreground white-0
		       :bold t)

  (set-face-attribute! 'message-header-to nil
		       :foreground blue-1
		       :underline t
		       :bold t)

  (set-face-attribute! 'message-header-xheader nil
		       :foreground black-1)

  (set-face-attribute! 'message-mml nil
		       :foreground orange-2)

  (set-face-attribute! 'message-separator nil
		       :foreground black-2-5))


;; Grep
(ignore-errors
  (set-face-attribute! 'grep-context-face nil
		       :foreground red-2)

  (set-face-attribute! 'grep-error-face nil
		       :foreground red-1
		       :weight 'bold
		       :underline t)

  (set-face-attribute! 'grep-hit-face nil
		       :foreground green-2)

  (set-face-attribute! 'grep-match-face nil
		       :foreground nil
		       :background nil
		       :inherit 'match)
  )
;; Diff
(ignore-errors
  (set-face-attribute! 'diff-added nil
		       :foreground green-0
		       :background black-4
		       :bold t)

  (set-face-attribute! 'diff-changed nil
		       :foreground yellow-2
		       :background black-4
		       :bold t)

  (set-face-attribute! 'diff-context nil
		       :foreground black-2-5)

  (set-face-attribute! 'diff-file-header nil
		       :foreground black-5
		       :background blue-0
		       :bold t)

  (set-face-attribute! 'diff-function nil
		       :foreground black-4
		       :background white-2)

  (set-face-attribute! 'diff-header nil
		       :foreground blue-3
		       :background blue-0)

  (set-face-attribute! 'diff-hunk-header nil
		       :foreground blue-0
		       :background black-3
		       :bold t)

  (set-face-attribute! 'diff-index nil
		       :foreground black-4
		       :background white-3
		       :bold t)

  (set-face-attribute! 'diff-indicator-added nil
		       :foreground white-0
		       :background green-3
		       :bold t)

  (set-face-attribute! 'diff-indicator-changed nil
		       :foreground white-0
		       :background yellow-3
		       :bold t)

  (set-face-attribute! 'diff-indicator-removed nil
		       :foreground white-0
		       :background red-3
		       :bold t)

  (set-face-attribute! 'diff-nonexistent nil
		       :foreground white-0
		       :background red-3
		       :bold t)

  (set-face-attribute! 'diff-refine-added nil
		       :foreground white-0
		       :background green-4
		       :bold t)

  (set-face-attribute! 'diff-refine-change nil
		       :foreground white-0
		       :background yellow-4
		       :bold t)

  (set-face-attribute! 'diff-refine-removed nil
		       :foreground white-0
		       :background red-3
		       :bold t)

  (set-face-attribute! 'diff-removed nil
		       :foreground red-0
		       :background black-4
		       :bold t))


;; Ediff
(ignore-errors
  (set-face-attribute! 'ediff-current-diff-A nil
		       :background yellow-4)

  (set-face-attribute! 'ediff-current-diff-Ancestor nil
		       :background blue-3)

  (set-face-attribute! 'ediff-current-diff-B nil
		       :background purple-4)

  (set-face-attribute! 'ediff-current-diff-C nil
		       :background orange-5)

  (set-face-attribute! 'ediff-even-diff-A nil
		       :background black-3)

  (set-face-attribute! 'ediff-even-diff-Ancestor nil
		       :background black-3)

  (set-face-attribute! 'ediff-even-diff-B nil
		       :background black-3)

  (set-face-attribute! 'ediff-even-diff-C nil
		       :background black-3)

  (set-face-attribute! 'ediff-fine-diff-A nil
		       :foreground nil
		       :background green-5
		       :bold t)

  (set-face-attribute! 'ediff-fine-diff-Ancestor nil
		       :foreground nil
		       :background green-5
		       :bold t)

  (set-face-attribute! 'ediff-fine-diff-B nil
		       :foreground nil
		       :background green-5
		       :bold t)

  (set-face-attribute! 'ediff-fine-diff-C nil
		       :foreground nil
		       :background green-5
		       :bold t)

  (set-face-attribute! 'ediff-odd-diff-A nil
		       :background red-3)

  (set-face-attribute! 'ediff-odd-diff-Ancestor nil
		       :background red-3)

  (set-face-attribute! 'ediff-odd-diff-B nil
		       :background red-3)

  (set-face-attribute! 'ediff-odd-diff-C nil
		       :background red-3))


;; smerge
(ignore-errors
  (set-face-attribute! 'smerge-refined-change nil
		       :background blue-3
		       :foreground white-0))


;; Flyspell faces
(ignore-errors
  (set-face-attribute! 'flyspell-duplicate nil
		       :underline t foreground-colororange-1)

  (set-face-attribute! 'flyspell-incorrect nil
		       :background red-1
		       :foreground white-1
		       :bold t))


;; Semantic faces
(ignore-errors
  (set-face-attribute! 'semantic-decoration-on-includes nil
		       :underline black-1)

  (set-face-attribute! 'semantic-decoration-on-private-members-face
		       nil
		       :background purple-3)

  (set-face-attribute! 'semantic-decoration-on-protected-members-face
		       nil
		       :background magenta-3)

  (set-face-attribute! 'semantic-decoration-on-unknown-includes
		       nil
		       :background red-3)

  (set-face-attribute! 'semantic-decoration-on-unparsed-includes
		       nil
		       :background black-4)

  (set-face-attribute! 'semantic-tag-boundary-face nil
		       :overline blue-1)

  (set-face-attribute! 'semantic-unmatched-syntax-face nil
		       :underline red-1))


;; CUA
(ignore-errors
  (set-face-attribute! 'cua-rectangle nil
		       :background magenta-3
		       :foreground white-1))

;; Ace-jump
(ignore-errors
  (set-face-attribute! 'ace-jump-face-background nil
		       :background nil
		       :foreground black-2-5)

  (set-face-attribute! 'ace-jump-face-foreground nil
		       :foreground orange-2
		       :bold t)
  )

;; avy-mode
(ignore-errors
  (set-face-attribute! 'avy-lead-face nil
		       :background cyan-1
		       :foreground black-4)

  (set-face-attribute! 'avy-lead-face-0 nil
		       :background purple-00
		       :foreground black-4)

  (set-face-attribute! 'avy-lead-face-1 nil
		       :background white-2
		       :foreground black-4)

  (set-face-attribute! 'avy-lead-face-2 nil
		       :background green-2
		       :foreground black-4)
  )

;; EShell
(ignore-errors
  (set-face-attribute! 'eshell-ls-archive nil
		       :foreground purple-2)

  (set-face-attribute! 'eshell-ls-backup nil
		       :foreground black-3)

  (set-face-attribute! 'eshell-ls-clutter nil
		       :foreground black-2)

  (set-face-attribute! 'eshell-ls-directory nil
		       :foreground blue-1
		       :bold t)

  (set-face-attribute! 'eshell-ls-executable nil
		       :foreground green-2)

  (set-face-attribute! 'eshell-ls-missing nil
		       :foreground white-0
		       :background red-3)

  (set-face-attribute! 'eshell-ls-product nil
		       :foreground white-0
		       :background green-2)

  (set-face-attribute! 'eshell-ls-readonly nil
		       :foreground orange-3)

  (set-face-attribute! 'eshell-ls-special nil
		       :foreground yellow-1)

  (set-face-attribute! 'eshell-ls-symlink  nil
		       :foreground magenta-2)

  (set-face-attribute! 'eshell-ls-unreadable nil
		       :foreground black-2)

  (set-face-attribute! 'eshell-prompt nil
		       :foreground white-0
		       :background black-2-5
		       :bold t)
  )

;; Comint prompt
(ignore-errors
  (set-face-attribute! 'comint-highlight-prompt nil
		       :foreground white-0
		       :background black-2-5
		       :bold t))


;; which-function-mode
(ignore-errors
  (set-face-attribute! 'which-func nil
		       :foreground white-0
		       :background orange-2))

;; Flymake
(ignore-errors
  (set-face-attribute! 'flymake-warnline nil
		       :underline orange-2)

  (set-face-attribute! 'flymake-errline nil
		       :underline red-2))


;; Flycheck
(ignore-errors
  (set-face-attribute! 'flycheck-error nil
		       :underline '(:style wave)
		       :inherit 'error
		       ;; "Flycheck face for errors."
		       )

  (set-face-attribute! 'flycheck-warning nil
		       :underline '(:style wave)
		       :inherit 'warning
		       ;; "Flycheck face for warnings."
		       )

  (set-face-attribute! 'flycheck-info nil
		       :underline '(:style wave)
		       :inherit 'success
		       ;; "Flycheck face for informational messages."
		       )

  (set-face-attribute! 'flycheck-fringe-error nil
		       :inherit 'error
		       ;; "Flycheck face for fringe error indicators."
		       )

  (set-face-attribute! 'flycheck-fringe-warning nil
		       :inherit 'warning
		       ;; "Flycheck face for fringe warning indicators."
		       )

  (set-face-attribute! 'flycheck-fringe-info nil
		       ;; Semantically `success' is probably not the right face but it looks nice as
		       ;; a base face
		       :inherit 'success
		       ;; "Flycheck face for fringe info indicators."
		       )

  (set-face-attribute! 'flycheck-error-list-error nil
		       :inherit 'error
		       ;; "Flycheck face for error messages in the error list."
		       )

  (set-face-attribute! 'flycheck-error-list-warning nil
		       :inherit 'warning
		       ;; "Flycheck face for warning messages in the error list."
		       )

  (set-face-attribute! 'flycheck-error-list-info nil
		       :inherit 'success
		       ;; "Flycheck face for info messages in the error list."
		       )

  ;; The base faces for the following two faces are inspired by Compilation Mode
  (set-face-attribute! 'flycheck-error-list-line-number nil
		       :inherit 'font-lock-constant-face
		       ;; "Face for line numbers in the error list."
		       )

  (set-face-attribute! 'flycheck-error-list-column-number nil
		       :inherit 'font-lock-constant-face
		       ;; "Face for line numbers in the error list."
		       )

  (set-face-attribute! 'flycheck-error-list-id nil
		       :inherit 'font-lock-type-face
		       ;; "Face for the error ID in the error list."
		       )

  (set-face-attribute! 'flycheck-error-list-id-with-explainer nil
		       :inherit 'flycheck-error-list-
		       :box '(:style released-button)
		       ;; "Face for the error ID in the error list for errors that have an explainer."
		       )

  (set-face-attribute! 'flycheck-error-list-checker-name nil
		       :inherit 'font-lock-function-name-face
		       ;; "Face for the syntax checker name in the error list."
		       )

  (set-face-attribute! 'flycheck-error-list-highlight nil
		       :inherit 'highlight
		       ;; "Flycheck face to highlight errors in the error list."
		       ))



;; Malabar
(ignore-errors
  (set-face-attribute! 'malabar-error-face nil
		       :underline red-2)

  (set-face-attribute! 'malabar-warning-face nil
		       :underline orange-2)

  (set-face-attribute! 'malabar-info-face nil
		       :underline blue-2))

;; MMM-Mode
(ignore-errors
  (set-face-attribute! 'mmm-cleanup-submode-face nil
		       :background orange-00)

  (set-face-attribute! 'mmm-code-submode-face nil
		       :background blue-00)

  (set-face-attribute! 'mmm-comment-submode-face nil
		       :background blue-0)

  (set-face-attribute! 'mmm-declaration-submode-face nil
		       :background cyan-1)

  (set-face-attribute! 'mmm-default-submode-face nil
		       :background nil)

  (set-face-attribute! 'mmm-delimiter-face nil
		       :background nil
		       :foreground white-0)

  (set-face-attribute! 'mmm-init-submode-face nil
		       :background magenta-0)

  (set-face-attribute! 'mmm-output-submode-face nil
		       :background purple-00)

  (set-face-attribute! 'mmm-special-submode-face nil
		       :background green-00))


;; Clojure/Cider
(ignore-errors
  (set-face-attribute! 'clojure-test-failure-face nil
		       :underline orange-2)

  (set-face-attribute! 'clojure-test-error-face nil
		       :underline red-2)

  (set-face-attribute! 'clojure-test-success-face nil
		       :underline green-3)

  (set-face-attribute! 'cider-deprecated-face nil
		       :background red-4))


;; Javascript
(ignore-errors
  (set-face-attribute! 'js2-function-param-face nil
		       :foreground green-3)

  (set-face-attribute! 'js2-external-variable nil
		       :foreground orange-2
		       :underline t)

  (set-face-attribute! 'js2-error nil
		       :foreground red-2
		       :underline t
		       :bold t)

  (set-face-attribute! 'js2-warning nil
		       :foreground nil
		       :underline t
		       :bold t))

;; rcirc
(ignore-errors
  (set-face-attribute! 'rcirc-bright-nick nil
		       :foreground blue-1
		       :bold t)

  (set-face-attribute! 'rcirc-dim-nick nil
		       :foreground black-2
		       :bold t)

  (set-face-attribute! 'rcirc-keyword nil
		       :foreground magenta-2
		       :bold t)

  (set-face-attribute! 'rcirc-my-nick nil
		       :foreground green-2
		       :bold t)

  (set-face-attribute! 'rcirc-nick-in-message nil
		       :foreground green-3)

  (set-face-attribute! 'rcirc-nick-in-message-full-line nil
		       :foreground blue-3)

  (set-face-attribute! 'rcirc-other-nick nil
		       :foreground blue-1
		       :bold t)

  (set-face-attribute! 'rcirc-prompt nil
		       :foreground black-3
		       :background green-01
		       :bold t)

  (set-face-attribute! 'rcirc-server nil
		       :foreground black-1)

  (set-face-attribute! 'rcirc-server-prefix nil
		       :foreground black-1)

  (set-face-attribute! 'rcirc-timestamp nil
		       :foreground orange-2)

  (set-face-attribute! 'rcirc-track-keyword nil
		       :foreground magenta-2)

  (set-face-attribute! 'rcirc-track-nick nil
		       :foreground blue-1)

  (set-face-attribute! 'rcirc-url nil
		       :foreground blue-1
		       :bold nil
		       :underline blue-2))


;; ERC
(ignore-errors
  (set-face-attribute! 'erc-button nil
		       :foreground blue-1
		       :underline blue-1
		       :bold nil)

  (set-face-attribute! 'erc-current-nick-face nil
		       :foreground green-1)

  (set-face-attribute! 'erc-dangerous-hosts nil
		       :foreground red-2
		       :bold t)

  (set-face-attribute! 'erc-direct-msg-face nil
		       :foreground orange-2)

  (set-face-attribute! 'erc-error-face nil
		       :foreground red-2)

  (set-face-attribute! 'erc-header-face nil
		       :background blue-1)

  (set-face-attribute! 'erc-input-face nil
		       :foreground white-0)

  (set-face-attribute! 'erc-keyword-face nil
		       :foreground magenta-2
		       :bold t)

  (set-face-attribute! 'erc-my-nick-face nil
		       :foreground green-1
		       :bold t)

  (set-face-attribute! 'erc-nick-default-face nil
		       :bold t
		       :foreground blue-1)

  (set-face-attribute! 'erc-nick-msg-face nil
		       :weight 'normal
		       :foreground orange-2)

  (set-face-attribute! 'erc-notice-face nil
		       :foreground black-2)

  (set-face-attribute! 'erc-pal-face nil
		       :foreground purple-1)

  (set-face-attribute! 'erc-prompt-face nil
		       :bold t
		       :foreground green-01
		       :background black-2-5)

  (set-face-attribute! 'erc-timestamp-face nil
		       :foreground orange-2))


;; ReStructuredText
(ignore-errors
  (set-face-attribute! 'rst-level-1-face nil
		       :foreground orange-2
		       :background black-5
		       :bold t)

  (set-face-attribute! 'rst-level-2-face nil
		       :foreground orange-2
		       :background black-5
		       :bold t)

  (set-face-attribute! 'rst-level-3-face nil
		       :foreground orange-2
		       :background black-5
		       :bold t)

  (set-face-attribute! 'rst-level-4-face nil
		       :foreground orange-2
		       :background black-5
		       :bold t)

  (set-face-attribute! 'rst-level-5-face nil
		       :foreground orange-2
		       :background black-5
		       :bold t)

  (set-face-attribute! 'rst-level-6-face nil
		       :foreground orange-2
		       :background black-5
		       :bold t)

  (set-face-attribute! 'rst-level-1 nil :foreground orange-2 :background black-5 :bold t)

  (set-face-attribute! 'rst-level-2 nil :foreground orange-2 :background black-5 :bold t)

  (set-face-attribute! 'rst-level-3 nil :foreground orange-2 :background black-5 :bold t)

  (set-face-attribute! 'rst-level-4 nil :foreground orange-2 :background black-5 :bold t)

  (set-face-attribute! 'rst-level-5 nil :foreground orange-2 :background black-5 :bold t)

  (set-face-attribute! 'rst-level-6 nil :foreground orange-2 :background black-5 :bold t)

  (set-face-attribute! 'rst-adornment nil
		       :foreground orange-2
		       :background black-5
		       :bold t)

  (set-face-attribute! 'rst-block nil
		       :foreground green-1
		       :background black-3
		       :bold t)

  (set-face-attribute! 'rst-comment nil
		       :foreground red-0
		       :background red-3
		       :bold t)

  (set-face-attribute! 'rst-literal nil
		       :foreground green-1
		       :background black-3)

  (set-face-attribute! 'rst-reference nil
		       :foreground magenta-2
		       :background black-5)

  (set-face-attribute! 'rst-definition nil
		       :foreground yellow-1
		       :background black-5)

  (set-face-attribute! 'rst-directive nil
		       :foreground purple-1
		       :background black-4
		       :bold t)

  (set-face-attribute! 'rst-external nil
		       :foreground blue-1
		       :background black-5)

  (set-face-attribute! 'rst-transition nil
		       :foreground green-2
		       :background black-4
		       :bold t)
  )

;; yalinum
(ignore-errors
  (set-face-attribute! 'yalinum-bar-face nil
		       :foreground black-2-5
		       :background white-1)

  (set-face-attribute! 'yalinum-face nil
		       :foreground white-1
		       :background black-2)

  (set-face-attribute! 'yalinum-track-face nil
		       :foreground white-1
		       :background black-2-5))


;; Ruby
(ignore-errors
  (set-face-attribute! 'enh-ruby-heredoc-delimiter-face nil
		       :foreground purple-2)

  (set-face-attribute! 'enh-ruby-op-face nil
		       :foreground orange-3
		       :bold t)

  (set-face-attribute! 'enh-ruby-regexp-delimiter-face nil
		       :foreground purple-2)

  (set-face-attribute! 'enh-ruby-string-delimiter-face nil
		       :foreground purple-0)

  (set-face-attribute! 'erm-syn-errline nil
		       :foreground red-00
		       :background red-3
		       :bold t
		       :underline t)

  (set-face-attribute! 'erm-syn-warnline nil
		       :bold t
		       :underline t))


;; ansi-term
(ignore-errors
  (set-face-attribute! 'term-color-black nil
		       :background black-5
		       :foreground black-5)

  (set-face-attribute! 'term-color-blue nil
		       :background cyan-3
		       :foreground cyan-3)

  (set-face-attribute! 'term-color-cyan nil
		       :background cyan-3
		       :foreground cyan-3)

  (set-face-attribute! 'term-color-green nil
		       :background green-2
		       :foreground green-2)

  (set-face-attribute! 'term-color-magenta nil
		       :background magenta-3
		       :foreground magenta-3)

  (set-face-attribute! 'term-color-red nil
		       :background red-1
		       :foreground red-1)

  (set-face-attribute! 'term-color-white nil
		       :background white-0
		       :foreground white-0)

  (set-face-attribute! 'term-color-yellow nil
		       :background orange-2
		       :foreground orange-2))


;; ido-mode
(ignore-errors
  (set-face-attribute! 'ido-first-match nil
		       :foreground orange-2
		       :bold t)

  (set-face-attribute! 'ido-incomplete-regexp nil
		       :foreground red-0
		       :bold t)

  (set-face-attribute! 'ido-indicator nil
		       :foreground yellow-4
		       :background orange-00)

  (set-face-attribute! 'ido-only-match nil
		       :foreground green-2
		       :background nil)

  (set-face-attribute! 'ido-subdir nil
		       :foreground blue-1
		       :bold t)

  (set-face-attribute! 'ido-virtual nil
		       :foreground magenta-3))


;; ivy-mode
(ignore-errors
  (set-face-attribute! 'ivy-current-match nil
		       :foreground orange-2
		       :background black-3
		       :bold t
		       :inherit 'highlight)

  (set-face-attribute! 'ivy-confirm-face nil
		       :foreground green-4
		       :background green-00
		       :bold t)

  (set-face-attribute! 'ivy-subdir nil
		       :foreground blue-1
		       :bold t)

  (set-face-attribute! 'ivy-virtual nil
		       :foreground magenta-3)


  (set-face-attribute! 'ivy-minibuffer-match-face-1 nil
		       :background blue-1
		       :foreground white-0)

  (set-face-attribute! 'ivy-minibuffer-match-face-2 nil
		       :bold t
		       :background green-2
		       :foreground white-0)

  (set-face-attribute! 'ivy-minibuffer-match-face-3 nil
		       :bold t
		       :background magenta-2
		       :foreground white-0)

  (set-face-attribute! 'ivy-minibuffer-match-face-4 nil
		       :bold t
		       :background cyan-3
		       :foreground white-0))


;; swiper
(ignore-errors
  (set-face-attribute! 'swiper-match-face-1 nil
		       :background blue-1
		       :foreground white-0)

  (set-face-attribute! 'swiper-match-face-2 nil
		       :bold t
		       :background green-2
		       :foreground white-0)

  (set-face-attribute! 'swiper-match-face-3 nil
		       :bold t
		       :background magenta-2
		       :foreground white-0)

  (set-face-attribute! 'swiper-match-face-4 nil
		       :bold t
		       :background cyan-3
		       :foreground white-0)

  (set-face-attribute! 'swiper-line-face nil
		       :foreground orange-2
		       :bold t
		       :inherit highlight))


;; volatile-highlights
(ignore-errors
  (set-face-attribute! 'vhl/default-face nil
		       :foreground black-3
		       :background green-0))


;; notmuch
(ignore-errors
  (set-face-attribute! 'notmuch-search-unread-face nil
		       :weight 'bold))


;; git-gutter (&-fringe)
(ignore-errors
  (set-face-attribute! 'git-gutter
		       :added nil
		       :foreground green-4
		       :background green-0
		       :bold t)

  (set-face-attribute! 'git-gutter
		       :deleted nil
		       :foreground red-3
		       :background red-00
		       :bold t)

  (set-face-attribute! 'git-gutter
		       :modified nil
		       :foreground yellow-4
		       :background yellow-0
		       :bold t))


;; cfw: Calendar Framework
(ignore-errors
  (set-face-attribute! 'cfw:face-annotation nil
		       :foreground
		       :background )

  (set-face-attribute! 'cfw:face-day-title nil
		       :foreground white-0
		       :background "#262626")

  (set-face-attribute! 'cfw:face-default-content nil
		       :foreground
		       :background )

  (set-face-attribute! 'cfw:face-default-day nil
		       :foreht
		       :background )

  (set-face-attribute! 'cfw:face-disable nil
		       :foreground
		       :background )

  (set-face-attribute! 'cfw:face-grid nil
		       :foreground black-2)

  (set-face-attribute! 'cfw:face-header nil
		       :foreground white-1
		       :background black-3
		       :bold t)

  (set-face-attribute! 'cfw:face-holiday nil
		       :foreground purple-1
		       :background "#262626"
		       :bold t)

  (set-face-attribute! 'cfw:face-periods nil
		       :foreground
		       :background )

  (set-face-attribute! 'cfw:face-saturday nil
		       :foreground blue-01
		       :background blue-3
		       :bold t)

  (set-face-attribute! 'cfw:face-select nil
		       :foreground black-5
		       :background blue-1)

  (set-face-attribute! 'cfw:face-sunday nil
		       :foreground red-00
		       :background red-3
		       :bold t)

  (set-face-attribute! 'cfw:face-title nil
		       :foreground
		       :background )

  (set-face-attribute! 'cfw:face-today nil
		       :foreground orange-2
		       :background black-3)

  (set-face-attribute! 'cfw:face-today-title nil
		       :foreground white-0
		       :background orange-2)

  (set-face-attribute! 'cfw:face-toolbar nil
		       :foreground white-1
		       :background black-3)

  (set-face-attribute! 'cfw:face-toolbar-button-off nil
		       :foreground cyan-5
		       :background black-3)

  (set-face-attribute! 'cfw:face-toolbar-button-on nil
		       :foreground red-1
		       :background white-0))


;; Column marker
(ignore-errors
  (set-face-attribute! 'column-marker-1 nil
		       :background black-2-5)

  (set-face-attribute! 'column-marker-2 nil
		       :background yellow-4)

  (set-face-attribute! 'column-marker-3 nil
		       :background red-3))


;; Swoop
(ignore-errors
  (set-face-attribute! 'swoop-face-header-format-line nil
		       :foreground black-6
		       :background nil
		       :underline nil)

  (set-face-attribute! 'swoop-face-line-buffer-name nil
		       :foreground green-4
		       :background green-0)

  (set-face-attribute! 'swoop-face-line-number nil
		       :foreground "#87875f"
		       :background "#d7d7af")

  (set-face-attribute! 'swoop-face-target-line nil
		       :foreground yellow-1
		       :background black-2-5)

  (set-face-attribute! 'swoop-face-target-words nil
		       :foreground magenta-1
		       :background black-2-5
		       :bold t)

  (set-face-attribute! 'helm-swoop-target-line-block-face nil
		       :foreground yellow-1
		       :background black-3)

  (set-face-attribute! 'helm-swoop-target-line-face nil
		       :foreground yellow-1
		       :background black-2-5)

  (set-face-attribute! 'helm-swoop-target-word-face nil
		       :foreground magenta-3
		       :background magenta-0
		       :bold t))


;; widget
(ignore-errors
  (set-face-attribute! 'widget-button nil
		       :foreground blue-1
		       :underline t
		       :bold t)

  (set-face-attribute! 'widget-button-pressed nil
		       :foreground blue-0)

  (set-face-attribute! 'widget-documentation nil
		       :foreground green-1)

  (set-face-attribute! 'widget-field nil
		       :foreground green-0
		       :background black-3)

  (set-face-attribute! 'widget-inactive nil
		       :foreground black-2)

  (set-face-attribute! 'widget-single-line-field nil
		       :foreground green-0
		       :background black-3))


;; table
(ignore-errors
  (set-face-attribute! 'table-cell nil
		       :foreground white-0
		       :background black-3))


;; compilation
(ignore-errors
  (set-face-attribute! 'compilation-column-number nil
		       :foreground green-2)

  (set-face-attribute! 'compilation-error nil
		       :foreground red-3
		       :background red-0
		       :bold t)

  (set-face-attribute! 'compilation-info nil
		       :foreground orange-2
		       :background black-3)

  (set-face-attribute! 'compilation-line-number nil
		       :foreground blue-1)

  (set-face-attribute! 'compilation-mode-line-exit nil
		       :foreground green-4
		       :background green-0
		       :bold t)

  (set-face-attribute! 'compilation-mode-line-fail nil
		       :foreground red-3
		       :background red-00
		       :bold t)

  (set-face-attribute! 'compilation-mode-line-run nil
		       :foreground orange-4
		       :background orange-00
		       :bold t)

  (set-face-attribute! 'compilation-warning nil
		       :foreground orange-3))


;; Neotree
(ignore-errors
  (set-face-attribute! 'neo-banner-face nil
		       :foreground green-3
		       :background nil)

  (set-face-attribute! 'neo-header-face nil
		       :foreground green-1
		       :background nil)

  (set-face-attribute! 'neo-root-dir-face nil
		       :foreground magenta-1)

  (set-face-attribute! 'neo-button-face nil
		       :foreground blue-1
		       :bold t)

  (set-face-attribute! 'neo-dir-link-face nil
		       :foreground blue-1
		       :bold t)

  (set-face-attribute! 'neo-expand-btn-face nil
		       :foreground blue-1
		       :background black-2-5)

  (set-face-attribute! 'neo-file-link-face nil
		       :foreground white-1))


;; info
(ignore-errors
  (set-face-attribute! 'info-header-node nil
		       :foreground magenta-2
		       :bold t)

  (set-face-attribute! 'info-header-xref nil
		       :foreground blue-1
		       :background nil
		       :bold t)

  (set-face-attribute! 'info-index-match nil
		       :background blue-3)

  (set-face-attribute! 'info-menu-header nil
		       :foreground white-0
		       :bold t
		       :underline t)

  (set-face-attribute! 'info-menu-star nil
		       :foreground red-1)

  (set-face-attribute! 'info-node nil
		       :foreground red-3)

  (set-face-attribute! 'info-title-1 nil
		       :foreground blue-1
		       :bold t)

  (set-face-attribute! 'info-title-2 nil
		       :foreground green-2
		       :bold t)

  (set-face-attribute! 'info-title-3 nil
		       :foreground orange-2
		       :bold t)

  (set-face-attribute! 'info-title-4 nil
		       :foreground magenta-2
		       :bold t)

  (set-face-attribute! 'info-xref nil
		       :foreground blue-1
		       :underline t)

  (set-face-attribute! 'info-xref-visited nil
		       :foreground purple-1
		       :underline t))


;; Tuareg
(ignore-errors
  (set-face-attribute! 'tuareg-font-lock-error-face nil
		       :foreground red-3
		       :background red-00
		       :bold t)

  (set-face-attribute! 'tuareg-font-lock-governing-face nil
		       :foreground white-1
		       :bold t)

  (set-face-attribute! 'tuareg-font-lock-interactive-error-face nil
		       :foreground red-3
		       :background red-00
		       :bold t)

  (set-face-attribute! 'tuareg-font-lock-interactive-output-face nil
		       :foreground blue-3)

  (set-face-attribute! 'tuareg-font-lock-multistage-face nil
		       :foreground blue-3
		       :background blue-0)

  (set-face-attribute! 'tuareg-font-lock-operator-face nil
		       :foreground green-2
		       :bold t))


;; CPerl
(ignore-errors
  (set-face-attribute! 'cperl-array-face nil
		       :foreground blue-01
		       :background blue-3)

  (set-face-attribute! 'cperl-hash-face nil
		       :foreground orange-0
		       :background red-4)

  (set-face-attribute! 'cperl-nonoverridable-face nil
		       :foreground green-01
		       :background green-5))


;; Haskell
(ignore-errors
  (set-face-attribute! 'haskell-interactive-face-compile-error nil
		       :foreground red-0
		       :background nil
		       :bold t)

  (set-face-attribute! 'haskell-interactive-face-compile-warning nil
		       :foreground orange-2
		       :background nil
		       :bold t)

  (set-face-attribute! 'haskell-interactive-face-garbage nil
		       :foreground black-2)

  (set-face-attribute! 'haskell-interactive-face-prompt nil
		       :foreground green-01
		       :background black-2-5
		       :bold t)

  (set-face-attribute! 'haskell-interactive-face-result nil
		       :foreground blue-1))


;; EMMS
(ignore-errors
  (set-face-attribute! 'emms-state-current-playing-time nil
		       :foreground blue-3
		       :bold t)

  (set-face-attribute! 'emms-state-total-playing-time nil
		       :foreground blue-3)

  (set-face-attribute! 'emms-playlist-selected-face nil
		       :foreground green-2
		       :bold t)

  (set-face-attribute! 'emms-playlist-track-face nil
		       :foreground cyan-5))



;; tty-menu
(ignore-errors
  (set-face-attribute! 'menu nil
		       :foreground black-1
		       :background black-3)

  (set-face-attribute! 'tty-menu-disabled-face nil
		       :foreground black-2-5
		       :background black-3)

  (set-face-attribute! 'tty-menu-enabled-face nil
		       :foreground white-0
		       :background black-3
		       :bold t)

  (set-face-attribute! 'tty-menu-selected-face nil
		       :background blue-3))


;; web-mode
(ignore-errors
  (set-face-attribute! 'web-mode-comment-face nil
		       :foreground black-2-5)

  (set-face-attribute! 'web-mode-current-element-highlight-face nil
		       :background black-3)

  (set-face-attribute! 'web-mode-current-column-highlight-face nil
		       :background black-3)

  (set-face-attribute! 'web-mode-symbol-face nil
		       :foreground yellow-2)

  (set-face-attribute! 'web-mode-type-face nil
		       :foreground cyan-3))



;; Custom
(ignore-errors
  (set-face-attribute! 'custom-button nil
		       :background blue-0
		       :foreground blue-3
		       :box '(
			      :line-width 1
			      :style released-button))

  (set-face-attribute! 'custom-button-mouse nil
		       :background blue-00
		       :foreground black-3
		       :box '(
			      :line-width 1
			      :style released-button))

  (set-face-attribute! 'custom-button-pressed nil
		       :foreground black-3
		       :background white-1
		       :box '(
			      :line-width 1
			      :style pressed-button)))

;; Hydra
(ignore-errors
  (set-face-attribute! 'hydra-face-red nil
		       :foreground red-0)

  (set-face-attribute! 'hydra-face-blue nil
		       :foreground blue-1)

  (set-face-attribute! 'hydra-face-amaranth nil
		       :foreground magenta-2))


;; rpm-spec-mode
(ignore-errors
  (set-face-attribute! 'rpm-spec-tag-face nil
		       :foreground blue-1)

  (set-face-attribute! 'rpm-spec-obsolete-tag-face nil
		       :foreground white-0
		       :bold t
		       :background red-2)

  (set-face-attribute! 'rpm-spec-macro-face nil
		       :foreground yellow-2)

  (set-face-attribute! 'rpm-spec-var-face nil
		       :foreground purple-1)

  (set-face-attribute! 'rpm-spec-doc-face nil
		       :foreground magenta-2)

  (set-face-attribute! 'rpm-spec-dir-face nil
		       :foreground green-2)

  (set-face-attribute! 'rpm-spec-package-face nil
		       :foreground red-0)

  (set-face-attribute! 'rpm-spec-ghost-face nil
		       :foreground red-0)

  (set-face-attribute! 'rpm-spec-section-face nil
		       :foreground yellow-2))


(set-face-attribute! 'rainbow-delimiters-unmatched-face nil
		     :foreground white-0
		     :background red-3
		     :bold t)

(set-face-attribute! 'rainbow-delimiters-depth-1-face nil :foreground "#9a4040" :weight 'normal)
(set-face-attribute! 'rainbow-delimiters-depth-2-face nil :foreground "#ff5e5e" :weight 'normal)
(set-face-attribute! 'rainbow-delimiters-depth-3-face nil :foreground "#ffaa77" :weight 'normal)
(set-face-attribute! 'rainbow-delimiters-depth-4-face nil :foreground "#dddd77" :weight 'normal)
(set-face-attribute! 'rainbow-delimiters-depth-5-face nil :foreground "#80ee80" :weight 'normal)
(set-face-attribute! 'rainbow-delimiters-depth-6-face nil :foreground "#66bbff" :weight 'normal)
(set-face-attribute! 'rainbow-delimiters-depth-7-face nil :foreground "#da6bda" :weight 'normal)
(set-face-attribute! 'rainbow-delimiters-depth-8-face nil :foreground "#afafaf" :weight 'normal)
(set-face-attribute! 'rainbow-delimiters-depth-9-face nil :foreground "#f0f0f0" :weight 'normal)

(set-face-attribute! 'highlight-indent-guides-top-character-face nil
		     :foreground blue-0
		     :weight 'ultra-bold)



(setq rainbow-indent-highlighter-count 9)

(dotimes (i 9)
  (make-face (intern (concat "rainbow-indent-depth-"
			     (number-to-string (+ i 1))
			     "-face"))))

(if window-system
    (progn
      (setq highlight-indent-guides-character ?\x0020)

     (let*
	 ((char-width (frame-char-width (selected-frame)))
	  (hl-stipple (if (> char-width 8)
			  (list char-width 4 (string 1 1 1 1 1 1 1 1))
			(list char-width 4 (string 1 1 1 1)))))
       (set-face-attribute! 'highlight-indent-guides-top-character-face nil
			   :stipple hl-stipple
			   :foreground blue-0)
       (dotimes (i 9)
	 (set-face-attribute!
	  (intern (concat "rainbow-indent-depth-"
			  (number-to-string (+ i 1))
			  "-face"))
	  nil
	  :inherit
	  (intern (concat "rainbow-delimiters-depth-"
			  (number-to-string (+ i 1))
			  "-face"))
	  :stipple hl-stipple)))))


(if (not window-system)
    (progn
      (dotimes (i 9)
	(set-face-attribute!
	 (intern (concat "rainbow-indent-depth-"
			 (number-to-string (+ i 1))
			 "-face"))
	 nil
	 :inherit
	 (intern (concat "rainbow-delimiters-depth-"
			 (number-to-string (+ i 1))
			 "-face"))
	 :stipple nil))))

(provide-theme 'my-moe-dark)
