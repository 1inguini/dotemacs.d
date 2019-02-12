;;; my-moe-dark-old-theme.el --- An eye-candy theme for Emacser

;; Author: linguini
;; Based on "moe-dark-theme"

;;; Code:

(deftheme my-moe-dark-old
  "Created 2019-02-08.")

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
     (white-2 "#c6c6c6")
     (white-3 "#b2b2b2")
     
     (black-1 "#a8a8a8")
     (black-2 "#8a8a8a")
     (black-2-5 "#6c6c6c")
     (black-3 "#4e4e4e")
     (black-4 "#3a3a3a")
     (black-5 "#303030")
     (black-6 "#000000")

     (LIGHT_BG "#fdfde7")
     (white-0 "#eeeeee")

     (green-01 "#d7ff00")
     (green-02 "#5fd700")
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
   'my-moe-dark-old
   `(default
      ((,class (
		:background ,black-5
		:foreground ,white-1
		:slant normal
		:weight normal))))

   `(cursor
     ((,class (:background ,white-0))))

   `(escape-glyph
     ((,class (:foreground ,yellow-3))))

   `(homoglyph
     ((((background dark))
       (:foreground "cyan"))
      (((type pc))
       (:foreground "magenta"))
      (t (:foreground "brown"))))

   `(minibuffer-prompt
     ((,class (
	       :foreground ,black-4
	       :background ,green-2))))
   `(ivy-current-match
     ((,class (
	       :weight bold
	       :foreground ,orange-2
	       :inherit (highlight)))))

   `(highlight
     ((,class (:background ,black-4))))

   `(region
     ((,class (
	       :foreground ,black-4
	       :background ,green-0))))

   `(shadow
     ((,class (:foreground ,white-3))))

   `(secondary-selection
     ((,class (
	       :foreground ,white-0
	       :background ,blue-3))))

   `(trailing-whitespace
     ((,class (:background ,red-3))))

   `(font-lock-builtin-face
     ((,class (:foreground ,purple-1))))

   `(font-lock-comment-delimiter-face
     ((,class (
	       :foreground ,black-2-5
	       :slant italic))))

   `(font-lock-comment-face
     ((,class (
	       :foreground ,black-2-5
	       :slant italic))))

   `(font-lock-constant-face
     ((,class (:foreground ,blue-1))))

   `(font-lock-doc-face
     ((,class (:foreground ,red-0))))

   `(font-lock-function-name-face
     ((,class (:foreground ,yellow-2))))

   `(font-lock-keyword-face
     ((,class (:foreground ,green-2))))

   `(font-lock-negation-char-face
     ((,class (:foreground ,red-0))))

   `(font-lock-preprocessor-face
     ((,class (:foreground ,purple-1))))

   `(font-lock-regexp-grouping-backslash
     ((,class (
	       :weight bold
	       :foreground ,yellow-1))))

   `(font-lock-regexp-grouping-construct
     ((,class (
	       :weight bold
	       :foreground ,purple-1))))

   `(font-lock-string-face
     ((,class (:foreground ,magenta-2))))

   `(font-lock-type-face
     ((,class (:foreground ,cyan-3))))

   `(font-lock-variable-name-face
     ((,class (:foreground ,orange-2))))

   `(font-lock-warning-face
     ((,class (:weight bold :foreground ,red-2))))

   `(button
     ((,class (:inherit (link)))))

   `(link
     ((,class (:underline
	       (:color foreground-color :style line)
	       :foreground ,blue-1))))

   `(link-visited
     ((,class (:underline
	       (:color foreground-color :style line)
	       :foreground ,blue-2))))

   `(fringe
     ((,class (
	       :background ,black-4
	       :foreground ,black-1))))

   `(header-line
     ((,class (
	       :foreground ,white-0
	       :background ,blue-3))))

   `(tooltipy
     ((,class (
	       :foreground "lightyellow"
	       :background "black"
	       :inherit (variable-pitch)))))

   `(mode-line
     ((,class (
	       :foreground ,blue-3
	       :background ,blue-0))))

   `(mode-line-buffer-id
     ((,class (
	       :weight bold
	       :foreground ,black-5))))

   `(mode-line-emphasis
     ((,class (:weight bold))))

   `(mode-line-highlight
     ((((class color) (min-colors 88))
       (:box (
	      :line-width 2
	      :color "grey40"
	      :style released-button)))
      (t (:inherit (highlight)))))

   `(mode-line-inactive
     ((,class (
	       :foreground ,white-1
	       :background ,black-2-5))))

   `(isearch
     ((,class (
	       :foreground ,white-1
	       :background ,orange-3))))

   `(isearch-fail
     ((((class color) (min-colors 88) (background light))
       (:background "RosyBrown1"))
      (((class color) (min-colors 88) (background dark))
       (:background "red4"))
      (((class color) (min-colors 16))
       (:background "red"))
      (((class color) (min-colors 8))
       (:background "red"))
      (((class color grayscale))
       (:foreground "grey"))
      (t (:inverse-video t))))

   `(lazy-highlight
     ((,class (
	       :foreground ,white-1
	       :background ,magenta-3))))

   `(match
     ((((class color) (min-colors 88) (background light))
       (:background "yellow1"))

      (((class color) (min-colors 88) (background dark))
       (:background "RoyalBlue3"))

      (((class color) (min-colors 8) (background light))
       (
	:foreground "black"
	:background "yellow"))

      (((class color) (min-colors 8) (background dark))
       (
	:foreground "white"
	:background "blue"))

      (((type tty) (class mono))
       (:inverse-video t))

      (t (:background "gray"))))

   `(next-error
     ((,class (:inherit (region)))))

   `(query-replace
     ((,class (:inherit (isearch)))))

   `(linum
     ((((class color) (min-colors 89))
       (
	:stipple nil
	:background ,black-4
	:foreground ,black-1))))

   ;; company
   `(company-echo
     ((,class (
	       :background nil
	       :foreground ,white-1))))

   `(company-echo-common
     ((,class (
	       :background ,black-3
	       :foreground ,red-1))))

   `(company-preview
     ((,class (
	       :background ,black-5
	       :foreground ,magenta-2))))

   `(company-preview-common
     ((,class (
	       :background ,black-5
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
	       :foreground ,black-5))))

   `(company-tooltip-selection
     ((,class (
	       :background ,blue-3
	       :foreground ,blue-0))))

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
	       :foreground ,white-1))))


   `(rainbow-delimiters-depth-1-face ((,class (:foreground "#9a4040" :weight normal))))
   `(rainbow-delimiters-depth-2-face ((,class (:foreground "#ff5e5e" :weight normal))))
   `(rainbow-delimiters-depth-3-face ((,class (:foreground "#ffaa77" :weight normal))))
   `(rainbow-delimiters-depth-4-face ((,class (:foreground "#dddd77" :weight normal))))
   `(rainbow-delimiters-depth-5-face ((,class (:foreground "#80ee80" :weight normal))))
   `(rainbow-delimiters-depth-6-face ((,class (:foreground "#66bbff" :weight normal)))) 
   `(rainbow-delimiters-depth-7-face ((,class (:foreground "#da6bda" :weight normal))))
   `(rainbow-delimiters-depth-8-face ((,class (:foreground "#afafaf" :weight normal))))
   `(rainbow-delimiters-depth-9-face ((,class (:foreground "#f0f0f0" :weight normal))))))

  (dotimes (i 9)
    (make-face (intern (concat "rainbow-indent-depth-"
			       (number-to-string (+ i 1))
			       "-face"))))

  (setq highlight-indent-guides-character ?\x0020)

  (let* ((char-width (frame-char-width (selected-frame)))
	 (hl-stipple (if (> char-width 8)
			 (list char-width 4 (string 1 1 1 1 1 1 1 1))
		       (list char-width 4 (string 1 1 1 1)))))
    (set-face-attribute 'highlight-indent-guides-top-character-face nil
			:stipple hl-stipple
			:foreground "#afd7ff")
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
       :stipple hl-stipple)))

(provide-theme 'my-moe-dark-old)