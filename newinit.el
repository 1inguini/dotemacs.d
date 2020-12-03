;;; package --- init file by 1inguini
;;; Commentary:
;;; Code:
;;; @@ obsolete process-kill-without-query
(make-obsolete
 'process-kill-without-query
 "use `process-query-on-exit-flag' or `set-process-query-on-exit-flag'."
 "22.1")
(defun process-kill-without-query (process &optional flag)
  "Say no query needed if PROCESS is running when Emacs is exited.
Optional second argument if non-nil says to require a query.
Value is t if a query was formerly required."
  (let ((old (process-query-on-exit-flag process)))
    (set-process-query-on-exit-flag process nil)
    old))

(set-language-environment "Japanese")

(prefer-coding-system 'utf-8)
(setq coding-system-for-read
      'utf-8)
(setq coding-system-for-write
      'utf-8)

;; <leaf-install-code>
(eval-and-compile
  (custom-set-variables
   '(package-archives '(("melpa" . "https://melpa.org/packages/")
			("gnu" . "https://elpa.gnu.org/packages/")
			("melpa-stable" . "https://stable.melpa.org/packages/")
			("marmalade" . "http://marmalade-repo.org/packages/")
			("org" . "http://orgmode.org/elpa/")
			("emacswiki" . "http://www.emacswiki.org/emacs/download/")))
   '(package-archive-priorities
     '(("elpa" . 15)
       ("melpa-stable" . 10)
       ("melpa" . 5)
       ("marmalade" . 1)
       ("org" . 0)
       ("gnu" . 0))))
  
  (package-initialize)
  (unless (package-installed-p 'leaf)
    (package-refresh-contents)
    (package-install 'leaf))

  (leaf leaf
    :config
    (leaf leaf-convert :ensure t)

    (leaf leaf-tree
      :ensure t
      :custom
      ((imenu-list-size . 30)
       (imenu-list-position . 'left)))
    
    (leaf leaf-keywords
      :ensure t
      :init
      ;; optional packages if you want to use :hydra, :el-get, :blackout,,,
      ;; (leaf hydra :ensure t)
      ;; (leaf el-get :ensure t)
      (leaf blackout :ensure t)

      :config
      ;; initialize leaf-keywords.el
      (leaf-keywords-init))))
;; </leaf-install-code>

(leaf *emacs
  :custom
  ;; Turn on `display-time-mode' if you don't use an external bar.
  ((cursor-type . '(bar . 1))
   (display-time-default-load-average . nil))
  :config
  (display-time-mode nil))

(leaf moe-theme
  :doc "A colorful eye-candy theme. Moe, moe, kyun!"
  :added "2020-12-02"
  :url "https://github.com/kuanyui/moe-theme.el"
  :ensure t
  :config
  (load-theme 'moe-dark :no-confirm))

(leaf *font
  :when window-system
  :config
  (let
      ((font-size 14)
       (japanese-fonts "UmeGothic")
       (japanese-font-size 14))

    (set-fontset-font nil
		      #'unicode
		      (font-spec :family "NotoSansMonoCJK"
				 :size font-size))

    (set-fontset-font nil '(126976 . 129791) "NotoEmoji")

    (set-fontset-font nil
		      #'ascii
		      (font-spec :family "inconsolata"
				 :size font-size))


					; 半角ｶﾅ設定
    (set-fontset-font nil
		      ;; (frame-parameter nil #'font)
		      #'katakana-jisx0201
		      (font-spec :family japanese-fonts
				 :size japanese-font-size))

					; 全角かな設定
    (set-fontset-font nil
		      ;; (frame-parameter nil #'font)
		      #'japanese-jisx0208
		      (font-spec :family japanese-fonts
				 :size japanese-font-size)))

  ;;ずれ確認用
  ;; abcdefghijklmnopqrstuvwxyzabcdefghijklmn
  ;; 0123456789012345678901234567890123456789
  ;; ｱｲｳｴｵｱｲｳｴｵｱｲｳｴｵｱｲｳｴｵｱｲｳｴｵｱｲｳｴｵｱｲｳｴｵｱｲｳｴｵ
  ;; あいうえおあいうえおあいうえおあいうえお
  ;; 愛愛愛愛愛愛愛愛愛愛愛愛愛愛愛愛愛愛愛愛
  ;; 🤔
  )

(leaf scroll-bar
  :doc "window system-independent scroll bar support"
  :tag "builtin" "hardware"
  :added "2020-12-02"
  :config (scroll-bar-mode -1))

(leaf tool-bar
  :doc "setting up the tool bar"
  :tag "builtin" "frames" "mouse"
  :added "2020-12-02"
  :config (tool-bar-mode -1))

(leaf menu-bar
  :doc "define a default menu bar"
  :tag "builtin" "mouse" "internal"
  :added "2020-12-02"
  :global-minor-mode menu-bar-mode)

(leaf linum
  :doc "display line numbers in the left margin"
  :tag "builtin"
  :added "2020-12-02"
  :config
  :custom
  (linum-format . " %4d"))

(leaf rainbow-delimiters
  :doc "Highlight brackets according to their depth"
  :tag "tools" "lisp" "convenience" "faces"
  :added "2020-12-02"
  :url "https://github.com/Fanael/rainbow-delimiters"
  :ensure t
  :global-minor-mode global-rainbow-delimiters-mode
  :custom
  (rainbow-delimiters-outermost-only-face-count . 1)
  :init
  ;; ;;括弧の深さをカラーコードで表す
  ;; (set-face-attribute! 'rainbow-delimiters-unmatched-face nil
  ;; 			 :foreground white-0
  ;; 			 :background red-3
  ;; 			 :bold t)

  ;; (set-face-attribute! 'rainbow-delimiters-depth-1-face nil :foreground "#9a4040" :weight 'normal)
  ;; (set-face-attribute! 'rainbow-delimiters-depth-2-face nil :foreground "#ff5e5e" :weight 'normal)
  ;; (set-face-attribute! 'rainbow-delimiters-depth-3-face nil :foreground "#ffaa77" :weight 'normal)
  ;; (set-face-attribute! 'rainbow-delimiters-depth-4-face nil :foreground "#dddd77" :weight 'normal)
  ;; (set-face-attribute! 'rainbow-delimiters-depth-5-face nil :foreground "#80ee80" :weight 'normal)
  ;; (set-face-attribute! 'rainbow-delimiters-depth-6-face nil :foreground "#66bbff" :weight 'normal)
  ;; (set-face-attribute! 'rainbow-delimiters-depth-7-face nil :foreground "#da6bda" :weight 'normal)
  ;; (set-face-attribute! 'rainbow-delimiters-depth-8-face nil :foreground "#afafaf" :weight 'normal)
  ;; (set-face-attribute! 'rainbow-delimiters-depth-9-face nil :foreground "#f0f0f0" :weight 'normal)

  (define-globalized-minor-mode global-rainbow-delimiters-mode
    rainbow-delimiters-mode
    rainbow-delimiters-mode))

(leaf telephone-line
  :doc "Rewrite of Powerline"
  :req "emacs-24.4" "cl-lib-0.5" "cl-generic-0.2" "seq-1.8"
  :tag "mode-line" "emacs>=24.4"
  :added "2020-12-02"
  :url "https://github.com/dbordak/telephone-line"
  :emacs>= 24.4
  :ensure t
  :after cl-generic
  :init
  (telephone-line-defsegment telephone-line-nil-segment ()
    "")
  :global-minor-mode telephone-line-mode
  :custom
  (telephone-line-height . 14)
  (telephone-line-faces .
			'((evil . (mode-line-inactive . mode-line-inactive))
			  (accent . (telephone-line-accent-active . telephone-line-accent-inactive))
			  (nil . (mode-line . mode-line-inactive))))

  ;; Left edge
  (telephone-line-lhs .
		      '((nil . ((telephone-line-window-number-segment t)
				telephone-line-input-info-segment))
			(accent . (telephone-line-projectile-buffer-segment
				   telephone-line-buffer-modified-segment))
			(evil . (telephone-line-simple-major-mode-segment
				 telephone-line-simple-minor-mode-segment
				 telephone-line-nil-segment))))
  ;; Right edge
  (telephone-line-rhs .
		      '((evil . (telephone-line-atom-encoding-segment
				 telephone-line-misc-info-segment))
			(accent . (telephone-line-flycheck-segment
				   (telephone-line-vc-segment :active)))
			(nil . (telephone-line-filesize-segment
				telephone-line-hud-segment)))))

(leaf uim
  :tag "builtin"
  :added "2020-12-02"
  :load-path "/usr/share/emacs/site-lisp/uim-el"
  :require t
  :init
  (define-globalized-minor-mode global-uim-mode
    uim-mode uim-mode)
  :global-minor-mode global-uim-mode
  :bind
  (:uim-mode-map
   ("ESC" . nil))
  :custom
  ((uim-candidate-display-inline . t)
   (uim-preedit-display-fences . t)
   (uim-candidate-display-frame . t)))

(leaf undo-tree
  :doc "Treat undo history as a tree"
  :tag "tree" "history" "redo" "undo" "files" "convenience"
  :added "2020-12-02"
  :url "http://www.dr-qubit.org/emacs.php"
  :ensure t
  :blackout t
  :global-minor-mode global-undo-tree-mode
  :bind
  ((:global-map
    ("C-z" . undo-tree-undo)
    ("C-y" . undo-tree-redo))
   (:ctl-x-map
    ("u" . undo-tree-visualize))))

(leaf recentf
  :doc "setup a menu of recently opened files"
  :tag "builtin"
  :added "2020-12-02"
  :global-minor-mode recentf-mode
  :custom
  (recentf-auto-cleanup . 'never))

(leaf switch-window
  :doc "A *visual* way to switch window"
  :req "emacs-24"
  :tag "convenience" "emacs>=24"
  :added "2020-12-02"
  :url "https://github.com/dimitri/switch-window"
  :emacs>= 24
  :ensure t
  :bind
  (:ctl-x-map
   ("o" . switch-window))
  :custom
  ((switch-window-threshold . 2)
   (switch-window-minibuffer-shortcut . 122))
  :config
  (leaf *cui
    ;; ←CUI用設定を、ここに記述
    :when (eq window-system nil)
    :custom
    (switch-window-shortcut-appearance . 'asciiart)))

(leaf winner
  :doc "Restore old window configurations"
  :tag "builtin"
  :added "2020-12-03"
  :global-minor-mode winner-mode
  :bind
  (:mode-specific-map
   ("<left>" . winner-undo)
   ("<right>" . winner-redo))
  :custom
  (winner-dont-bind-my-keys . t))

(leaf highlight-indent-guides
  :doc "Minor mode to highlight indentation"
  :req "emacs-24"
  :tag "emacs>=24"
  :added "2020-12-02"
  :url "https://github.com/DarthFennec/highlight-indent-guides"
  :emacs>= 24
  :ensure t
  :blackout t
  :custom
  ((highlight-indent-guides-method . 'character)
   (highlight-indent-guides-character . 32)
   (highlight-indent-guides-delay . 0)
   (highlight-indent-guides-responsive . 'top)
   (highlight-indent-guides-highlighter-function . 'rainbow-indent-highlighter))
  :config
  (defun rainbow-indent-highlighter (depth responsive display)
    (cond
     ((eq responsive nil)
      (intern-soft
       (concat "rainbow-indent-depth-"
	       (number-to-string
		(if (<= (+ depth 1) rainbow-delimiters-max-face-count)
		    ;; Our nesting depth has a face defined for it.
		    (+ depth 1)
		  ;; Deeper than # of defined faces; cycle back through to
		  ;; `rainbow-delimiters-outermost-only-face-count' + 1.
		  ;; Return face # that corresponds to current nesting level.
		  (+ 1 rainbow-delimiters-outermost-only-face-count
		     (mod (- depth rainbow-delimiters-max-face-count)
			  (- rainbow-delimiters-max-face-count
			     rainbow-delimiters-outermost-only-face-count)))))
	       "-face")))
     ((eq responsive 'top)
      'highlight-indent-guides-top-character-face)))

  (defun lisp-less-prog-mode-hook-highlight-indent-guides-mode ()
    (if (or (eq major-mode 'emacs-lisp-mode)
	    (eq major-mode 'clojure-mode)
	    (eq major-mode 'common-lisp-mode)
	    (eq major-mode 'dune-mode))
	(highlight-indent-guides-mode -1)
      (highlight-indent-guides-mode t)))
  (leaf lisp-less-prog-mode-hook-highlight-indent-guides-mode
    :hook prog-mode-hook))

(leaf shackle
  :doc "Enforce rules for popups"
  :req "cl-lib-0.5"
  :tag "convenience"
  :added "2020-12-02"
  :url "https://github.com/wasamasa/shackle"
  :ensure t
  :custom
  ((shackle-rules .
		  '(("*Agenda Commands*" :aline right :ratio 0.3)
		    ("*Org Agenda*" :aline right :ratio 0.3)
		    ("*Help*" :align bottom :ratio 0.3)))
   (shackle-lighter . ""))

  :config
  (shackle-mode 1))

(leaf whitespace
  :doc "minor mode to visualize TAB, (HARD) SPACE, NEWLINE"
  :tag "builtin"
  :added "2020-12-02"
  :ensure t
  :custom
  ((whitespace-space-regexp . "\\(\u3000+\\)")
   (whitespace-display-mappings .
				'((space-mark ?\  [?·] [?.])
				  (space-mark ?\u3000 [?\□])
				  (space-mark ?\xA0 [?\u00A4] [?_])
				  (space-mark ?\t [?⟼ ?\t] [?\\?\t])
				  (space-mark ?\n [?\¬ ?\n])))))

(leaf ivy
  :doc "Incremental Vertical completYon"
  :req "emacs-24.1"
  :tag "matching" "emacs>=24.1"
  :added "2020-12-02"
  :url "https://github.com/abo-abo/swiper"
  :emacs>= 24.1
  :ensure t
  ;; :bind
  ;; (:ivy-minibuffer-map
  ;;  ("<backspace>" . ivy-backward-delete-char)
  ;;  ("M-<tab>" . next-line)
  ;; ("M-<iso-lefttab>" . previous-line))
  :custom
  (ivy-re-builders-alist . #'((t . ivy--regex-ignore-order)))
  :config
  (ivy-mode t)

  (leaf ivy-rich
    :doc "More friendly display transformer for ivy."
    :req "emacs-24.4" "ivy-0.8.0"
    :tag "ivy" "emacs>=24.4"
    :added "2020-12-02"
    :emacs>= 24.4
    :ensure t
    :after ivy
    :config (ivy-rich-mode t))

  (leaf swiper
    :doc "Isearch with an overview. Oh, man!"
    :req "emacs-24.1" "ivy-0.11.0"
    :tag "matching" "emacs>=24.1"
    :added "2020-12-03"
    :url "https://github.com/abo-abo/swiper"
    :emacs>= 24.1
    :ensure t
    :after ivy
    :bind
    ((:global-map
      ("C-f" . swiper))
     (:swiper-map
      ("C-r" . swiper-query-replace)
      ("C-z" . ivy-reverse-i-search)
      ("M-c" . swiper-mc)
      ("C-o" . ivy-occur)
      ("C-v" . nil))))

  (leaf counsel
    :doc "Various completion functions using Ivy"
    :req "emacs-24.3" "swiper-0.11.0"
    :tag "tools" "matching" "convenience" "emacs>=24.3"
    :added "2020-12-03"
    :url "https://github.com/abo-abo/swiper"
    :emacs>= 24.3
    :ensure t
    :after swiper
    :config
    (counsel-mode t)))

(leaf which-key
  :doc "Display available keybindings in popup"
  :req "emacs-24.4"
  :tag "emacs>=24.4"
  :added "2020-12-02"
  :url "https://github.com/justbur/emacs-which-key"
  :emacs>= 24.4
  :ensure t
  :config
  ;; enable which key mode
  (which-key-mode t))

(leaf multiple-cursors
  :doc "Multiple cursors for Emacs."
  :req "cl-lib-0.5"
  :added "2020-12-02"
  :ensure t
  :config
  ;; enable multiple cursor
  (multiple-cursors-mode 1))

(leaf projectile
  :doc "Manage and navigate projects in Emacs easily"
  :req "emacs-25.1" "pkg-info-0.4"
  :tag "convenience" "project" "emacs>=25.1"
  :added "2020-12-02"
  :url "https://github.com/bbatsov/projectile"
  :emacs>= 25.1
  :ensure t
  :config
  (projectile-mode t))

(leaf adaptive-wrap
  :doc "Smart line-wrapping with wrap-prefix"
  :added "2020-12-02"
  :url "http://elpa.gnu.org/packages/adaptive-wrap.html"
  :ensure t
  :config
  ;; インデントに合わせて折り返し
  (define-globalized-minor-mode global-adaptive-wrap-prefix-mode
    adaptive-wrap-prefix-mode
    adaptive-wrap-prefix-mode)
  (global-adaptive-wrap-prefix-mode 1))

(leaf flycheck
  :doc "On-the-fly syntax checking"
  :req "dash-2.12.1" "pkg-info-0.4" "let-alist-1.0.4" "seq-1.11" "emacs-24.3"
  :tag "tools" "languages" "convenience" "emacs>=24.3"
  :added "2020-12-02"
  :url "http://www.flycheck.org"
  :emacs>= 24.3
  :ensure t
  :blackout t
  :hook prog-mode-hook
  :config
  (flycheck-mode t))

(leaf ov
  :doc "Overlay library for Emacs Lisp"
  :req "emacs-24.3"
  :tag "overlay" "emacs>=24.3"
  :added "2020-12-02"
  :url "https://github.com/ShingoFukuyama/ov.el"
  :emacs>= 24.3
  :ensure t
  :config
  (leaf *buffer-minchonize
    :tag "out-of-MELPA"
    :added "2020-12-02"
    :require ov
    :config
    (defun my/buffer-minchoize ()
      "Minchoize current buffer."
      (interactive)
      (ov (point-min) (point-max) 'face '(:family "umeMincho")))))

(leaf org
  :doc "Export Framework for Org Mode"
  :tag "builtin"
  :added "2020-12-02"
  :custom
  (;; org-default-notes-fileのディレクトリ
   (org-directory . "~/Desktop/org/")
   ;; org-default-notes-fileのファイル名
   (org-default-notes-file . "notes.org")

   (org-agenda-files . '(org-directory))))

(leaf company
  :doc "Modular text completion framework"
  :req "emacs-24.3"
  :tag "matching" "convenience" "abbrev" "emacs>=24.3"
  :added "2020-12-02"
  :url "http://company-mode.github.io/"
  :emacs>= 24.3
  :ensure t
  :custom
  ((company-idle-delay . 0)
   (company-minimum-prefix-length . 1)
   (company-quickhelp-mode . -1)
   (company-show-numbers . t)
   (company-transformers .
			 '(company-sort-by-backend-importance company-sort-by-statistics company-sort-by-occurrence))
   (company-require-match))
  ;; '( company-backends
  ;;     '((company-tabnine
  ;; 	 company-yasnippet
  ;; 	 :with
  ;; 	 company-capf
  ;; 	 company-dabbrev
  ;; 	 company-dabbrev-code
  ;; 	 company-files
  ;; 	 company-gtags
  ;; 	 company-etags
  ;; 	 company-keywords
  ;; 	 company-lsp
  ;; 	 )
  ;; 	;; (company-yasnippet :with company-dabbrev)
  ;; 	;; (company-yasnippet :with company-bbdb)
  ;; 	;; (company-yasnippet :with company-eclim)
  ;; 	;; (company-yasnippet :with company-semantic)
  ;; 	;; (company-yasnippet :with company-clang)
  ;; 	;; (company-yasnippet :with company-xcode)
  ;; 	;; (company-yasnippet :with company-cmake)
  ;; 	;; (company-yasnippet :with company-files)
  ;; 	;; (company-yasnippet :with company-oddmuse)
  ;; 	;; (company-yasnippet :with company-capf)
  ;; 	))
  :config
  (company-statistics-mode t)
  (global-company-mode t)

  (leaf company-flx
    :doc "flx based fuzzy matching for company"
    :req "emacs-24" "company-0.8.12" "flx-0.5"
    :tag "flx" "fuzzy" "company" "convenience" "emacs>=24"
    :added "2020-12-03"
    :url "https://github.com/PythonNut/company-flx"
    :emacs>= 24
    :ensure t
    :after company flx
    :config (company-flx-mode t)))

(leaf yasnippet
  :doc "Yet another snippet extension for Emacs."
  :req "cl-lib-0.5"
  :tag "emulation" "convenience"
  :added "2020-12-02"
  :url "http://github.com/joaotavora/yasnippet"
  :ensure t
  :global-minor-mode yas-global-mode
  :bind
  (:yas-minor-mode-map
   ("C-c &" . nil))
  (:mode-specific-map
   ("C-s" . yas-insert-snippet)
   ("C-n" . yas-new-snippet)
   ("C-v" . yas-visit-snippet-file)))

(leaf smartparens
  :doc "Automatic insertion, wrapping and paredit-like navigation with user defined pairs."
  :req "dash-2.13.0" "cl-lib-0.3"
  :added "2020-12-02"
  :ensure t
  :require t
  :config
  ;; enable smartparens
  (sp-with-modes '(emacs-lisp-mode lisp-mode lisp-interaction-mode
				   ;;slime-mode
				   clojure-mode)
    (sp-local-pair "'" nil :actions nil)
    (sp-local-pair "`" nil :actions nil))
  (smartparens-global-mode 1)

  (sp-pair "⟨" "⟩")

  (show-smartparens-global-mode 1))

(leaf dired
  :doc "directory-browsing commands"
  :tag "builtin" "files"
  :added "2020-12-02"
  :bind
  (:dired-mode-map
   ("z" . dired-atool-do-unpack)
   ("Z" . dired-atool-do-pack)))

(leaf eww
  :doc "Emacs Web Wowser"
  :tag "builtin"
  :added "2020-12-02"
  :custom
  ;; ewwのデフォルトのエンジンをgoogleに
  ((eww-search-prefix . "https://www.google.co.jp/search?q=")))

(leaf *goto-line-beginning-indent
  :tag "out-of-MELPA"
  :added "2020-12-02"
  :bind (:global-map
	 ("C-a" . my-goto-line-beginning-or-indent))
  :config
  (defun my-goto-line-beginning-or-indent (&optional $position)
    "copied from https://qiita.com/ShingoFukuyama/items/62269c4904ca085f9149"
    (interactive)
    (or $position (defvar $position (point)))
    (let (($starting-position (progn (back-to-indentation) (point))))
      (if (eq $starting-position $position)
	  (move-beginning-of-line 1)))))

(leaf smart-hungry-delete
  :doc "smart hungry deletion of whitespace"
  :req "emacs-24.3"
  :tag "convenience" "emacs>=24.3"
  :added "2020-12-03"
  :url "https://github.com/hrehfeld/emacs-smart-hungry-delete"
  :emacs>= 24.3
  :ensure t
  :bind
  (:global-map
   ("<delete>" . smart-hungry-delete-forward-char)
   ("<backspace>" . smart-hungry-delete-backward-char)))

(leaf bind-key
  ;; bind-keyの設定というよりキーバインド一般の設定
  :doc "A simple way to manage personal keybindings"
  :tag "dotemacs" "config" "keybinding" "keys"
  :added "2020-12-03"
  :url "https://github.com/jwiegley/use-package"
  :ensure t
  :bind
  ((:global-map
    ("C-c" . kill-ring-save)
    ("C-x" . kill-region)
    ("C-v" . yank)
    ("C-s" . save-buffer)
    ("M-y" . yank-pop)
    ("M-<left>" . backward-word)
    ("M-<right>" . forward-word)
    ("<backtab>" . company-complete-common))
   (:ctl-x-map
    ;; デフォルトでC-uにバインドされてる繰り返し
    ("t" . universal-argument)
    ;;  C-c map
    ("c" . mode-specific-command-prefix)))
  :config
  (bind-keys
   :map global-map
   ("M-m" . Control-X-prefix)))

;; memo lispyは便利

;;; init.el ens here
