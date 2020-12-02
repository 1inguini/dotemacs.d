;;; my-moe-dark-theme.el --- An eye-candy theme for Emacser

;; Author: linguini
;; Based on "moe-dark-theme"

;;; Code:

(deftheme my-moe-dark
  "Face colors for 256 colors terminal (dark background). Moe, moe, kyun!")

(let
    ((class '((class color) (min-colors 89)))
     ;; Palette colors.
     (yellow-1 "#fce94f")
     (yellow-2 "#ffd700")
     (yellow-3 "#c4a000")
     (yellow-3-5 "#aaaa11")
     (yellow-4 "#875f00")

     (orange-1 "#ffaf5f")
     (orange-2 "#ff8700")
     (orange-3 "#ff5d17")
     (orange-4 "#d75f00")
     (orange-5 "#af5f00")

     (magenta-1 "#ff7bbb")
     (magenta-2 "#ff4ea3")
     (magenta-3 "#ff1f8b")

     (green-1 "#afff00")
     (green-2 "#a1db00")
     (green-3 "#5faf00")
     (green-4 "#008700")
     (green-5 "#005f00")

     (cyan-1 "#87ffff")
     (cyan-2 "#87d7af")
     (cyan-3 "#00d7af")
     (cyan-4 "#00ac8a")
     (cyan-5 "#5faf87")
     (cyan-6 "#005f5f")
     (cyan-7 "#236f73")

     (blue-1 "#5fafd7")
     (blue-2 "#1f5bff")
     (blue-3 "#005f87")
     (blue-4 "#005faf")
     (blue-5 "#0000af")
     (blue-6 "#00005f")

     (purple-1 "#d18aff")
     (purple-2 "#af5fff")
     (purple-3 "#9a08ff")
     (purple-4 "#6c0099")

     (red-1 "#ef2929")
     (red-2 "#dd0000")
     (red-3 "#a40000")
     (red-4 "#5f0000")

     (white-1 "#c6c6c6")
     (defaultfg "#c6c6c6")
     (white-3 "#b2b2b2")
     (black-1 "#a8a8a8")
     (black-2 "#8a8a8a")

     (black-2-5 "#6c6c6c")
     (black-3 "#4e4e4e")
     (black-4 "#3a3a3a")
     (defaultbg "#303030")
     (black-6 "#000000")

     (LIGHT_BG "#fdfde7")
     (white-0 "#eeeeee")

     (green-02 "#5fd700")
     (green-01 "#d7ff00")
     (green-0 "#d7ff5f")
     (green-00 "#d7ff87")

     (cyan-0 "#d7ffd7")

     (blue-01 "#c3c9f8")
     (blue-0 "#afd7ff")
     (blue-00 "#d7d7ff")

     (yellow-0 "#ffff87")
     (yellow-00 "#ffffaf")

     (purple-0 "#af87ff")
     (purple-00 "#e6a8df")

     (red-0 "#ff4b4b")
     (red-00 "#ffafaf")

     (magenta-0 "#ffafd7")
     (magenta-00 "#ffd7ff")

     (orange-0 "#ffaf87")
     (orange-00 "#ffd787")
     (orange-000 "#ffd7af")

     (linum-dark "#87875f")
     (linum-light "#d7d7af"))


  (custom-theme-set-faces
   'my-moe-dark
   ;; Ensure sufficient contrast on low-color terminals.
   `(default
      ((((class color) (min-colors 4096))
	(
	 :width normal
	 :height 116
	 :weight normal
	 :slant normal
	 :underline nil
	 :overline nil
	 :strike-through nil
	 :box nil
	 :inverse-video nil
	 :foreground ,defaultfg
	 :background ,defaultbg
	 :stipple nil
	 :inherit nil)))
      ((((class color) (min-colors 256))
       (
	:width normal
	:height 116
	:weight normal
	:slant normal
	:underline nil
	:overline nil
	:strike-through nil
	:box nil
	:inverse-video nil
	:foreground ,defaultfg
	:background ,defaultbg
	:stipple nil
	:inherit nil))
      (,class
       (
	:width normal
	:height 116
	:weight normal
	:slant normal
	:underline nil
	:overline nil
	:strike-through nil
	:box nil
	:inverse-video nil
	:foreground ,defaultfg
	:background ,defaultbg
	:stipple nil
	:inherit nil))))

  `(cursor
    ((,class (
	      :background ,white-0))))

  ;; Highlighting faces
  `(fringe
    ((,class (
	      :foreground ,black-1
	      :background ,black-4))))
  `(linum
    ((,class (
	      ;; :foreground ,black-1
	      ;; :background ,black-4
	      :inherit fringe
	      :stipple nil))))
  `(line-number
    ((,class (
	      :foreground ,white-3
	      :background ,black-3))))
  `(linum-highlight-face
    ((,class (
	      :background ,green-0
	      :foreground ,black-4))))
  `(line-number-current-line
    ((,class (
	      :background ,green-0
	      :foreground ,black-4))))
  `(highlight
    ((,class (
	      :background ,black-3))))
  `(hl-line
    ((,class (
	      :background ,black-4))))
  `(highlight-symbol-face
    ((,class (
	      :background ,green-5))))
  `(region
    ((,class (
	      :foreground ,black-3
	      :background ,green-0))))
  `(secondary-selection
    ((,class (
	      :background ,blue-3
	      :foreground ,white-0))))
  `(isearch
    ((,class (
	      :foreground ,defaultfg
	      :background ,orange-3))))
  `(lazy-highlight
    ((,class (
	      :background ,magenta-3
	      :foreground ,defaultfg))))
  `(trailing-whitespace
    ((,class (
	      :background ,red-3))))
  `(show-paren-match
    ((,class (
	      :background ,blue-3
	      :foreground nil))))
  `(header-line
    ((,class (
	      :background ,blue-3
	      :foreground ,white-0))))
  `(help-argument-name
    ((,class (
	      :foreground ,magenta-1
	      :italic t))))
  `(eldoc-highlight-function-argument
    ((,class (
	      :foreground ,green-01
	      :bold t
	      :underline t
	      :background ,green-5))))
  ;; Mode line & frames' faces
  `(mode-line
    ((,class (
	      :box nil
	      :background ,blue-0
	      :foreground ,blue-3))))
  `(mode-line-inactive
    ((,class (
	      :box nil
	      :background ,black-2-5
	      :foreground ,defaultfg))))
  `(mode-line-buffer-id
    ((,class (
	      :box nil
	      :foreground ,defaultbg
	      :background nil
	      :bold t))))
  `(vertical-border
    ((,class (
	      :foreground ,black-3
	      :background ,black-3))))

  ;; Escape and prompt faces
  `(minibuffer-prompt
    ((,class (
	      :foreground ,black-3
	      :background ,green-2))))
  `(escape-glyph
    ((,class (
	      :foreground ,yellow-3))))
  `(error
    ((,class (
	      :foreground ,red-0))))
  `(warning
    ((,class (
	      :foreground ,orange-1))))
  `(success
    ((,class (
	      :foreground ,green-1))))

  ;; Font lock faces
  `(font-lock-builtin-face
    ((,class (
	      :foreground ,purple-1))))
  `(font-lock-comment-delimiter-face
    ((,class (
	      :foreground ,black-2-5
	      :slant italic))))
  `(font-lock-comment-face
    ((,class (
	      :foreground ,black-2-5
	      :slant italic))))
  `(font-lock-constant-face
    ((,class (
	      :foreground ,blue-1))))
  `(font-lock-doc-face
    ((,class (
	      :foreground ,red-0))))
  `(font-lock-doc-string-face
    ((,class (
	      :foreground ,yellow-3))))
  `(font-lock-function-name-face
    ((,class (
	      :foreground ,yellow-2))))
  `(font-lock-keyword-face
    ((,class (
	      :foreground ,green-2))))
  `(font-lock-negation-char-face
    ((,class (
	      :foreground ,red-0))))
  `(font-lock-preprocessor-face
    ((,class (
	      :foreground ,purple-1))))
  `(font-lock-regexp-grouping-backslash
    ((,class (
	      :foreground ,yellow-1))))
  `(font-lock-regexp-grouping-construct
    ((,class (
	      :foreground ,purple-1))))
  `(font-lock-string-face
    ((,class (
	      :foreground ,magenta-2))))
  `(font-lock-type-face
    ((,class (
	      :foreground ,cyan-3))))
  `(font-lock-variable-name-face
    ((,class (
	      :foreground ,orange-2))))
  `(font-lock-warning-face
    ((,class (
	      :weight bold
	      :foreground ,red-2))))

  ;; Completions
  `(completions-annotations
    ((,class (
	      :foreground ,green-2))))
  `(completions-common-part
    ((,class (
	      :foreground ,black-2-5))))
  `(completions-first-difference
    ((,class (
	      :weight bold
	      :foreground ,orange-2))))

  ;; org-mode
  `(org-document-title
    ((,class (
	      :foreground ,blue-0
	      :background ,defaultbg
	      :weight bold))))
  `(org-document-info
    ((,class (
	      :foreground ,blue-1
	      :background ,defaultbg
	      :weight bold))))
  `(org-document-info-keyword
    ((,class (
	      :foreground ,orange-1
	      :background ,black-2-5))))
  `(org-archived
    ((,class (
	      :slant italic))))
  `(org-checkbox
    ((,class (
	      :background ,defaultfg
	      :foreground ,black-3

	      :box (
		    :line-width 1
		    :style released-button)))))
  `(org-date
    ((,class (
	      :foreground ,blue-0
	      :underline t))))
  `(org-done
    ((,class (
	      :bold t
	      :weight bold
	      :foreground ,green-4
	      :background ,green-0

	      :box (
		    :line-width 1
		    :style none)))))
  `(org-todo
    ((,class (
	      :bold t
	      :weight bold
	      :foreground ,red-3
	      :background ,orange-0

	      :box (
		    :line-width 1
		    :style none)))))
  `(org-level-1
    ((,class (
	      :foreground ,blue-1))))
  `(org-level-2
    ((,class (
	      :foreground ,green-2))))
  `(org-level-3
    ((,class (
	      :foreground ,orange-2))))
  `(org-level-4
    ((,class (
	      :foreground ,cyan-3))))
  `(org-level-5
    ((,class (
	      :foreground ,red-1))))
  `(org-level-6
    ((,class (
	      :foreground ,purple-2))))
  `(org-level-7
    ((,class (
	      :foreground ,magenta-2))))
  `(org-level-8
    ((,class (
	      :foreground ,yellow-2))))
  `(org-tag
    ((,class (
	      :background ,black-3
	      :foreground ,defaultfg
	      :bold t
	      :weight bold))))

  `(org-column
    ((,class (
	      :background ,black-4
	      :foreground ,black-3))))
  `(org-column-title
    ((,class (
	      :background ,blue-0
	      :foreground ,defaultbg
	      :underline t
	      :weight bold))))
  `(org-agenda-structure
    ((,class (
	      :foreground ,cyan-4
	      :background nil
	      :bold t))))
  `(org-deadline-announce
    ((,class (
	      :foreground ,red-3))))
  `(org-scheduled
    ((,class (
	      :foreground ,white-3))))
  `(org-scheduled-previously
    ((,class (
	      :foreground ,red-1))))
  `(org-scheduled-today
    ((,class (
	      :foreground ,blue-1))))
  `(org-special-keyword
    ((,class (
	      :background ,black-3
	      :foreground ,defaultfg))))
  `(org-table
    ((,class (
	      :background ,black-3
	      :foreground ,defaultfg))))
  `(org-time-grid
    ((,class (
	      :foreground ,black-2))))
  `(org-upcoming-deadline
    ((,class (
	      :foreground ,red-1))))
  `(org-warning
    ((,class (
	      :bold t
	      :foreground ,white-0
	      :background ,red-3))))
  `(org-formula
    ((,class (
	      :foreground ,purple-2))))
  `(org-headline-done
    ((,class (
	      :foreground ,green-2))))
  `(org-hide
    ((,class (
	      :foreground ,defaultbg))))
  `(org-code
    ((,class (
	      :foreground ,blue-1
	      :background ,black-4))))
  `(org-link
    ((,class (
	      :foreground ,blue-1
	      :underline t))))
  `(org-footnote
    ((,class (
	      :foreground ,magenta-3))))
  `(org-ellipsis
    ((,class (
	      :foreground ,red-2))))
  `(org-agenda-clocking
    ((,class (
	      :foreground ,blue-3
	      :background ,blue-0
	      :bold t))))
  `(org-agenda-date
    ((,class (
	      :foreground ,blue-1
	      :background ,defaultbg
	      :underline nil))))
  `(org-agenda-date-weekend
    ((,class (
	      :foreground ,purple-1
	      :underline nil
	      :bold nil))))
  `(org-agenda-date-today
    ((,class (
	      :foreground ,blue-0
	      :background ,black-2-5
	      :slant italic
	      :weight bold))))
  `(org-agenda-column-dateline
    ((,class (
	      :foreground ,white-0
	      :background ,black-3
	      :underline t))))
  `(org-agenda-todo
    ((,class (
	      :foreground ,white-0
	      :background ,red-2))))
  `(org-agenda-done
    ((,class (
	      :foreground ,green-2
	      :background nil))))
  `(org-agenda-dimmed-todo-face
    ((,class (
	      :foreground ,white-0
	      :background ,red-2))))
  `(org-priority
    ((,class (
	      :foreground ,red-1
	      :background ,nil))))
  `(org-block
    ((,class (
	      :foreground ,blue-1
	      :background ,black-4))))
  `(org-block-background
    ((,class (
	      :foreground nil
	      :background ,black-4))))
  `(org-block-begin-line
    ((,class (
	      :foreground ,white-0
	      :background ,blue-3))))
  `(org-block-end-line
    ((,class (
	      :foreground ,black-3
	      :background ,black-4))))
  `(org-quote
    ((,class (
	      :foreground ,blue-1
	      :background ,black-3))))
  `(org-mode-line-clock
    ((,class (
	      :foreground ,blue-3
	      :background ,blue-0
	      :bold t))))
  `(org-mode-line-clock-overrun
    ((,class (
	      :foreground ,white-0
	      :background ,red-1
	      :bold t))))
  `(org-verbatim
    ((,class (
	      :foreground ,blue-1
	      :background ,black-3
	      :bold nil))))

  ;; outline
  `(outline-1
    ((,class (
	      :foreground ,blue-1))))
  `(outline-2
    ((,class (
	      :foreground ,green-2))))
  `(outline-3
    ((,class (
	      :foreground ,orange-2))))
  `(outline-4
    ((,class (
	      :foreground ,cyan-3))))
  `(outline-5
    ((,class (
	      :foreground ,red-1))))
  `(outline-6
    ((,class (
	      :foreground ,purple-2))))
  `(outline-7
    ((,class (
	      :foreground ,magenta-2))))
  `(outline-8
    ((,class (
	      :foreground ,yellow-2))))

  ;; undo-tree
  `(undo-tree-visualizer-default-face
    ((,class (
	      :foreground ,defaultfg))))
  `(undo-tree-visualizer-current-face
    ((,class (
	      :foreground ,green-2
	      :weight bold))))
  `(undo-tree-visualizer-active-branch-face
    ((,class (
	      :foreground ,red-2))))
  `(undo-tree-visualizer-register-face
    ((,class (
	      :foreground ,yellow-2))))

  ;; Markdown-mode
  `(markdown-blockquote-face
    ((,class (
	      :foreground ,orange-2
	      :background ,black-3
	      :italic t))))
  `(markdown-bold-face
    ((,class (
	      :foreground ,defaultfg
	      :bold t))))
  `(markdown-comment-face
    ((,class (
	      :foreground ,black-2
	      :italic t))))
  `(markdown-header-delimiter-face
    ((,class (
	      :foreground ,green-3
	      :bold t))))
  `(markdown-header-face
    ((,class (
	      :foreground ,green-2
	      :bold t))))
  `(markdown-header-rule-face
    ((,class (
	      :foreground ,green-2
	      :bold t))))
  `(markdown-header-face-1
    ((,class (
	      :foreground ,green-2
	      :bold t))))
  `(markdown-header-face-2
    ((,class (
	      :foreground ,green-2
	      :bold t))))
  `(markdown-header-face-3
    ((,class (
	      :foreground ,green-2
	      :bold t))))
  `(markdown-header-face-4
    ((,class (
	      :foreground ,green-2
	      :bold t))))
  `(markdown-header-face-5
    ((,class (
	      :foreground ,green-2
	      :bold t))))
  `(markdown-header-face-6
    ((,class (
	      :foreground ,green-2
	      :bold t))))
  `(markdown-link-face
    ((,class (
	      :foreground ,magenta-1
	      :underline t))))
  `(markdown-inline-code-face
    ((,class (
	      :foreground ,blue-1
	      :background ,black-3))))
  `(markdown-italic-face
    ((,class (
	      :foreground ,defaultfg
	      :italic t
	      :underline ,defaultfg))))
  `(markdown-list-face
    ((,class (
	      :foreground ,green-2
	      :background ,defaultbg
	      :bold t))))
  `(markdown-math-face
    ((,class (
	      :foreground ,magenta-1))))
  `(markdown-missing-link-face
    ((,class (
	      :foreground ,red-1
	      :bold t))))
  `(markdown-pre-face
    ((,class (
	      :foreground ,blue-1))))
  `(markdown-reference-face
    ((,class (
	      :foreground ,orange-2
	      :italic t))))
  `(markdown-url-face
    ((,class (
	      :foreground ,magenta-3
	      :underline ,magenta-3))))

  ;; Twittering-mode
  `(twittering-username-face
    ((,class (
	      :foreground ,blue-1
	      :background ,black-4
	      :bold t
	      :underline t))))
  `(twittering-uri-face
    ((,class (
	      :foreground ,blue-1
	      :underline t))))
  `(twittering-timeline-footer-face
    ((,class (
	      :foreground ,white-3))))
  `(twittering-timeline-header-face
    ((,class (
	      :foreground ,white-3))))

  ;; Jabber
  `(jabber-activity-face
    ((,class (
	      :foreground ,magenta-2))))
  `(jabber-activity-personal-face
    ((,class (
	      :foreground ,cyan-3))))
  `(jabber-chat-error
    ((,class (
	      :foreground ,red-00
	      :background ,red-2))))
  `(jabber-chat-prompt-foreign
    ((,class (
	      :foreground ,orange-2))))
  `(jabber-chat-prompt-local
    ((,class (
	      :foreground ,blue-1))))
  `(jabber-chat-prompt-system
    ((,class (
	      :foreground ,yellow-2
	      :weight bold))))
  `(jabber-chat-text-foreign
    ((,class (
	      :foreground ,white-0))))
  `(jabber-chat-text-local
    ((,class (
	      :foreground ,white-3))))
  `(jabber-rare-time-face
    ((,class (
	      :foreground ,black-1))))
  `(jabber-roster-user-away
    ((,class (
	      :foreground ,orange-2))))
  `(jabber-roster-user-chatty
    ((,class (
	      :foreground ,purple-1))))
  `(jabber-roster-user-dnd
    ((,class (
	      :foreground ,red-1))))
  `(jabber-roster-user-error
    ((,class (
	      :foreground ,red-00
	      :background ,red-3))))
  `(jabber-roster-user-offline
    ((,class (
	      :foreground ,black-1))))
  `(jabber-roster-user-online
    ((,class (
	      :foreground ,green-2))))
  `(jabber-roster-user-xa
    ((,class (
	      :foreground ,black-1))))

  ;; popup
  `(popup-face
    ((,class (
	      :background ,black-3
	      :foreground ,blue-1))))
  `(popup-isearch-match
    ((,class (
	      :background ,black-3
	      :foreground ,magenta-2
	      :bold t))))
  `(popup-menu-face
    ((,class (
	      :background ,black-3
	      :foreground ,blue-1))))
  `(popup-menu-mouse-face
    ((,class (
	      :background ,green-0
	      :foreground ,black-4))))
  `(popup-menu-selection-face
    ((,class (
	      :background ,blue-3
	      :foreground ,blue-0))))
  `(popup-menu-summary-face
    ((,class (
	      :background ,black-3
	      :foreground ,blue-1))))
  `(popup-scroll-bar-background-face
    ((,class (
	      :background ,black-3
	      :foreground ,black-3))))
  `(popup-scroll-bar-foreground-face
    ((,class (
	      :background ,black-2
	      :foreground ,white-3))))
  `(popup-summary-face
    ((,class (
	      :background ,black-3
	      :foreground ,blue-1))))
  `(popup-tip-face
    ((,class (
	      :background ,black-2-5
	      :foreground ,defaultfg
	      :stipple nil))))

  ;; company
  `(company-echo
    ((,class (
	      :background nil
	      :foreground ,defaultfg))))
  `(company-echo-common
    ((,class (
	      :background ,black-3
	      :foreground ,red-1))))
  `(company-preview
    ((,class (
	      :background ,defaultbg
	      :foreground ,magenta-2))))
  `(company-preview-common
    ((,class (
	      :background ,defaultbg
	      :foreground ,magenta-2))))
  `(company-preview-search
    ((,class (
	      :background ,black-4
	      :foreground ,magenta-2
	      :bold t))))
  `(company-scrollbar-bg
    ((,class (
	      :background ,black-3))))
  `(company-scrollbar-fg
    ((,class (
	      :background ,white-3))))
  `(company-template-field
    ((,class (
	      :background ,yellow-00
	      :foreground ,black-4))))
  `(company-tooltip
    ((,class (
	      :background ,black-3
	      :foreground ,blue-1))))
  `(company-tooltip-annotation
    ((,class (
	      :background ,black-4
	      :foreground ,red-1))))
  `(company-tooltip-common
    ((,class (
	      :background ,black-2-5
	      :foreground ,blue-0))))
  `(company-tooltip-common-selection
    ((,class (
	      :background ,blue-3
	      :foreground ,blue-0
	      :bold t))))
  `(company-tooltip-mouse
    ((,class (
	      :background ,green-0
	      :foreground ,defaultbg))))
  `(company-tooltip-selection
    ((,class (
	      :background ,blue-3
	      :foreground ,blue-0))))

  ;; Button and link faces
  `(link
    ((,class (
	      :underline t
	      :foreground ,blue-1))))
  `(link-visited
    ((,class (
	      :underline t
	      :foreground ,blue-2))))

  ;; Gnus
  `(gnus-button
    ((,class (
	      :weight normal
	      :foreground ,blue-1
	      :underline t))))
  `(gnus-cite-1
    ((,class (
	      :foreground ,blue-1
	      :background ,black-4
	      :slant italic))))
  `(gnus-cite-10
    ((,class (
	      :foreground ,magenta-1
	      :background ,black-4
	      :slant italic))))
  `(gnus-cite-11
    ((,class (
	      :foreground ,cyan-3
	      :background ,black-4
	      :slant italic))))
  `(gnus-cite-2
    ((,class (
	      :foreground ,green-2
	      :background ,black-4
	      :slant italic))))
  `(gnus-cite-3
    ((,class (
	      :foreground ,magenta-2
	      :background ,black-4
	      :slant italic))))
  `(gnus-cite-4
    ((,class (
	      :foreground ,cyan-3
	      :background ,black-4
	      :slant italic))))
  `(gnus-cite-5
    ((,class (
	      :foreground ,red-0
	      :background ,black-4
	      :slant italic))))
  `(gnus-cite-6
    ((,class (
	      :foreground ,purple-1
	      :background ,black-4
	      :slant italic))))
  `(gnus-cite-7
    ((,class (
	      :foreground ,orange-2
	      :background ,black-4
	      :slant italic))))
  `(gnus-cite-8
    ((,class (
	      :foreground ,blue-1
	      :background ,black-4
	      :slant italic))))
  `(gnus-cite-9
    ((,class (
	      :foreground ,green-2
	      :background ,black-4
	      :slant italic))))
  `(gnus-emphasis-highlight-words
    ((,class (
	      :foreground ,red-3
	      :background ,red-00
	      :bold t))))
  `(gnus-group-mail-1
    ((,class (
	      :foreground ,blue-1))))
  `(gnus-group-mail-1-empty
    ((,class (
	      :foreground ,black-2))))
  `(gnus-group-mail-1-low
    ((,class (
	      :foreground ,blue-2))))
  `(gnus-group-mail-2
    ((,class (
	      :foreground ,orange-2))))
  `(gnus-group-mail-2-empty
    ((,class (
	      :foreground ,black-2))))
  `(gnus-group-mail-2-low
    ((,class (
	      :foreground ,orange-3))))
  `(gnus-group-mail-3
    ((,class (
	      :foreground ,magenta-2))))
  `(gnus-group-mail-3-empty
    ((,class (
	      :foreground ,black-2))))
  `(gnus-group-mail-3-low
    ((,class (
	      :foreground ,magenta-3))))
  `(gnus-group-mail-low
    ((,class (
	      :foreground ,yellow-3))))
  `(gnus-group-mail-low-empty
    ((,class (
	      :foreground ,black-2))))
  `(gnus-group-news-1
    ((,class (
	      :foreground ,blue-1))))
  `(gnus-group-news-1-empty
    ((,class (
	      :foreground ,black-2))))
  `(gnus-group-news-1-low
    ((,class (
	      :foreground ,blue-2))))
  `(gnus-group-news-2
    ((,class (
	      :foreground ,orange-2))))
  `(gnus-group-news-2-empty
    ((,class (
	      :foreground ,black-2))))
  `(gnus-group-news-2-low
    ((,class (
	      :foreground ,orange-3))))
  `(gnus-group-news-3
    ((,class (
	      :foreground ,magenta-2))))
  `(gnus-group-news-3-empty
    ((,class (
	      :foreground ,black-2))))
  `(gnus-group-news-3-low
    ((,class (
	      :foreground ,magenta-3))))
  `(gnus-group-news-4
    ((,class (
	      :foreground ,purple-2))))
  `(gnus-group-news-4-empty
    ((,class (
	      :foreground ,black-2))))
  `(gnus-group-news-4-low
    ((,class (
	      :foreground ,purple-3))))
  `(gnus-group-news-5
    ((,class (
	      :foreground ,cyan-3))))
  `(gnus-group-news-5-empty
    ((,class (
	      :foreground ,black-2))))
  `(gnus-group-news-5-low
    ((,class (
	      :foreground ,cyan-4))))
  `(gnus-group-news-6
    ((,class (
	      :foreground ,green-1))))
  `(gnus-group-news-6-empty
    ((,class (
	      :foreground ,black-2))))
  `(gnus-group-news-6-low
    ((,class (
	      :foreground ,green-3))))
  `(gnus-group-news-low
    ((,class (
	      :foreground ,yellow-3))))
  `(gnus-group-news-low-empty
    ((,class (
	      :foreground ,black-2))))
  `(gnus-header-content
    ((,class (
	      :foreground ,magenta-1 ))))
  `(gnus-header-from
    ((,class (
	      :foreground ,blue-1
	      :underline t))))
  `(gnus-header-name
    ((,class (
	      :foreground ,black-1))))
  `(gnus-header-newsgroups
    ((,class (
	      :foreground ,magenta-2))))
  `(gnus-header-subject
    ((,class (
	      :foreground ,white-0
	      :bold t))))
  `(gnus-server-agent
    ((,class (
	      :foreground ,black-2))))
  `(gnus-server-closed
    ((,class (
	      :foreground ,black-2))))
  `(gnus-server-denied
    ((,class (
	      :foreground ,black-2))))
  `(gnus-server-offline
    ((,class (
	      :foreground ,black-2))))
  `(gnus-server-opened
    ((,class (
	      :foreground ,black-2))))
  `(gnus-signature
    ((,class (
	      :slant italic
	      :foreground ,black-2))))
  `(gnus-splash
    ((,class (
	      :foreground ,black-1))))
  `(gnus-summary-cancelled
    ((,class (
	      :foreground ,black-2
	      :background ,defaultbg))))
  `(gnus-summary-high-ancient
    ((,class (
	      :bold t
	      :foreground ,red-3
	      :background nil))))
  `(gnus-summary-high-read
    ((,class (
	      :bold t
	      :foreground ,defaultfg))))
  `(gnus-summary-high-ticked
    ((,class (
	      :slant italic
	      :bold t
	      :foreground ,red-2
	      :background nil))))
  `(gnus-summary-high-undownloaded
    ((,class (
	      :slant italic
	      :foreground ,red-2
	      :background nil))))
  `(gnus-summary-high-unread
    ((,class (
	      :bold t
	      :foreground ,red-0))))
  `(gnus-summary-low-ancient
    ((,class (
	      :foreground ,green-3))))
  `(gnus-summary-low-read
    ((,class (
	      :foreground ,defaultfg))))
  `(gnus-summary-low-ticked
    ((,class (
	      :slant italic
	      :foreground ,green-1))))
  `(gnus-summary-low-undownloaded
    ((,class (
	      :slant italic
	      :foreground ,green-2))))
  `(gnus-summary-low-unread
    ((,class (
	      :slant italic
	      :foreground ,green-0))))
  `(gnus-summary-normal-ancient
    ((,class (
	      :foreground ,blue-2))))
  `(gnus-summary-normal-read
    ((,class (
	      :foreground ,defaultfg))))
  `(gnus-summary-normal-ticked
    ((,class (
	      :slant italic
	      :foreground ,blue-1))))
  `(gnus-summary-normal-undownloaded
    ((,class (
	      :slant italic
	      :foreground ,blue-1))))
  `(gnus-summary-normal-unread
    ((,class (
	      :foreground ,blue-0
	      :bold t))))
  `(gnus-summary-selected
    ((,class (
	      :background ,green-0
	      :foreground ,green-5))))

  ;; Helm
  `(helm-bookmark-directory
    ((,class (
	      :foreground ,blue-1
	      :background ,defaultbg
	      :bold t))))
  `(helm-bookmark-file
    ((,class (
	      :foreground ,yellow-4
	      :background ,yellow-0))))
  `(helm-bookmark-info
    ((,class (
	      :foreground ,green-4
	      :background ,green-0))))
  `(helm-buffer-directory
    ((,class (
	      :foreground ,blue-1
	      :bold t))))
  `(helm-buffer-process
    ((,class (
	      :foreground ,magenta-2))))
  `(helm-buffer-saved-out
    ((,class (
	      :foreground ,red-2
	      :background ,defaultbg))))
  `(helm-buffer-size
    ((,class (
	      :foreground ,orange-2))))
  `(helm-candidate-number
    ((,class (
	      :foreground ,blue-3
	      :background ,white-0))))
  `(helm-ff-directory
    ((,class (
	      :foreground ,blue-1
	      :background ,defaultbg
	      :bold t))))
  `(helm-ff-excutable
    ((,class (
	      :foreground ,green-1
	      :background ,defaultbg
	      :bold t))))
  `(helm-ff-file
    ((,class (
	      :foreground ,defaultfg
	      :background ,defaultbg))))
  `(helm-ff-invalid-symlink
    ((,class (
	      :foreground ,defaultfg
	      :background ,red-2))))
  `(helm-ff-prefix
    ((,class (
	      :foreground ,defaultfg
	      :background ,orange-2))))
  `(helm-grep-cmd-line
    ((,class (
	      :foreground ,green-4
	      :background ,green-00
	      :bold t))))
  `(helm-grep-file
    ((,class (
	      :foreground ,purple-1))))
  `(helm-grep-finish
    ((,class (
	      :foreground ,green-2))))
  `(helm-grep-lineno
    ((,class (
	      :foreground ,orange-2))))
  `(helm-grep-match
    ((,class (
	      :background ,black-4
	      :foreground ,yellow-1
	      :bold t))))
  `(helm-grep-running
    ((,class (
	      :foreground ,red-0
	      :background nil))))
  `(helm-header
    ((,class (
	      :foreground ,blue-3
	      :background ,blue-0))))
  `(helm-lisp-show-completion
    ((,class (
	      :foreground ,black-3
	      :background ,green-0))))
  `(helm-match
    ((,class (
	      :foreground ,green-2
	      :background ,defaultbg
	      :bold t))))
  `(helm-selection
    ((,class (
	      :foreground nil
	      :background ,blue-3))))
  `(helm-selection-line
    ((,class (
	      :foreground nil
	      :background ,yellow-4))))
  `(helm-source-header
    ((,class (
	      :foreground ,white-0
	      :background ,black-2-5
	      :bold t))))
  `(helm-visible-mark
    ((,class (
	      :foreground ,magenta-2
	      :background ,magenta-0))))

  ;; Dired/Dired+
  `(dired-directory
    ((,class (
	      :foreground ,blue-1
	      :bold t))))
  `(dired-flagged
    ((,class (
	      :foreground ,red-1))))
  `(dired-header
    ((,class (
	      :foreground ,defaultbg
	      :background ,green-2
	      :bold t))))
  `(dired-ignored
    ((,class (
	      :foreground ,black-1))))
  `(dired-mark
    ((,class (
	      :foreground ,green-1))))
  `(dired-marked
    ((,class (
	      :foreground ,green-2))))
  `(dired-perm-write
    ((,class (
	      :foreground ,red-2
	      :bold t))))
  `(dired-symlink
    ((,class (
	      :foreground ,magenta-2))))
  `(dired-warning
    ((,class (
	      :foreground ,defaultfg
	      :background ,red-3
	      :bold t))))
  `(diredp-compressed-file-suffix
    ((,class (
	      :foreground ,purple-2))))
  `(diredp-date-time
    ((,class (
	      :foreground ,blue-1
	      :background ,black-4))))
  `(diredp-deletion
    ((,class (
	      :foreground ,defaultfg,
	      :background ,red-3))))
  `(diredp-deletion-file-name
    ((,class (
	      :foreground ,red-2))))
  `(diredp-dir-heading
    ((,class (
	      :foreground ,defaultbg
	      :background ,green-2))))
  `(diredp-dir-priv
    ((,class (
	      :foreground ,blue-1
	      :background ,defaultbg
	      :bold t))))
  `(diredp-display-msg
    ((,class (
	      :foreground ,orange-2))))
  `(diredp-executable-tag
    ((,class (
	      :foreground ,green-2))))
  `(diredp-file-name
    ((,class (
	      :foreground ,defaultfg))))
  `(diredp-file-suffix
    ((,class (
	      :foreground ,orange-2))))
  `(diredp-flag-mark
    ((,class (
	      :foreground ,defaultfg
	      :background ,magenta-3
	      :bold t))))
  `(diredp-flag-mark-line
    ((,class (
	      :foreground ,defaultbg
	      :background ,magenta-1))))
  `(diredp-ignored-file-name
    ((,class (
	      :foreground ,black-2))))
  `(diredp-link-priv
    ((,class (
	      :foreground ,magenta-3))))
  `(diredp-mode-line-flagged
    ((,class (
	      :foreground ,defaultbg
	      :background ,green-2))))
  `(diredp-mode-line-marked
    ((,class (
	      :foreground ,defaultfg
	      :background ,magenta-3 bold t))))
  `(diredp-no-priv
    ((,class (
	      :foreground ,defaultfg
	      :background ,black-4))))
  `(diredp-number
    ((,class (
	      :foreground ,yellow-1))))
  `(diredp-other-priv
    ((,class (
	      :foreground ,defaultfg
	      :background ,blue-3))))
  `(diredp-rare-priv
    ((,class (
	      :foreground ,defaultfg
	      :background ,purple-2))))
  `(diredp-symlink
    ((,class (
	      :foreground ,magenta-3))))
  `(diredp-read-priv
    ((,class (
	      :foreground ,green-4
	      :background ,green-0))))
  `(diredp-write-priv
    ((,class (
	      :foreground ,blue-5
	      :background ,blue-0))))
  `(diredp-exec-priv
    ((,class (
	      :foreground ,red-3
	      :background ,orange-0))))

  ;; Magit >= 2.1.0
  `(magit-bisect-bad
    ((,class (
	      :foreground ,red-3
	      :background ,red-00))))
  `(magit-bisect-good
    ((,class (
	      :foreground ,green-4
	      :background ,green-0))))
  `(magit-bisect-skip
    ((,class (
	      :foreground ,yellow-4
	      :background ,orange-00))))
  `(magit-blame-date
    ((,class (
	      :foreground ,orange-2
	      :background ,black-3))))
  `(magit-blame-hash
    ((,class (
	      :foreground ,orange-2
	      :background ,black-3))))
  `(magit-blame-heading
    ((,class (
	      :foreground ,defaultfg
	      :background ,black-3))))
  `(magit-blame-name
    ((,class (
	      :foreground ,green-1
	      :background ,black-3))))
  `(magit-blame-summary
    ((,class (
	      :foreground ,defaultfg
	      :background ,black-3))))
  `(magit-branch-current
    ((,class (
	      :foreground ,white-0
	      :background ,orange-2
	      :bold t
	      :underline nil))))
  `(magit-branch-local
    ((,class (
	      :foreground ,green-4
	      :background ,green-00
	      :bold t
	      :underline t))))
  `(magit-branch-remote
    ((,class (
	      :foreground ,blue-3
	      :background ,blue-0
	      :bold t
	      :underline t))))
  `(magit-cherry-equivalent
    ((,class (
	      :foreground ,purple-2))))
  `(magit-cherry-unmatched
    ((,class (
	      :foreground ,cyan-4))))
  `(magit-diff-added
    ((,class (
	      :foreground ,green-0
	      :background nil
	      :bold t))))
  `(magit-diff-added-highlight
    ((,class (
	      :foreground ,green-0
	      :bold t
	      :inherit (magit-section-highlight)))))
  `(magit-diff-base
    ((,class (
	      :foreground ,yellow-1
	      :background nil))))
  `(magit-diff-base-highlight
    ((,class (
	      :foreground ,yellow-1
	      :bold t
	      :inherit (magit-section-highlight)))))
  `(magit-diff-conflict-heading
    ((,class (
	      :foreground ,white-0
	      :background ,orange-2))))
  `(magit-diff-context
    ((,class (
	      :foreground ,defaultfg
	      :background nil))))
  `(magit-diff-context-highlight
    ((,class (
	      :foreground ,defaultfg
	      :inherit (magit-section-highlight)))))
  `(magit-diff-file-heading
    ((,class (
	      :foreground ,white-0
	      :bold t))))
  `(magit-diff-file-heading-highlight
    ((,class (
	      :background ,blue-3
	      :bold t))))
  `(magit-diff-file-heading-selection
    ((,class (
	      :foreground ,white-0
	      :background ,black-2
	      :bold t))))
  `(magit-diff-hunk-heading
    ((,class (
	      :foreground ,black-2
	      :background ,black-3
	      :bold t))))
  `(magit-diff-hunk-heading-highlight
    ((,class (
	      :foreground ,black-4
	      :background ,blue-01))))
  `(magit-diff-hunk-heading-selection
    ((,class (
	      :foreground ,defaultfg
	      :background ,defaultfg))))
  `(magit-diff-lines-boundary
    ((,class (
	      :foreground ,defaultfg
	      :background ,red-0))))
  `(magit-diff-lines-heading
    ((,class (
	      :foreground ,defaultfg
	      :background ,red-0))))
  `(magit-diff-our
    ((,class (
	      :foreground ,magenta-3))))
  `(magit-diff-our-highlight
    ((,class (
	      :foreground ,magenta-3
	      :background ,magenta-00))))
  `(magit-diff-removed
    ((,class (
	      :foreground ,red-0
	      :background nil
	      :bold t))))
  `(magit-diff-removed-highlight
    ((,class (
	      :foreground ,red-0
	      :bold t
	      :inherit (magit-section-highlight)))))
  `(magit-diff-their
    ((,class (
	      :foreground ,cyan-4))))	;
  `(magit-diff-their-highlight
    ((,class (
	      :foreground ,cyan-6
	      :background ,cyan-1))))
  `(magit-diff-whitespace-warning
    ((,class (
	      :foreground ,red-3
	      :background ,red-3))))
  `(magit-diffstat-added
    ((,class (
	      :foreground ,green-3
	      :background ,green-0
	      :bold t))))
  `(magit-diffstat-removed
    ((,class (
	      :foreground ,red-3
	      :background ,red-0
	      :bold t))))
  `(magit-dimmed
    ((,class (
	      :foreground ,black-2))))
  `(magit-filename
    ((,class (
	      :foreground ,blue-1))))
  `(magit-hash
    ((,class (
	      :foreground ,orange-2
	      :background nil))))
  `(magit-head
    ((,class (
	      :foreground ,orange-4
	      :background ,orange-000))))
  `(magit-header-line
    ((,class (
	      :foreground ,orange-2))))
  `(magit-log-author
    ((,class (
	      :foreground ,green-2
	      :background nil))))
  `(magit-log-date
    ((,class (
	      :foreground ,black-2
	      :background nil))))
  `(magit-log-graph
    ((,class (
	      :foreground ,black-2
	      :background nil))))
  `(magit-process-ng
    ((,class (
	      :foreground ,red-3
	      :background ,red-00
	      :underline t))))
  `(magit-process-ok
    ((,class (
	      :foreground ,green-3
	      :background ,green-00
	      :underline t))))
  `(magit-reflog-amend
    ((,class (
	      :foreground ,magenta-3
	      :background ,magenta-00))))
  `(magit-reflog-checkout
    ((,class (
	      :foreground ,green-3
	      :background ,green-00))))
  `(magit-reflog-cherry-pick
    ((,class (
	      :foreground ,orange-4
	      :background ,orange-00))))
  `(magit-reflog-commit
    ((,class (
	      :foreground ,yellow-4
	      :background ,yellow-0))))
  `(magit-reflog-merge
    ((,class (
	      :foreground ,purple-4
	      :background ,purple-00))))
  `(magit-reflog-other
    ((,class (
	      :foreground ,white-0
	      :background ,black-3))))
  `(magit-reflog-rebase
    ((,class (
	      :foreground ,cyan-6
	      :background ,cyan-2))))
  `(magit-reflog-remote
    ((,class (
	      :foreground ,blue-4
	      :background ,blue-0))))
  `(magit-reflog-reset
    ((,class (
	      :foreground ,red-3
	      :background ,red-00))))
  `(magit-section-heading
    ((,class (
	      :foreground ,orange-3
	      :background nil
	      :bold t
	      :underline t))))
  `(magit-section-heading-selection
    ((,class (
	      :background ,blue-0))))
  `(magit-section-highlight
    ((,class (
	      :background ,black-3))))
  `(magit-sequence-done
    ((,class (
	      :foreground ,green-3))))
  `(magit-sequence-drop
    ((,class (
	      :foreground ,orange-2))))
  `(magit-sequence-head
    ((,class (
	      :foreground ,blue-2))))
  `(magit-sequence-onto
    ((,class (
	      :foreground ,purple-2))))
  `(magit-sequence-part
    ((,class (
	      :foreground ,cyan-4))))
  `(magit-sequence-pick
    ((,class (
	      :foreground ,magenta-2))))
  `(magit-sequence-stop
    ((,class (
	      :foreground ,red-3))))
  `(magit-signature-bad
    ((,class (
	      :foreground ,red-2))))
  `(magit-signature-good
    ((,class (
	      :foreground ,green-3))))
  `(magit-signature-untrusted
    ((,class (
	      :foreground ,yellow-3))))
  `(magit-tag
    ((,class (
	      :foreground ,blue-3
	      :background ,blue-0))))
  `(magit-valid-signature
    ((,class (
	      :foreground ,cyan-4
	      :background ,LIGHT_BG
	      :bold t))))
  `(magit-whitespace-warning-face
    ((,class (
	      :foreground ,white-0
	      :background ,red-2
	      :bold t))))

  ;; Magit
  `(magit-branch
    ((,class (
	      :foreground ,green-4
	      :background ,green-01
	      :bold t
	      :underline t))))
  `(magit-diff-add
    ((,class (
	      :foreground ,green-0
	      :background nil
	      :bold t))))
  `(magit-diff-del
    ((,class (
	      :foreground ,red-0
	      :background nil
	      :bold t))))
  `(magit-diff-file-header
    ((,class (
	      :foreground ,white-0
	      :background ,black-2
	      :bold t))))
  `(magit-diff-hunk-header
    ((,class (
	      :foreground ,defaultfg
	      :background ,black-2-5
	      :bold t))))
  `(magit-diff-merge-current
    ((,class (
	      :foreground ,purple-1))))
  `(magit-diff-merge-diff3-separator
    ((,class (
	      :foreground ,purple-1))))
  `(magit-diff-merge-proposed
    ((,class (
	      :foreground ,purple-1))))
  `(magit-diff-merge-separator
    ((,class (
	      :foreground ,purple-1))))
  `(magit-diff-none
    ((,class (
	      :foreground ,black-2))))
  `(magit-header
    ((,class (
	      :foreground ,blue-2
	      :background ,white-0
	      :underline ,blue-2))))
  `(magit-item-highlight
    ((,class (
	      :background "#444444"
	      :foreground ,white-0))))
  `(magit-item-mark
    ((,class (
	      :foreground ,white-0
	      :background ,blue-3))))
  `(magit-log-author
    ((,class (
	      :foreground ,green-0
	      :background ,black-4))))
  `(magit-log-author-date-cutoff
    ((,class (
	      :foreground ,red-1
	      :bold t))))
  `(magit-log-date
    ((,class (
	      :foreground ,defaultfg
	      :background ,black-4))))
  `(magit-log-graph
    ((,class (
	      :foreground ,defaultfg
	      :background ,black-4))))
  `(magit-log-head-label-bisect-bad
    ((,class (
	      :foreground ,red-3
	      :background ,red-00))))
  `(magit-log-head-label-bisect-good
    ((,class (
	      :foreground ,green-4
	      :background ,green-0))))
  `(magit-log-head-label-bisect-skip
    ((,class (
	      :foreground ,yellow-3
	      :background ,orange-00))))
  `(magit-log-head-label-default
    ((,class (
	      :foreground ,green-4
	      :background ,green-2
	      :bold t
	      :underline t))))
  `(magit-log-head-label-head
    ((,class (
	      :foreground ,green-4
	      :background ,green-01
	      :bold t
	      :underline t))))
  `(magit-log-head-label-local
    ((,class (
	      :foreground ,green-4
	      :background ,green-00
	      :bold t
	      :underline t))))
  `(magit-log-head-label-patches
    ((,class (
	      :foreground ,orange-4
	      :background ,orange-0
	      :bold t
	      :underline t))))
  `(magit-log-head-label-remote
    ((,class (
	      :foreground ,blue-4
	      :background ,blue-0
	      :bold t
	      :underline t))))
  `(magit-log-head-label-tags
    ((,class (
	      :foreground ,yellow-4
	      :background ,yellow-00
	      :bold t
	      :underline t))))
  `(magit-log-head-label-wip
    ((,class (
	      :foreground ,defaultfg
	      :background ,black-2))))
  `(magit-log-message
    ((,class (
	      :foreground ,defaultfg
	      :background nil))))
  `(magit-log-reflog-label-amend
    ((,class (
	      :foreground ,magenta-3
	      :background ,magenta-0))))
  `(magit-log-reflog-label-checkout
    ((,class (
	      :foreground ,green-4
	      :background ,green-00))))
  `(magit-log-reflog-label-cherry-pick
    ((,class (
	      :foreground ,orange-4
	      :background ,orange-00))))
  `(magit-log-reflog-label-commit
    ((,class (
	      :foreground ,yellow-4
	      :background ,yellow-0))))
  `(magit-log-reflog-label-merge
    ((,class (
	      :foreground ,purple-4
	      :background ,purple-0))))
  `(magit-log-reflog-label-other
    ((,class (
	      :foreground ,white-0
	      :background ,black-3))))
  `(magit-log-reflog-label-rebase
    ((,class (
	      :foreground ,cyan-6
	      :background ,cyan-2))))
  `(magit-log-reflog-label-remote
    ((,class (
	      :foreground ,blue-4
	      :background ,blue-0))))
  `(magit-log-reflog-label-reset
    ((,class (
	      :foreground ,red-3
	      :background ,red-00))))
  `(magit-log-sha1
    ((,class (
	      :foreground ,orange-2
	      :background ,black-4))))
  `(magit-process-ng
    ((,class (
	      :foreground ,red-3
	      :background ,red-00
	      :underline t
	      :bold t))))
  `(magit-process-ok
    ((,class (
	      :foreground ,green-4
	      :background ,green-00
	      :underline t
	      :bold t))))
  `(magit-section-title
    ((,class (
	      :foreground ,orange-2
	      :background ,defaultbg
	      :underline t
	      :bold ,t))))
  `(magit-signature-bad
    ((,class (
	      :foreground ,red-1))))
  `(magit-signature-good
    ((,class (
	      :foreground ,green-1))))
  `(magit-signature-none
    ((,class (
	      :foreground ,defaultfg))))
  `(magit-signature-untrusted
    ((,class (
	      :foreground ,cyan-3))))
  `(magit-tag
    ((,class (
	      :foreground ,blue-3
	      :background ,blue-0))))
  `(magit-valid-signature
    ((,class (
	      :foreground ,cyan-3
	      :background ,defaultbg
	      :bold t))))
  `(magit-whitespace-warning-face
    ((,class (
	      :foreground ,white-0
	      :background ,red-3
	      :bold t))))

  ;; git-commit-mode
  `(git-commit-branch-face
    ((,class (
	      :foreground ,blue-4
	      :background ,white-0
	      :bold t
	      :underline t))))
  `(git-commit-comment-action-face
    ((,class (
	      :foreground ,orange-2
	      :background ,defaultbg
	      :underline t))))
  `(git-commit-comment-file-face
    ((,class (
	      :foreground ,magenta-2))))
  `(git-commit-comment-heading-face
    ((,class (
	      :foreground ,green-01
	      :background ,black-3
	      :bold t))))
  `(git-commit-known-pseudo-header-face
    ((,class (
	      :foreground ,green-1))))
  `(git-commit-no-branch-face
    ((,class (
	      :foreground ,orange-3))))
  `(git-commit-nonempty-second-line-face
    ((,class (
	      :foreground ,red-2))))
  `(git-commit-note-face
    ((,class (
	      :foreground ,cyan-3))))
  `(git-commit-overlong-summary-face
    ((,class (
	      :foreground ,red-2))))
  `(git-commit-pseudo-header-face
    ((,class (
	      :foreground ,magenta-3))))
  `(git-commit-summary-face
    ((,class (
	      :foreground ,blue-1))))
  `(git-rebase-description-face
    ((,class (
	      :foreground ,black-3))))
  `(git-rebase-killed-action-face
    ((,class (
	      :foreground ,black-3))))

  ;; Message faces
  `(message-cited-text
    ((,class (
	      :foreground ,green-1))))
  `(message-header-cc
    ((,class (
	      :foreground ,blue-0))))
  `(message-header-name
    ((,class (
	      :foreground ,white-3))))
  `(message-header-newsgroups
    ((,class (
	      :foreground ,blue-1
	      :bold t))))
  `(message-header-other
    ((,class (
	      :foreground ,magenta-1))))
  `(message-header-subject
    ((,class (
	      :foreground ,white-0
	      :bold t))))
  `(message-header-to
    ((,class (
	      :foreground ,blue-1
	      :underline t
	      :bold t))))
  `(message-header-xheader
    ((,class (
	      :foreground ,black-1))))
  `(message-mml
    ((,class (
	      :foreground ,orange-2))))
  `(message-separator
    ((,class (
	      :foreground ,black-2-5))))

  ;; Grep
  `(grep-context-face
    ((,class (
	      :foreground ,red-2))))
  `(grep-error-face
    ((,class (
	      :foreground ,red-1
	      :weight bold
	      :underline t))))
  `(grep-hit-face
    ((,class (
	      :foreground ,green-2))))
  `(grep-match-face
    ((,class (
	      :foreground nil
	      :background nil
	      :inherit match))))

  ;; Diff
  `(diff-added
    ((,class (
	      :foreground ,green-0
	      :background ,black-4
	      :bold t))))
  `(diff-changed
    ((,class (
	      :foreground ,yellow-2
	      :background ,black-4
	      :bold t))))
  `(diff-context
    ((,class (
	      :foreground ,black-2-5))))
  `(diff-file-header
    ((,class (
	      :foreground ,defaultbg
	      :background ,blue-0
	      :bold t))))
  `(diff-function
    ((,class (
	      :foreground ,black-4
	      :background ,defaultfg))))
  `(diff-header
    ((,class (
	      :foreground ,blue-3
	      :background ,blue-0))))
  `(diff-hunk-header
    ((,class (
	      :foreground ,blue-0
	      :background ,black-3
	      :bold t))))
  `(diff-index
    ((,class (
	      :foreground ,black-4
	      :background ,white-3
	      :bold t))))
  `(diff-indicator-added
    ((,class (
	      :foreground ,white-0
	      :background ,green-3
	      :bold t))))
  `(diff-indicator-changed
    ((,class (
	      :foreground ,white-0
	      :background ,yellow-3
	      :bold t))))
  `(diff-indicator-removed
    ((,class (
	      :foreground ,white-0
	      :background ,red-3
	      :bold t))))
  `(diff-nonexistent
    ((,class (
	      :foreground ,white-0
	      :background ,red-3
	      :bold t))))
  `(diff-refine-added
    ((,class (
	      :foreground ,white-0
	      :background ,green-4
	      :bold t))))
  `(diff-refine-change
    ((,class (
	      :foreground ,white-0
	      :background ,yellow-4
	      :bold t))))
  `(diff-refine-removed
    ((,class (
	      :foreground ,white-0
	      :background ,red-3
	      :bold t))))
  `(diff-removed
    ((,class (
	      :foreground ,red-0
	      :background ,black-4
	      :bold t))))

  ;; Ediff
  `(ediff-current-diff-A
    ((,class (
	      :background ,yellow-4))))
  `(ediff-current-diff-Ancestor
    ((,class (
	      :background ,blue-3))))
  `(ediff-current-diff-B
    ((,class (
	      :background ,purple-4))))
  `(ediff-current-diff-C
    ((,class (
	      :background ,orange-5))))
  `(ediff-even-diff-A
    ((,class (
	      :background ,black-3))))
  `(ediff-even-diff-Ancestor
    ((,class (
	      :background ,black-3))))
  `(ediff-even-diff-B
    ((,class (
	      :background ,black-3))))
  `(ediff-even-diff-C
    ((,class (
	      :background ,black-3))))
  `(ediff-fine-diff-A
    ((,class (
	      :foreground nil
	      :background ,green-5
	      :bold t))))
  `(ediff-fine-diff-Ancestor
    ((,class (
	      :foreground nil
	      :background ,green-5
	      :bold t))))
  `(ediff-fine-diff-B
    ((,class (
	      :foreground nil
	      :background ,green-5
	      :bold t))))
  `(ediff-fine-diff-C
    ((,class (
	      :foreground nil
	      :background ,green-5
	      :bold t))))
  `(ediff-odd-diff-A
    ((,class (
	      :background ,red-3))))
  `(ediff-odd-diff-Ancestor
    ((,class (
	      :background ,red-3))))
  `(ediff-odd-diff-B
    ((,class (
	      :background ,red-3))))
  `(ediff-odd-diff-C
    ((,class (
	      :background ,red-3))))

  ;; smerge
  `(smerge-refined-change
    ((,class (
	      :background ,blue-3
	      :foreground ,white-0))))

  ;; Flyspell faces
  `(flyspell-duplicate
    ((,class (
	      :underline t foreground-color,orange-1))))
  `(flyspell-incorrect
    ((,class (
	      :background ,red-1
	      :foreground ,defaultfg
	      :bold t))))

  ;; Semantic faces
  `(semantic-decoration-on-includes
    ((,class (
	      :underline ,black-1))))
  `(semantic-decoration-on-private-members-face

    ((,class (
	      :background ,purple-3))))
  `(semantic-decoration-on-protected-members-face

    ((,class (
	      :background ,magenta-3))))
  `(semantic-decoration-on-unknown-includes

    ((,class (
	      :background ,red-3))))
  `(semantic-decoration-on-unparsed-includes

    ((,class (
	      :background ,black-4))))
  `(semantic-tag-boundary-face
    ((,class (
	      :overline ,blue-1))))
  `(semantic-unmatched-syntax-face
    ((,class (
	      :underline ,red-1))))

  ;; CUA
  `(cua-rectangle
    ((,class (
	      :background ,magenta-3
	      :foreground ,defaultfg))))

  ;; Ace-jump
  `(ace-jump-face-background
    ((,class (
	      :background nil
	      :foreground ,black-2-5))))
  `(ace-jump-face-foreground
    ((,class (
	      :foreground ,orange-2
	      :bold t))))

  ;; avy-mode
  `(avy-lead-face
    ((,class (
	      :background ,cyan-1
	      :foreground ,black-4))))
  `(avy-lead-face-0
    ((,class (
	      :background ,purple-00
	      :foreground ,black-4))))
  `(avy-lead-face-1
    ((,class (
	      :background ,defaultfg
	      :foreground ,black-4))))
  `(avy-lead-face-2
    ((,class (
	      :background ,green-2
	      :foreground ,black-4))))

  ;; Rainbow-delimiters
  `(rainbow-delimiters-depth-1-face ((,class (:foreground "#9a4040" :bold t))))
  `(rainbow-delimiters-depth-2-face ((,class (:foreground "#ff5e5e" :bold t))))
  `(rainbow-delimiters-depth-3-face ((,class (:foreground "#ffaa77" :bold t))))
  `(rainbow-delimiters-depth-4-face ((,class (:foreground "#dddd77" :bold t))))
  `(rainbow-delimiters-depth-5-face ((,class (:foreground "#80ee80" :bold t))))
  `(rainbow-delimiters-depth-6-face ((,class (:foreground "#66bbff" :bold t))))
  `(rainbow-delimiters-depth-7-face ((,class (:foreground "#da6bda" :bold t))))
  `(rainbow-delimiters-depth-8-face ((,class (:foreground "#afafaf" :bold t))))
  `(rainbow-delimiters-depth-9-face ((,class (:foreground "#f0f0f0" :bold t))))
  `(rainbow-delimiters-unmatched-face
    ((,class (
	      :foreground ,white-0
	      :background ,red-3
	      :bold t))))

  ;; EShell
  `(eshell-ls-archive
    ((,class (
	      :foreground ,purple-2))))
  `(eshell-ls-backup
    ((,class (
	      :foreground ,black-3))))
  `(eshell-ls-clutter
    ((,class (
	      :foreground ,black-2))))
  `(eshell-ls-directory
    ((,class (
	      :foreground ,blue-1
	      :bold t))))
  `(eshell-ls-executable
    ((,class (
	      :foreground ,green-2))))
  `(eshell-ls-missing
    ((,class (
	      :foreground ,white-0
	      :background ,red-3))))
  `(eshell-ls-product
    ((,class (
	      :foreground ,white-0
	      :background ,green-2))))
  `(eshell-ls-readonly
    ((,class (
	      :foreground ,orange-3))))
  `(eshell-ls-special
    ((,class (
	      :foreground ,yellow-1))))
  `(eshell-ls-symlink
    ((,class (
	      :foreground ,magenta-2))))
  `(eshell-ls-unreadable
    ((,class (
	      :foreground ,black-2))))
  `(eshell-prompt
    ((,class (
	      :foreground ,white-0
	      :background ,black-2-5
	      :bold t))))

  ;; Comint prompt
  `(comint-highlight-prompt
    ((,class (
	      :foreground ,white-0
	      :background ,black-2-5
	      :bold t))))

  ;; which-function-mode
  `(which-func
    ((,class (
	      :foreground ,white-0
	      :background ,orange-2))))

  ;; Flymake
  `(flymake-warnline
    ((,class (
	      :underline ,orange-2))))
  `(flymake-errline
    ((,class (
	      :underline ,red-2))))

  ;; Flycheck
  `(flycheck-error
    ((,class (
	      :background ,red-2
	      :foreground ,white-0
	      :bold t))))
  `(flycheck-warnline
    ((,class (
	      :background ,orange-2
	      :foreground ,white-0
	      :bold t))))

  ;; Malabar
  `(malabar-error-face
    ((,class (
	      :underline ,red-2))))
  `(malabar-warning-face
    ((,class (
	      :underline ,orange-2))))
  `(malabar-info-face
    ((,class (
	      :underline ,blue-2))))

  ;; MMM-Mode
  `(mmm-cleanup-submode-face
    ((,class (
	      :background ,orange-00))))
  `(mmm-code-submode-face
    ((,class (
	      :background ,blue-00))))
  `(mmm-comment-submode-face
    ((,class (
	      :background ,blue-0))))
  `(mmm-declaration-submode-face
    ((,class (
	      :background ,cyan-1))))
  `(mmm-default-submode-face
    ((,class (
	      :background nil))))
  `(mmm-delimiter-face
    ((,class (
	      :background nil
	      :foreground ,white-0))))
  `(mmm-init-submode-face
    ((,class (
	      :background ,magenta-0))))
  `(mmm-output-submode-face
    ((,class (
	      :background ,purple-00))))
  `(mmm-special-submode-face
    ((,class (
	      :background ,green-00))))

  ;; Clojure/Cider
  `(clojure-test-failure-face
    ((,class (
	      :underline ,orange-2))))
  `(clojure-test-error-face
    ((,class (
	      :underline ,red-2))))
  `(clojure-test-success-face
    ((,class (
	      :underline ,green-3))))
  `(cider-deprecated-face
    ((,class (
	      :background ,red-4))))

  ;; Javascript
  `(js2-function-param-face
    ((,class (
	      :foreground ,green-3))))
  `(js2-external-variable
    ((,class (
	      :foreground ,orange-2
	      :underline t))))
  `(js2-error
    ((,class (
	      :foreground ,red-2
	      :underline t
	      :bold t))))
  `(js2-warning
    ((,class (
	      :foreground nil
	      :underline t
	      :bold t))))

  ;; rcirc
  `(rcirc-bright-nick
    ((,class (
	      :foreground ,blue-1
	      :bold t))))
  `(rcirc-dim-nick
    ((,class (
	      :foreground ,black-2
	      :bold t))))
  `(rcirc-keyword
    ((,class (
	      :foreground ,magenta-2
	      :bold t))))
  `(rcirc-my-nick
    ((,class (
	      :foreground ,green-2
	      :bold t))))
  `(rcirc-nick-in-message
    ((,class (
	      :foreground ,green-3))))
  `(rcirc-nick-in-message-full-line
    ((,class (
	      :foreground ,blue-3))))
  `(rcirc-other-nick
    ((,class (
	      :foreground ,blue-1
	      :bold t))))
  `(rcirc-prompt
    ((,class (
	      :foreground ,black-3
	      :background ,green-01
	      :bold t))))
  `(rcirc-server
    ((,class (
	      :foreground ,black-1))))
  `(rcirc-server-prefix
    ((,class (
	      :foreground ,black-1))))
  `(rcirc-timestamp
    ((,class (
	      :foreground ,orange-2))))
  `(rcirc-track-keyword
    ((,class (
	      :foreground ,magenta-2))))
  `(rcirc-track-nick
    ((,class (
	      :foreground ,blue-1))))
  `(rcirc-url
    ((,class (
	      :foreground ,blue-1
	      :bold nil
	      :underline ,blue-2))))

  ;; ERC
  `(erc-button
    ((,class (
	      :foreground ,blue-1
	      :underline ,blue-1
	      :bold nil))))
  `(erc-current-nick-face
    ((,class (
	      :foreground ,green-1))))
  `(erc-dangerous-hosts
    ((,class (
	      :foreground ,red-2
	      :bold t))))
  `(erc-direct-msg-face
    ((,class (
	      :foreground ,orange-2))))
  `(erc-error-face
    ((,class (
	      :foreground ,red-2))))
  `(erc-header-face
    ((,class (
	      :background ,blue-1))))
  `(erc-input-face
    ((,class (
	      :foreground ,white-0))))
  `(erc-keyword-face
    ((,class (
	      :foreground ,magenta-2
	      :bold t))))
  `(erc-my-nick-face
    ((,class (
	      :foreground ,green-1
	      :bold t))))
  `(erc-nick-default-face
    ((,class (
	      :bold t
	      :foreground ,blue-1))))
  `(erc-nick-msg-face
    ((,class (
	      :weight normal
	      :foreground ,orange-2))))
  `(erc-notice-face
    ((,class (
	      :foreground ,black-2))))
  `(erc-pal-face
    ((,class (
	      :foreground ,purple-1))))
  `(erc-prompt-face
    ((,class (
	      :bold t
	      :foreground ,green-01
	      :background ,black-2-5))))
  `(erc-timestamp-face
    ((,class (
	      :foreground ,orange-2))))

  ;; ReStructuredText
  `(rst-level-1-face
    ((,class (
	      :foreground ,orange-2
	      :background ,defaultbg
	      :bold t))))
  `(rst-level-2-face
    ((,class (
	      :foreground ,orange-2
	      :background ,defaultbg
	      :bold t))))
  `(rst-level-3-face
    ((,class (
	      :foreground ,orange-2
	      :background ,defaultbg
	      :bold t))))
  `(rst-level-4-face
    ((,class (
	      :foreground ,orange-2
	      :background ,defaultbg
	      :bold t))))
  `(rst-level-5-face
    ((,class (
	      :foreground ,orange-2
	      :background ,defaultbg
	      :bold t))))
  `(rst-level-6-face
    ((,class (
	      :foreground ,orange-2
	      :background ,defaultbg
	      :bold t))))
  `(rst-level-1
    ((,class (
	      :foreground ,orange-2
	      :background ,defaultbg
	      :bold t))))
  `(rst-level-2
    ((,class (
	      :foreground ,orange-2
	      :background ,defaultbg
	      :bold t))))
  `(rst-level-3
    ((,class (
	      :foreground ,orange-2
	      :background ,defaultbg
	      :bold t))))
  `(rst-level-4
    ((,class (
	      :foreground ,orange-2
	      :background ,defaultbg
	      :bold t))))
  `(rst-level-5
    ((,class (
	      :foreground ,orange-2
	      :background ,defaultbg
	      :bold t))))
  `(rst-level-6
    ((,class (
	      :foreground ,orange-2
	      :background ,defaultbg
	      :bold t))))
  `(rst-adornment
    ((,class (
	      :foreground ,orange-2
	      :background ,defaultbg
	      :bold t))))
  `(rst-block
    ((,class (
	      :foreground ,green-1
	      :background ,black-3
	      :bold t))))
  `(rst-comment
    ((,class (
	      :foreground ,red-0
	      :background ,red-3
	      :bold t))))
  `(rst-literal
    ((,class (
	      :foreground ,green-1
	      :background ,black-3))))
  `(rst-reference
    ((,class (
	      :foreground ,magenta-2
	      :background ,defaultbg))))
  `(rst-definition
    ((,class (
	      :foreground ,yellow-1
	      :background ,defaultbg))))
  `(rst-directive
    ((,class (
	      :foreground ,purple-1
	      :background ,black-4
	      :bold t))))
  `(rst-external
    ((,class (
	      :foreground ,blue-1
	      :background ,defaultbg))))
  `(rst-transition
    ((,class (
	      :foreground ,green-2
	      :background ,black-4
	      :bold t))))

  ;; yalinum
  `(yalinum-bar-face
    ((,class (
	      :foreground ,black-2-5
	      :background ,defaultfg))))
  `(yalinum-face
    ((,class (
	      :foreground ,defaultfg
	      :background ,black-2))))
  `(yalinum-track-face
    ((,class (
	      :foreground ,defaultfg
	      :background ,black-2-5))))

  ;; Ruby
  `(enh-ruby-heredoc-delimiter-face
    ((,class (
	      :foreground ,purple-2))))
  `(enh-ruby-op-face
    ((,class (
	      :foreground ,orange-3
	      :bold t))))
  `(enh-ruby-regexp-delimiter-face
    ((,class (
	      :foreground ,purple-2))))
  `(enh-ruby-string-delimiter-face
    ((,class (
	      :foreground ,purple-0))))
  `(erm-syn-errline
    ((,class (
	      :foreground ,red-00
	      :background ,red-3
	      :bold t
	      :underline t))))
  `(erm-syn-warnline
    ((,class (
	      :bold t
	      :underline t))))

  ;; ansi-term
  `(term-color-black
    ((,class (
	      :background ,defaultbg
	      :foreground ,defaultbg))))
  `(term-color-blue
    ((,class (
	      :background ,cyan-3
	      :foreground ,cyan-3))))
  `(term-color-cyan
    ((,class (
	      :background ,cyan-3
	      :foreground ,cyan-3))))
  `(term-color-green
    ((,class (
	      :background ,green-2
	      :foreground ,green-2))))
  `(term-color-magenta
    ((,class (
	      :background ,magenta-3
	      :foreground ,magenta-3))))
  `(term-color-red
    ((,class (
	      :background ,red-1
	      :foreground ,red-1))))
  `(term-color-white
    ((,class (
	      :background ,white-0
	      :foreground ,white-0))))
  `(term-color-yellow
    ((,class (
	      :background ,orange-2
	      :foreground ,orange-2))))

  ;; ido-mode
  `(ido-first-match
    ((,class (
	      :foreground ,orange-2
	      :bold t))))
  `(ido-incomplete-regexp
    ((,class (
	      :foreground ,red-0
	      :bold t))))
  `(ido-indicator
    ((,class (
	      :foreground ,yellow-4
	      :background ,orange-00))))
  `(ido-only-match
    ((,class (
	      :foreground ,green-2
	      :background nil))))
  `(ido-subdir
    ((,class (
	      :foreground ,blue-1
	      :bold t))))
  `(ido-virtual
    ((,class (
	      :foreground ,magenta-3))))

  ;; ivy-mode
  `(ivy-current-match
    ((,class (
	      :foreground ,orange-2
	      :bold t
	      :inherit highlight))))
  `(ivy-confirm-face
    ((,class (
	      :foreground ,green-4
	      :background ,green-00
	      :bold t))))
  `(ivy-subdir
    ((,class (
	      :foreground ,blue-1
	      :bold t))))
  `(ivy-virtual
    ((,class (
	      :foreground ,magenta-3))))

  `(ivy-minibuffer-match-face-1
    ((,class (
	      :background ,blue-1
	      :foreground ,white-0))))
  `(ivy-minibuffer-match-face-2
    ((,class (
	      :bold t
	      :background ,green-2
	      :foreground ,white-0))))
  `(ivy-minibuffer-match-face-3
    ((,class (
	      :bold t
	      :background ,magenta-2
	      :foreground ,white-0))))
  `(ivy-minibuffer-match-face-4
    ((,class (
	      :bold t
	      :background ,cyan-3
	      :foreground ,white-0))))

  ;; swiper
  `(swiper-match-face-1
    ((,class (
	      :background ,blue-1
	      :foreground ,white-0))))
  `(swiper-match-face-2
    ((,class (
	      :bold t
	      :background ,green-2
	      :foreground ,white-0))))
  `(swiper-match-face-3
    ((,class (
	      :bold t
	      :background ,magenta-2
	      :foreground ,white-0))))
  `(swiper-match-face-4
    ((,class (
	      :bold t
	      :background ,cyan-3
	      :foreground ,white-0))))
  `(swiper-line-face
    ((,class (
	      :foreground ,orange-2
	      :bold t
	      :inherit highlight))))

  ;; volatile-highlights
  `(vhl/default-face
    ((,class (
	      :foreground ,black-3
	      :background ,green-0))))

  ;; notmuch
  `(notmuch-search-unread-face
    ((,class (
	      :weight bold))))

  ;; git-gutter (&-fringe)
  `(git-gutter:added
    ((,class (
	      :foreground ,green-4
	      :background ,green-0
	      :bold t))))
  `(git-gutter:deleted
    ((,class (
	      :foreground ,red-3
	      :background ,red-00
	      :bold t))))
  `(git-gutter:modified
    ((,class (
	      :foreground ,yellow-4
	      :background ,yellow-0
	      :bold t))))
  `(git-gutter-fr+-added
    ((,class (
	      :foreground ,green-3))))
  `(git-gutter-fr+-deleted
    ((,class (
	      :foreground ,red-1))))
  `(git-gutter-fr+-modified
    ((,class (
	      :foreground ,yellow-4))))


  ;; cfw: Calendar Framework
  `(cfw:face-day-title
    ((,class (
	      :foreground ,white-0
	      :background "#262626"))))
  `(cfw:face-grid
    ((,class (
	      :foreground ,black-2))))
  `(cfw:face-header
    ((,class (
	      :foreground ,defaultfg
	      :background ,black-3
	      :bold t))))
  `(cfw:face-holiday
    ((,class (
	      :foreground ,purple-1
	      :background "#262626"
	      :bold t))))
  `(cfw:face-saturday
    ((,class (
	      :foreground ,blue-01
	      :background ,blue-3
	      :bold t))))
  `(cfw:face-select
    ((,class (
	      :foreground ,defaultbg
	      :background ,blue-1))))
  `(cfw:face-sunday
    ((,class (
	      :foreground ,red-00
	      :background ,red-3
	      :bold t))))
  `(cfw:face-today
    ((,class (
	      :foreground ,orange-2
	      :background ,black-3))))
  `(cfw:face-today-title
    ((,class (
	      :foreground ,white-0
	      :background ,orange-2))))
  `(cfw:face-toolbar
    ((,class (
	      :foreground ,defaultfg
	      :background ,black-3))))
  `(cfw:face-toolbar-button-off
    ((,class (
	      :foreground ,cyan-5
	      :background ,black-3))))
  `(cfw:face-toolbar-button-on
    ((,class (
	      :foreground ,red-1
	      :background ,white-0))))

  ;; Column marker
  `(column-marker-1
    ((,class (
	      :background ,black-2-5))))
  `(column-marker-2
    ((,class (
	      :background ,yellow-4))))
  `(column-marker-3
    ((,class (
	      :background ,red-3))))

  ;; Swoop
  `(swoop-face-header-format-line
    ((,class (
	      :foreground ,black-6
	      :background nil
	      :underline nil))))
  `(swoop-face-line-buffer-name
    ((,class (
	      :foreground ,green-4
	      :background ,green-0))))
  `(swoop-face-line-number
    ((,class (
	      :foreground "#87875f"
	      :background "#d7d7af"))))
  `(swoop-face-target-line
    ((,class (
	      :foreground ,yellow-1
	      :background ,black-2-5))))
  `(swoop-face-target-words
    ((,class (
	      :foreground ,magenta-1
	      :background ,black-2-5
	      :bold t))))
  `(helm-swoop-target-line-block-face
    ((,class (
	      :foreground ,yellow-1
	      :background ,black-3))))
  `(helm-swoop-target-line-face
    ((,class (
	      :foreground ,yellow-1
	      :background ,black-2-5))))
  `(helm-swoop-target-word-face
    ((,class (
	      :foreground ,magenta-3
	      :background ,magenta-0
	      :bold t))))

  ;; widget
  `(widget-button
    ((,class (
	      :foreground ,blue-1
	      :underline t
	      :bold t))))
  `(widget-button-pressed
    ((,class (
	      :foreground ,blue-0))))
  `(widget-documentation
    ((,class (
	      :foreground ,green-1))))
  `(widget-field
    ((,class (
	      :foreground ,green-0
	      :background ,black-3))))
  `(widget-inactive
    ((,class (
	      :foreground ,black-2))))
  `(widget-single-line-field
    ((,class (
	      :foreground ,green-0
	      :background ,black-3))))

  ;; table
  `(table-cell
    ((,class (
	      :foreground ,white-0
	      :background ,black-3))))

  ;; compilation
  `(compilation-column-number
    ((,class (
	      :foreground ,green-2))))
  `(compilation-error
    ((,class (
	      :foreground ,red-3
	      :background ,red-0
	      :bold t))))
  `(compilation-info
    ((,class (
	      :foreground ,orange-2
	      :background ,black-3))))
  `(compilation-line-number
    ((,class (
	      :foreground ,blue-1))))
  `(compilation-mode-line-exit
    ((,class (
	      :foreground ,green-4
	      :background ,green-0
	      :bold t))))
  `(compilation-mode-line-fail
    ((,class (
	      :foreground ,red-3
	      :background ,red-00
	      :bold t))))
  `(compilation-mode-line-run
    ((,class (
	      :foreground ,orange-4
	      :background ,orange-00
	      :bold t))))
  `(compilation-warning
    ((,class (
	      :foreground ,orange-3))))

  ;; Neotree
  `(neo-banner-face
    ((,class (
	      :foreground ,green-3
	      :background nil))))
  `(neo-header-face
    ((,class (
	      :foreground ,green-1
	      :background nil))))
  `(neo-root-dir-face
    ((,class (
	      :foreground ,magenta-1))))
  `(neo-button-face
    ((,class (
	      :foreground ,blue-1
	      :bold t))))
  `(neo-dir-link-face
    ((,class (
	      :foreground ,blue-1
	      :bold t))))
  `(neo-expand-btn-face
    ((,class (
	      :foreground ,blue-1
	      :background ,black-2-5))))
  `(neo-file-link-face
    ((,class (
	      :foreground ,defaultfg))))

  ;; info
  `(info-header-node
    ((,class (
	      :foreground ,magenta-2
	      :bold t))))
  `(info-header-xref
    ((,class (
	      :foreground ,blue-1
	      :background nil
	      :bold t))))
  `(info-index-match
    ((,class (
	      :background ,blue-3))))
  `(info-menu-header
    ((,class (
	      :foreground ,white-0
	      :bold t
	      :underline t))))
  `(info-menu-star
    ((,class (
	      :foreground ,red-1))))
  `(info-node
    ((,class (
	      :foreground ,red-3))))
  `(info-title-1
    ((,class (
	      :foreground ,blue-1
	      :bold t))))
  `(info-title-2
    ((,class (
	      :foreground ,green-2
	      :bold t))))
  `(info-title-3
    ((,class (
	      :foreground ,orange-2
	      :bold t))))
  `(info-title-4
    ((,class (
	      :foreground ,magenta-2
	      :bold t))))
  `(info-xref
    ((,class (
	      :foreground ,blue-1
	      :underline t))))
  `(info-xref-visited
    ((,class (
	      :foreground ,purple-1
	      :underline t))))

  ;; Tuareg
  `(tuareg-font-lock-error-face
    ((,class (
	      :foreground ,red-3
	      :background ,red-00
	      :bold t))))
  `(tuareg-font-lock-governing-face
    ((,class (
	      :foreground ,defaultfg
	      :bold t))))
  `(tuareg-font-lock-interactive-error-face
    ((,class (
	      :foreground ,red-3
	      :background ,red-00
	      :bold t))))
  `(tuareg-font-lock-interactive-output-face
    ((,class (
	      :foreground ,blue-3))))
  `(tuareg-font-lock-multistage-face
    ((,class (
	      :foreground ,blue-3
	      :background ,blue-0))))
  `(tuareg-font-lock-operator-face
    ((,class (
	      :foreground ,green-2
	      :bold t))))

  ;; CPerl
  `(cperl-array-face
    ((,class (
	      :foreground ,blue-01
	      :background ,blue-3))))
  `(cperl-hash-face
    ((,class (
	      :foreground ,orange-0
	      :background ,red-4))))
  `(cperl-nonoverridable-face
    ((,class (
	      :foreground ,green-01
	      :background ,green-5))))

  ;; Haskell
  `(haskell-interactive-face-compile-error
    ((,class (
	      :foreground ,red-0
	      :background nil
	      :bold t))))
  `(haskell-interactive-face-compile-warning
    ((,class (
	      :foreground ,orange-2
	      :background nil
	      :bold t))))
  `(haskell-interactive-face-garbage
    ((,class (
	      :foreground ,black-2))))
  `(haskell-interactive-face-prompt
    ((,class (
	      :foreground ,green-01
	      :background ,black-2-5
	      :bold t))))
  `(haskell-interactive-face-result
    ((,class (
	      :foreground ,blue-1))))

  ;; EMMS
  `(emms-state-current-playing-time
    ((,class (
	      :foreground ,blue-3
	      :bold t))))
  `(emms-state-total-playing-time
    ((,class (
	      :foreground ,blue-3))))
  `(emms-playlist-selected-face
    ((,class (
	      :foreground ,green-2
	      :bold t))))
  `(emms-playlist-track-face
    ((,class (
	      :foreground ,cyan-5))))


  ;; tty-menu
  `(menu
    ((,class (
	      :foreground ,black-1
	      :background ,black-3))))
  `(tty-menu-disabled-face
    ((,class (
	      :foreground ,black-2-5
	      :background ,black-3))))
  `(tty-menu-enabled-face
    ((,class (
	      :foreground ,white-0
	      :background ,black-3
	      :bold t))))
  `(tty-menu-selected-face
    ((,class (
	      :background ,blue-3))))

  ;; web-mode
  `(web-mode-comment-face
    ((,class (
	      :foreground ,black-2-5))))
  `(web-mode-current-element-highlight-face
    ((,class (
	      :background ,black-3))))
  `(web-mode-current-column-highlight-face
    ((,class (
	      :background ,black-3))))
  `(web-mode-symbol-face
    ((,class (
	      :foreground ,yellow-2))))
  `(web-mode-type-face
    ((,class (
	      :foreground ,cyan-3))))

  ;; Custom
  `(custom-button
    ((,class (
	      :background ,blue-0
	      :foreground ,blue-3

	      :box (
		    :line-width 1
		    :style released-button)))))
  `(custom-button-mouse
    ((,class (
	      :background ,blue-00
	      :foreground ,black-3

	      :box (
		    :line-width 1
		    :style released-button)))))
  `(custom-button-pressed
    ((,class (
	      :foreground ,black-3
	      :background ,defaultfg

	      :box (
		    :line-width 1
		    :style pressed-button)))))

  ;; Hydra
  `(hydra-face-red
    ((,class (
	      :foreground ,red-0))))
  `(hydra-face-blue
    ((,class (
	      :foreground ,blue-1))))
  `(hydra-face-amaranth
    ((,class (
	      :foreground ,magenta-2))))

  ;; rpm-spec-mode
  `(rpm-spec-tag-face
    ((,class (
	      :foreground ,blue-1))))
  `(rpm-spec-obsolete-tag-face
    ((,class (
	      :foreground ,white-0
	      :bold t
	      :background ,red-2))))
  `(rpm-spec-macro-face
    ((,class (
	      :foreground ,yellow-2))))
  `(rpm-spec-var-face
    ((,class (
	      :foreground ,purple-1))))
  `(rpm-spec-doc-face
    ((,class (
	      :foreground ,magenta-2))))
  `(rpm-spec-dir-face
    ((,class (
	      :foreground ,green-2))))
  `(rpm-spec-package-face
    ((,class (
	      :foreground ,red-0))))
  `(rpm-spec-ghost-face
    ((,class (
	      :foreground ,red-0))))
  `(rpm-spec-section-face
    ((,class (
	      :foreground ,yellow-2)))))

  (custom-theme-set-variables
   'my-moe-dark
   `(ansi-color-names-vector [,defaultbg ,red-0 ,green-0 ,yellow-1
				       ,blue-1 ,purple-1 ,blue-0 ,defaultfg]))


  ;; Rainbow-indents
  (dotimes (i 9)
    (make-face (intern (concat "rainbow-indent-depth-"
			       (number-to-string (+ i 1))
			       "-face"))))

  (if window-system
      (progn
	(defvar highlight-indent-guides-character ?\x0020 "make it a space.")
	(setq-default highlight-indent-guides-character ?\x0020)
	(let*
	    ((char-width (frame-char-width (selected-frame)))
	     (hl-stipple (if (> char-width 8)
			     (list char-width 4 (string 1 1 1 1 1 1 1 1))
			   (list char-width 4 (string 1 1 1 1)))))
	  (set-face-attribute 'highlight-indent-guides-top-character-face nil
			      :stipple hl-stipple
			      :foreground blue-0
			      :bold t)
	  (dotimes (i 9)
	    (set-face-attribute
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
	  (set-face-attribute
	   (intern (concat "rainbow-indent-depth-"
			   (number-to-string (+ i 1))
			   "-face"))
	   nil
	   :inherit
	   (intern (concat "rainbow-delimiters-depth-"
			   (number-to-string (+ i 1))
			   "-face"))
	   :stipple nil)))))

;; (fringe-helper-define 'git-gutter-fr+-added nil
;;   "..XXXX.."
;;   "..XXXX.."
;;   "..XXXX.."
;;   "..XXXX.."
;;   "..XXXX.."
;;   "..XXXX.."
;;   "..XXXX.."
;;   "..XXXX.."
;;   "..XXXX.."
;;   "..XXXX.."
;;   "..XXXX.."
;;   "..XXXX.."
;;   "..XXXX.."
;;   "..XXXX.."
;;   "..XXXX.."
;;   "..XXXX.."
;;   "..XXXX..")

;; (fringe-helper-define 'git-gutter-fr+-deleted nil
;;   "..XXXX.."
;;   "..XXXX.."
;;   "..XXXX.."
;;   "..XXXX.."
;;   "..XXXX.."
;;   "..XXXX.."
;;   "..XXXX.."
;;   "..XXXX.."
;;   "..XXXX.."
;;   "..XXXX.."
;;   "..XXXX.."
;;   "..XXXX.."
;;   "..XXXX.."
;;   "..XXXX.."
;;   "..XXXX.."
;;   "..XXXX.."
;;   "..XXXX..")

;; (fringe-helper-define 'git-gutter-fr+-modified nil
;;   "..XXXX.."
;;   "..XXXX.."
;;   "..XXXX.."
;;   "..XXXX.."
;;   "..XXXX.."
;;   "..XXXX.."
;;   "..XXXX.."
;;   "..XXXX.."
;;   "..XXXX.."
;;   "..XXXX.."
;;   "..XXXX.."
;;   "..XXXX.."
;;   "..XXXX.."
;;   "..XXXX.."
;;   "..XXXX.."
;;   "..XXXX.."
;;   "..XXXX..")

;; (fringe-helper-define 'git-gutter-fr+-added nil
;;   "...XX..."
;;   "...XX..."
;;   "...XX..."
;;   "XXXXXXXX"
;;   "XXXXXXXX"
;;   "...XX..."
;;   "...XX..."
;;   "...XX...")

;; (fringe-helper-define 'git-gutter-fr+-deleted nil
;;   "........"
;;   "........"
;;   "........"
;;   "XXXXXXXX"
;;   "XXXXXXXX"
;;   "........"
;;   "........"
;;   "........")

;; (fringe-helper-define 'git-gutter-fr+-modified nil
;;   "........"
;;   "XX......"
;;   ".XX....."
;;   "..XX...."
;;   "...XX..."
;;   "....XX.."
;;   ".....XX."
;;   "......XX"
;;   "........")

(provide-theme 'my-moe-dark)

;; Local Variables:
;; no-byte-compile:
;; End:

;;; my-moe-dark-theme.el ends here