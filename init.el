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
  (setq package-native-compile t)
  (customize-set-variable
   'package-archives '(("org" . "https://orgmode.org/elpa/")
		       ("melpa" . "https://melpa.org/packages/")
		       ("melpa-stable" . "http://stable.melpa.org/packages/")
		       ("gnu" . "https://elpa.gnu.org/packages/")))
  (package-initialize)
  (unless (package-installed-p 'leaf)
    (package-refresh-contents)
    (package-install 'leaf))

  (leaf leaf-keywords
    :ensure t
    :init
    ;; optional packages if you want to use :hydra, :el-get, :blackout,,,
    ;; (leaf hydra :ensure t)
    ;; (leaf el-get :ensure t)
    (leaf blackout :ensure t)

    :config
    ;; initialize leaf-keywords.el
    (leaf-keywords-init)))
;; </leaf-install-code>

(leaf leaf-tree
  :ensure t
  :custom
  ((imenu-list-size . 20)
   (imenu-list-position . 'left)))

(leaf leaf-convert
  :doc "Convert many format to leaf format"
  :req "emacs-26.1" "leaf-3.6.0" "leaf-keywords-1.1.0" "ppp-2.1"
  :tag "tools" "emacs>=26.1"
  :added "2020-12-17"
  :url "https://github.com/conao3/leaf-convert.el"
  :emacs>= 26.1
  :ensure t
  :after leaf leaf-keywords ppp)

(leaf *emacs
  :custom
  ;; Turn on `display-time-mode' if you don't use an external bar.
  ((load-prefer-newer . t)
   (fringe-mode . '(nil . 0))
   (cursor-type . '(bar . 1))
   (display-time-default-load-average . nil))
  :config
  (display-time-mode nil))

(leaf *native-compile
  :custom
  ((native-comp-always-compile . t)
   (native-comp-async-jobs-number . 8)
   (native-comp-async-query-on-exit . t)
   (native-comp-speed . 3)))

(leaf moe-theme
  :doc "A colorful eye-candy theme. Moe, moe, kyun!"
  :added "2020-12-02"
  :url "https://github.com/kuanyui/moe-theme.el"
  :ensure t
  :config
  ;; (load-theme 'moe-dark :no-confirm)
  )

(leaf one-themes
  :doc "One Colorscheme"
  :req "emacs-24"
  :tag "emacs>=24"
  :added "2021-05-26"
  :url "http://github.com/balajisivaraman/emacs-one-themes"
  :emacs>= 24
  :ensure t
  :config (load-theme 'one-dark :no-confirm))

(leaf *font
  :when window-system
  :config
  (let
      ((font-size 14)
       (japanese-fonts "UmeGothic")
       (japanese-font-size 14))

    (set-fontset-font nil
		      'unicode
		      (font-spec :family "NotoSansMonoCJK"
				 :size font-size))

    (set-fontset-font nil '(126976 . 129791) "NotoColorEmoji")

    (set-fontset-font nil
		      'ascii
		      (font-spec :family "Inconsolata"
				 :size font-size))


					; 半角ｶﾅ設定
    (set-fontset-font nil
		      ;; (frame-parameter nil #'font)
		      'katakana-jisx0201
		      (font-spec :family japanese-fonts
				 :size japanese-font-size))

					; 全角かな設定
    (set-fontset-font nil
		      ;; (frame-parameter nil #'font)
		      'japanese-jisx0208
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
  ;; :global-minor-mode global-linum-mode
  :hook prog-mode-hook
  :custom
  (linum-format . " %4d"))

(leaf rainbow-delimiters
  :doc "Highlight brackets according to their depth"
  :tag "tools" "lisp" "convenience" "faces"
  :added "2020-12-02"
  :url "https://github.com/Fanael/rainbow-delimiters"
  :ensure t
  :init
  (define-globalized-minor-mode global-rainbow-delimiters-mode
    rainbow-delimiters-mode
    rainbow-delimiters-mode)
  :global-minor-mode global-rainbow-delimiters-mode
  :custom
  (rainbow-delimiters-outermost-only-face-count . 1)
  :custom-face
  ;; ;;括弧の深さをカラーコードで表す
  ((rainbow-delimiters-depth-1-face . '((t (:foreground "#9a4040" :bold t))))
   (rainbow-delimiters-depth-2-face . '((t (:foreground "#ff5e5e" :bold t))))
   (rainbow-delimiters-depth-3-face . '((t (:foreground "#ffaa77" :bold t))))
   (rainbow-delimiters-depth-4-face . '((t (:foreground "#dddd77" :bold t))))
   (rainbow-delimiters-depth-5-face . '((t (:foreground "#80ee80" :bold t))))
   (rainbow-delimiters-depth-6-face . '((t (:foreground "#66bbff" :bold t))))
   (rainbow-delimiters-depth-7-face . '((t (:foreground "#da6bda" :bold t))))
   (rainbow-delimiters-depth-8-face . '((t (:foreground "#afafaf" :bold t))))
   (rainbow-delimiters-depth-9-face . '((t (:foreground "#f0f0f0" :bold t))))))

(leaf highlight-indent-guides
  :doc "Minor mode to highlight indentation"
  :req "emacs-24"
  :tag "emacs>=24"
  :added "2020-12-02"
  :url "https://github.com/DarthFennec/highlight-indent-guides"
  :emacs>= 24
  :ensure t
  :blackout t
  :hook prog-mode-hook
  :custom
  ((highlight-indent-guides-method . 'character)
   (highlight-indent-guides-delay . 0)
   (highlight-indent-guides-responsive . 'top)
   (highlight-indent-guides-highlighter-function . 'rainbow-indent-highlighter))
  :custom-face
  (highlight-indent-guides-top-character-face . '((t (:inherit mode-line-face :invert t))))
  :config
  (dotimes (i 9)
    (custom-declare-face
     (intern
      (concat "rainbow-indent-depth-" (number-to-string (+ i 1)) "-face"))
     `((t
	(:inherit
	 ,(intern
	   (concat "rainbow-delimiters-depth-" (number-to-string (+ i 1)) "-face"))
	 :bold nil)))
     "face for rainbow-indent-highlight"))

  (defun rainbow-indent-highlighter (depth responsive display)
    (cond
     ((eq responsive nil)
      (intern-soft
       (concat "rainbow-indent-depth-"
	       (number-to-string
		(if (<= (+ 1 depth) rainbow-delimiters-max-face-count)
		    ;; Our nesting depth has a face defined for it.
		    (+ 1 depth)
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
  ;; (leaf *stipple-indent-guide
  ;;   :when window-system
  ;;   :defvar mode-line-face
  ;;   :after highlight-indent-guides
  ;;   :custom
  ;;   (highlight-indent-guides-character . ?\x0020 ;; "make it a space."
  ;;				       )
  ;;   :config
  ;;   (let*
  ;;	((char-width (frame-char-width (selected-frame)))
  ;;	 (hl-stipple (if (> char-width 8)
  ;;			 (list char-width 4 (string 1 1 1 1 1 1 1 1))
  ;;		       (list char-width 4 (string 1 1 1 1)))))

  ;;     (set-face-attribute 'highlight-indent-guides-top-character-face nil
  ;;			  :inherit 'mode-line-face
  ;;			  :stipple hl-stipple
  ;;			  :bold t)
  ;;     (dotimes (i 9)
  ;;	(custom-declare-face
  ;;	 (intern
  ;;	  (concat "rainbow-indent-depth-"
  ;;		  (number-to-string
  ;;		   (+ i 1))
  ;;		  "-face"))
  ;;	 `((t
  ;;	    (:inherit
  ;;	     ,(intern
  ;;	       (concat "rainbow-delimiters-depth-"
  ;;		       (number-to-string
  ;;			(+ i 1))
  ;;		       "-face"))
  ;;	     :stipple ,hl-stipple)))
  ;;	 "face for rainbow-indent-highlight"))))
  )

;; (
;;  (if (not window-system)
;;      (progn
;;        (dotimes (i 9)
;;	 (set-face-attribute
;;	  (intern (concat "rainbow-indent-depth-"
;;			  (number-to-string (+ i 1))
;;			  "-face"))
;;	  nil
;;	  :inherit
;;	  (intern (concat "rainbow-delimiters-depth-"
;;			  (number-to-string (+ i 1))
;;			  "-face"))
;;	  :stipple nil)))))

(leaf telephone-line
  :doc "Rewrite of Powerline"
  :req "emacs-24.4" "cl-lib-0.5" "cl-generic-0.2" "seq-1.8"
  :tag "mode-line" "emacs>=24.4"
  :added "2020-12-02"
  :url "https://github.com/dbordak/telephone-line"
  :emacs>= 24.4
  :ensure t
  :after cl-generic
  :global-minor-mode telephone-line-mode)


(leaf bind-key
  ;; bind-keyの設定というよりキーバインド一般の設定
  :doc "A simple way to manage personal keybindings"
  :tag "dotemacs" "config" "keybinding" "keys"
  :added "2020-12-03"
  :url "https://github.com/jwiegley/use-package"
  :ensure t
  :bind
  ((:global-map
    ([remap newline] . newline-and-indent)
    ;; ("C-c" . kill-ring-save)
    ;; ("C-x" . kill-region)
    ;; ("C-v" . yank)
    ("C-z" . undo)
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
  (:input-decode-map
   ([?\C-i] . [C-i]))
  :config
  (bind-keys
   :map global-map
   ("M-m" . Control-X-prefix))
  (bind-keys
   :map ctl-x-map
   ("8" . iso-transl-ctl-x-8-map)))


(leaf cliphist
  :doc "Read data from clipboard managers at Linux and macOS"
  :req "emacs-24.3" "ivy-0.9.0"
  :tag "history" "manager" "clipboard" "emacs>=24.3"
  :added "2021-06-09"
  :url "http://github.com/redguardtoo/cliphist"
  :emacs>= 24.3
  :ensure t
  :after ivy
  :bind
  ([remap yank-pop] . cliphist-select-item))

(leaf evil
  :doc "Extensible Vi layer for Emacs."
  :req "emacs-24.1" "goto-chg-1.6" "cl-lib-0.5"
  :tag "vim" "emulation" "emacs>=24.1"
  :added "2021-05-25"
  :url "https://github.com/emacs-evil/evil"
  :emacs>= 24.1
  :ensure t
  :after goto-chg
  :after undo-tree
  :preface (require 'goto-chg)
  :global-minor-mode evil-mode evil-surround-mode
  :custom
  (evil-search-module . 'evil-search)
  (evil-undo-system . 'undo-tree)
  (evil-shift-width . 2)
  (evil-default-cursor . 'bar)
  (evil-normal-state-cursor . 'box)
  (evil-insert-state-cursor . '(bar . 1))
  (evil-visual-state-cursor . 'box)
  :bind
  (:evil-normal-state-map
   ([remap yank-pop] . nil)
   ([remap evil-ex] . execute-extended-command)
   ([remap evil-search-forward] . swiper)
   ("." . evil-repeat))
  (:evil-visual-state-map
   ("e" . eval-region))
  (:evil-motion-state-map
   ("C-f" . nil))
  :config
  (leaf evil-surround
    :doc "emulate surround.vim from Vim"
    :req "evil-1.2.12"
    :tag "evil" "vi" "emulation"
    :added "2021-05-25"
    :ensure t
    :after evil))


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
   ("ESC" . nil)
   ("C-h" . nil)
   ("<delete>" . nil)
   ("<wheel-up>" . nil)
   ("<wheel-down>" . nil)
   ("<wheel-left>" . nil)
   ("<wheel-right>" . nil)
   ("<double-wheel-up>" . nil)
   ("<double-wheel-down>" . nil)
   ("<double-wheel-left>" . nil)
   ("<double-wheel-right>" . nil)
   ("<triple-wheel-up>" . nil)
   ("<triple-wheel-down>" . nil)
   ("<triple-wheel-left>" . nil)
   ("<triple-wheel-right>" . nil))
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
  ((:undo-tree-map
    ([remap undo] . undo-tree-undo)
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

(leaf files
  :doc "file input and output commands for Emacs"
  :tag "builtin"
  :added "2020-12-15"
  :custom
  ((backup-directory-alist . '(("." . "~/.emacs.d/backups")))
   (auto-save-file-name-transforms . '((".*" "~/.emacs.d/backups" t)))))

(leaf backup-each-save
  :doc "backup each savepoint of a file"
  :added "2020-12-15"
  :ensure t
  :require t
  :hook (after-save-hook . backup-each-save)
  :config
  (defvar backup-each-save-mirror-location "~/.emacs.d/backups"))

(leaf autorevert
  :doc "revert buffers when files on disk change"
  :tag "builtin"
  :added "2020-12-15"
  :global-minor-mode global-auto-revert-mode)

(leaf desktop
  :doc "save partial status of Emacs when killed"
  :tag "builtin"
  :added "2020-12-15"
  :custom
  (desktop-save-mode . t))

(leaf session
  :doc "use variables, registers and buffer places across sessions"
  :tag "tools" "data" "desktop" "session management" "session"
  :added "2020-12-15"
  :url "http://emacs-session.sourceforge.net/"
  :ensure t
  :hook (after-init-hook . session-initialize))

(leaf switch-window
  :doc "A *visual* way to switch window"
  :req "emacs-24"
  :tag "convenience" "emacs>=24"
  :added "2020-12-02"
  :url "https://github.com/dimitri/switch-window"
  :emacs>= 24
  :ensure t
  :require
  :bind
  ([remap other-window] . switch-window)
  :custom
  ((switch-window-threshold . 3)
   (switch-window-minibuffer-shortcut . ?z))
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

(leaf shackle
  :doc "Enforce rules for popups"
  :req "cl-lib-0.5"
  :tag "convenience"
  :added "2020-12-02"
  :url "https://github.com/wasamasa/shackle"
  :ensure t
  :global-minor-mode shackle-mode
  :custom
  ((shackle-rules .
		  '(("*Agenda Commands*" :aline right :ratio 0.3)
		    ("*Org Agenda*" :aline right :ratio 0.3)
		    ("*Help*" :align bottom :ratio 0.3)))
   (shackle-lighter . "")))

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

(leaf avy
  :doc "Jump to arbitrary positions in visible text and select text quickly."
  :req "emacs-24.1" "cl-lib-0.5"
  :tag "location" "point" "emacs>=24.1"
  :added "2020-12-17"
  :url "https://github.com/abo-abo/avy"
  :emacs>= 24.1
  :ensure t
  :bind
  (:global-map
   ("C-<tab>" . avy-goto-char)))

(leaf ivy
  :doc "Incremental Vertical completYon"
  :req "emacs-24.1"
  :tag "matching" "emacs>=24.1"
  :added "2020-12-02"
  :url "https://github.com/abo-abo/swiper"
  :emacs>= 24.1
  :ensure t
  :blackout t
  :global-minor-mode ivy-mode
  ;; :bind
  ;; (:ivy-minibuffer-map
  ;;  ("<backspace>" . ivy-backward-delete-char)
  ;;  ("M-<tab>" . next-line)
  ;; ("M-<iso-lefttab>" . previous-line))
  :custom
  ((ivy-re-builders-alist . #'((t . ivy--regex-ignore-order)))
   (ivy-height . 40))
  :config
  (leaf counsel
    :doc "Various completion functions using Ivy"
    :req "emacs-24.3" "swiper-0.11.0"
    :tag "tools" "matching" "convenience" "emacs>=24.3"
    :added "2020-12-03"
    :url "https://github.com/abo-abo/swiper"
    :emacs>= 24.3
    :ensure t
    :after swiper
    :blackout t
    :global-minor-mode counsel-mode
    :bind
    (:counsel-mode-map
     ([remap yank-pop] . nil)
     ("<C-i>" . counsel-imenu))
    :custom
    (ivy-initial-inputs-alist . nil
			      ;; '((org-refile . "^")
			      ;;	(org-agenda-refile . "^")
			      ;;	(org-capture-refile . "^")
			      ;;	(Man-completion-table . "^")
			      ;;	(woman . "^"))
			      ))

  (leaf ivy-rich
    :doc "More friendly display transformer for ivy."
    :req "emacs-24.4" "ivy-0.8.0"
    :tag "ivy" "emacs>=24.4"
    :added "2020-12-02"
    :emacs>= 24.4
    :ensure t
    :after ivy
    :global-minor-mode ivy-rich-mode)

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

  (leaf amx
    :doc "Alternative M-x with extra features."
    :req "emacs-24.4" "s-0"
    :tag "usability" "convenience" "emacs>=24.4"
    :added "2020-12-18"
    :url "http://github.com/DarwinAwardWinner/amx/"
    :emacs>= 24.4
    :ensure t
    :custom
    (amx-history-length . 50)))

(leaf imenu
  :doc "framework for mode-specific buffer indexes"
  :tag "builtin"
  :added "2021-01-30"
  :global-minor-mode imenu-list-minor-mode)

(leaf which-key
  :doc "Display available keybindings in popup"
  :req "emacs-24.4"
  :tag "emacs>=24.4"
  :added "2020-12-02"
  :url "https://github.com/justbur/emacs-which-key"
  :emacs>= 24.4
  :ensure t
  :blackout t
  :global-minor-mode which-key-mode)


(leaf multiple-cursors
  :doc "Multiple cursors for Emacs."
  :req "cl-lib-0.5"
  :added "2020-12-02"
  :ensure t
  :require t
  :bind
  (:global-map
   ("C->" . mc/mark-next-like-this)
   ("C-<" . mc/mark-previous-like-this)
   ("C-S-a" . mc/mark-all-like-this)))


(leaf projectile
  :doc "Manage and navigate projects in Emacs easily"
  :req "emacs-25.1" "pkg-info-0.4"
  :tag "convenience" "project" "emacs>=25.1"
  :added "2020-12-02"
  :url "https://github.com/bbatsov/projectile"
  :emacs>= 25.1
  :ensure t
  :global-minor-mode projectile-mode)


(leaf htmlize
  :doc "Convert buffer text and decorations to HTML."
  :tag "extensions" "hypermedia"
  :added "2020-12-17"
  :url "https://github.com/hniksic/emacs-htmlize"
  :ensure t)


(leaf adaptive-wrap
  :doc "Smart line-wrapping with wrap-prefix"
  :added "2020-12-02"
  :url "http://elpa.gnu.org/packages/adaptive-wrap.html"
  :ensure t
  :init
  ;; インデントに合わせて折り返し
  (define-globalized-minor-mode global-adaptive-wrap-prefix-mode
    adaptive-wrap-prefix-mode
    adaptive-wrap-prefix-mode)
  :global-minor-mode global-adaptive-wrap-prefix-mode)

(leaf flycheck
  :doc "On-the-fly syntax checking"
  :req "dash-2.12.1" "pkg-info-0.4" "let-alist-1.0.4" "seq-1.11" "emacs-24.3"
  :tag "tools" "languages" "convenience" "emacs>=24.3"
  :added "2020-12-02"
  :url "http://www.flycheck.org"
  :emacs>= 24.3
  :ensure t
  :preface (add-hook 'prog-mode-hook #'flycheck-mode)
  :config

  (leaf flycheck-pos-tip
    :doc "Display Flycheck errors in GUI tooltips"
    :req "emacs-24.1" "flycheck-0.22" "pos-tip-0.4.6"
    :tag "convenience" "tools" "emacs>=24.1"
    :added "2020-12-17"  :init
    ;; (telephone-line-defsegment telephone-line-nil-segment () "")
    ;; :global-minor-mode telephone-line-mode
    ;; :custom
    ;; ((telephone-line-height . 14)
    ;;  (telephone-line-faces .
    ;;			 '((evil . (mode-line-inactive . mode-line-inactive))
    ;;			   (accent . (telephone-line-accent-active . telephone-line-accent-inactive))
    ;;			   (nil . (mode-line . mode-line-inactive))))

    ;;  ;; Left edge
    ;;  (telephone-line-lhs .  :init
    ;; (telephone-line-defsegment telephone-line-nil-segment () "")
    ;; :global-minor-mode telephone-line-mode
    ;; :custom
    ;; ((telephone-line-height . 14)
    ;;  (telephone-line-faces .
    ;;			 '((evil . (mode-line-inactive . mode-line-inactive))
    ;;			   (accent . (telephone-line-accent-active . telephone-line-accent-inactive))
    ;;			   (nil . (mode-line . mode-line-inactive))))

    ;;  ;; Left edge
    ;;  (telephone-line-lhs .
    ;;		       '((nil . ((telephone-line-window-number-segment t)
    ;;				 telephone-line-input-info-segment))
    ;;			 (accent . (telephone-line-projectile-buffer-segment
    ;;				    telephone-line-buffer-modified-segment))
    ;;			 (evil . (telephone-line-simple-major-mode-segment
    ;;				  telephone-line-simple-minor-mode-segment
    ;;				  telephone-line-nil-segment))))
    ;;  ;; Right edge
    ;;  (telephone-line-rhs .
    ;;		       '((evil . (telephone-line-atom-encoding-segment
    ;;				  telephone-line-misc-info-segment))
    ;;			 (accent . (telephone-line-flycheck-segment
    ;;				    (telephone-line-vc-segment :acti
    ;;		       '((nil . ((telephone-line-window-number-segment t)
    ;;				 telephone-line-input-info-segment))
    ;;			 (accent . (telephone-line-projectile-buffer-segment
    ;;				    telephone-line-buffer-modified-segment))
    ;;			 (evil . (telephone-line-simple-major-mode-segment
    ;;				  telephone-line-simple-minor-mode-segment
    ;;				  telephone-line-nil-segment))))
    ;;  ;; Right edge
    ;;  (telephone-line-rhs .
    ;;		       '((evil . (telephone-line-atom-encoding-segment
    ;;				  telephone-line-misc-info-segment))
    ;;			 (accent . (telephone-line-flycheck-segment
    ;;				    (telephone-line-vc-segment :acti
    :url "https://github.com/flycheck/flycheck-pos-tip"
    :emacs>= 24.1
    :ensure t
    :after flycheck pos-tip
    :when window-system
    :hook flycheck-mode-hook
    :custom
    (flycheck-pos-tip-timeout . 0))

  (leaf flycheck-popup-tip
    :doc "Display Flycheck error messages using popup.el"
    :req "flycheck-0.22" "popup-0.5" "emacs-24"
    :tag "tooltip" "flycheck" "tools" "convenience" "emacs>=24"
    :added "2020-12-04"
    :url "https://github.com/flycheck/flycheck-popup-tip/"
    :emacs>= 24
    :ensure t
    :after flycheck
    :when (not window-system)
    :hook flycheck-mode-hook))

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

(leaf lean-mode
  :doc "A major mode for the Lean language"
  :req "emacs-24.3" "dash-2.12.0" "dash-functional-1.2.0" "s-1.10.0" "f-0.19.0" "flycheck-30"
  :tag "languages" "emacs>=24.3"
  :added "2021-01-09"
  :url "https://github.com/leanprover/lean-mode"
  :emacs>= 24.3
  :ensure t
  :after flycheck
  :hook (lean-mode-hook . lsp))

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
  :global-minor-mode global-company-mode
  :defun company-sort-by-statistics
  :custom
  ((company-idle-delay . 0)
   (company-minimum-prefix-length . 1)
   (company-quickhelp-mode . -1)
   (company-show-numbers . t)
   (company-transformers .
			 (company-sort-by-backend-importance
			  company-sort-by-statistics
			  company-sort-by-occurrence))
   (company-require-match . nil)
   (company-backends .
		     '(company-capf
		       (company-tabnine
			company-yasnippet
			:with
			company-capf
			company-dabbrev
			company-dabbrev-code
			company-files
			company-gtags
			company-etags
			company-keywords)
		       ;; (company-yasnippet :with company-dabbrev)
		       ;; (company-yasnippet :with company-bbdb)
		       ;; (company-yasnippet :with company-eclim)
		       ;; (company-yasnippet :with company-semantic)
		       ;; (company-yasnippet :with company-clang)
		       ;; (company-yasnippet :with company-xcode)
		       ;; (company-yasnippet :with company-cmake)
		       ;; (company-yasnippet :with company-files)
		       ;; (company-yasnippet :with company-oddmuse)
		       ;; (company-yasnippet :with company-capf)
		       )))
  :config
  (leaf company-statistics
    :doc "Sort candidates using completion history"
    :req "emacs-24.3" "company-0.8.5"
    :tag "matching" "convenience" "abbrev" "emacs>=24.3"
    :added "2020-12-04"
    :url "https://github.com/company-mode/company-statistics"
    :emacs>= 24.3
    :ensure t
    :after company
    :commands company-sort-by-statistics
    :hook company-mode)

  (leaf company-flx
    :doc "flx based fuzzy matching for company"
    :req "emacs-24" "company-0.8.12" "flx-0.5"
    :tag "flx" "fuzzy" "company" "convenience" "emacs>=24"
    :added "2020-12-03"
    :url "https://github.com/PythonNut/company-flx"
    :emacs>= 24
    :ensure t
    :after company flx
    :global-minor-mode company-flx-mode)

  (leaf company-tabnine
    :doc "A company-mode backend for TabNine"
    :req "emacs-25" "company-0.9.3" "cl-lib-0.5" "dash-2.16.0" "s-1.12.0" "unicode-escape-1.1"
    :tag "convenience" "emacs>=25"
    :added "2020-12-07"
    :url "https://github.com/TommyX12/company-tabnine/"
    :emacs>= 25
    :ensure t
    :after company unicode-escape))

(leaf yasnippet
  :doc "Yet another snippet extension for Emacs."
  :req "cl-lib-0.5"
  :tag "emulation" "convenience"
  :added "2020-12-02"
  :url "http://github.com/joaotavora/yasnippet"
  :ensure t
  :blackout t
  :global-minor-mode yas-global-mode
  :config
  (leaf yasnippet-snippets
    :doc "Collection of yasnippet snippets"
    :req "yasnippet-0.8.0"
    :tag "snippets"
    :added "2020-12-07"
    :ensure t
    :after yasnippet))


;; (leaf lispy
;;   :doc "vi-like Paredit"
;;   :req "emacs-24.1" "ace-window-0.8.0" "hydra-0.12.1" "iedit-0.97" "multiple-cursors-1.3.0" "swiper-0.2.0"
;;   :tag "emacs>=24.1"
;;   :added "2020-12-07"
;;   :emacs>= 24.1
;;   :ensure t
;;   :after ace-window hydra iedit multiple-cursors swiper
;;   :hook emacs-lisp-mode
;;   :bind
;;   ;; (:lispy-mode-map
;;   ;;  ;; ([remap lispy-yank] . undo-tree-redo)
;;   ;; ("M-m" . nil))
;;   :config
;;   ;; (bind-keys
;;   ;;  :map lispy-mode-map
;;   ;;  ("M-m" . nil))
;;   (leaf lispyville
;;     :doc "A minor mode for integrating evil with lispy."
;;     :req "lispy-0" "evil-1.2.12" "cl-lib-0.5" "emacs-24.4"
;;     :tag "parentheses" "lisp" "lispy" "evil" "vim" "emacs>=24.4"
;;     :added "2021-05-28"
;;     :url "https://github.com/noctuid/lispyville"
;;     :emacs>= 24.4
;;     :ensure t
;;     :after lispy evil
;;     :hook lispy-mode))
;; (eval-after-load 'lispy
;;   '(bind-keys :map lispy-mode-map
;; 	      ;; ([remap lispy-yank] . undo-tree-redo)
;; 	      ("M-m" . nil)))

(leaf flymake
  :doc "A universal on-the-fly syntax checker"
  :tag "builtin"
  :added "2020-12-28"
  :custom
  (flymake-run-in-place . nil))


(leaf reformatter
  :doc "Define commands which run reformatters on the current buffer"
  :req "emacs-24.3"
  :tag "tools" "convenience" "emacs>=24.3"
  :added "2021-06-09"
  :url "https://github.com/purcell/emacs-reformatter"
  :emacs>= 24.3
  :ensure t)


(leaf lsp-mode
  :doc "LSP mode"
  :req "emacs-25.1" "dash-2.14.1" "dash-functional-2.14.1" "f-0.20.0" "ht-2.0" "spinner-1.7.3"
  :tag "languages" "emacs>=25.1"
  :added "2020-12-08"
  :emacs>= 25.1
  :ensure t
  :after spinner
  ;; :require t
  :preface (add-hook 'prog-major-mode-hook #'lsp-prog-major-mode-enable)
  :custom
  (lsp-prefer-flymake . nil)
  :bind
  (:mode-specific-map
   ("f" . lsp-format-buffer))
  :config
  (add-to-list 'lsp-language-id-configuration '(lean-mode . "lean"))
  (lsp-register-client
   (make-lsp-client
    :new-connection (lsp-stdio-connection '("npx" "lean-language-server" "--stdio"))
    :activation-fn (lsp-activate-on "lean")
    :server-id 'lean-ls))


  (leaf lsp-ui
    :doc "UI modules for lsp-mode"
    :req "emacs-25.1" "dash-2.14" "dash-functional-1.2.0" "lsp-mode-6.0" "markdown-mode-2.3"
    :tag "lsp" "emacs>=25.1"
    :added "2020-12-08"
    :url "https://github.com/emacs-lsp/lsp-ui"
    :emacs>= 25.1
    :ensure t
    :after lsp-mode markdown-mode
    :preface (add-hook 'lsp-mode-hook #'lsp-ui-mode)
    :custom
    (lsp-ui-doc-enable . nil))

  (leaf lsp-ivy
    :doc "LSP ivy integration"
    :req "emacs-25.1" "dash-2.14.1" "lsp-mode-6.2.1" "ivy-0.13.0"
    :tag "debug" "languages" "emacs>=25.1"
    :added "2021-05-28"
    :url "https://github.com/emacs-lsp/lsp-ivy"
    :emacs>= 25.1
    :ensure t
    :after lsp-mode ivy)

  (leaf lsp-haskell
    :doc "Haskell support for lsp-mode"
    :req "lsp-mode-3.0" "haskell-mode-1.0"
    :tag "haskell"
    :added "2020-12-08"
    :url "https://github.com/emacs-lsp/lsp-haskell"
    :ensure t
    :after lsp-mode haskell-mode
    :preface
    (add-hook 'haskell-mode-hook #'lsp)
    (add-hook 'haskell-literate-mode-hook #'lsp)
    :custom
    ;; (lsp-haskell-process-path-hie . "haskell-language-server-wrapper")
    ))

(leaf haskell-mode
  :doc "A Haskell editing mode"
  :req "emacs-24.3"
  :tag "repl" "ghc" "cabal" "haskell" "emacs>=24.3"
  :added "2020-12-15"
  :url "https://github.com/haskell/haskell-mode"
  :emacs>= 24.3
  :ensure t
  :custom
  (haskell-program-name . "stack repl"))


(leaf subword
  :doc "Handling capitalized subwords in a nomenclature"
  :tag "builtin"
  :added "2020-12-17"
  :hook
  haskell-mode-hook
  idris-mode-hook)


(leaf yaml-mode
  :doc "Major mode for editing YAML files"
  :req "emacs-24.1"
  :tag "yaml" "data" "emacs>=24.1"
  :added "2020-12-18"
  :emacs>= 24.1
  :ensure t)


(leaf idris-mode
  :doc "Major mode for editing Idris code"
  :req "emacs-24" "prop-menu-0.1" "cl-lib-0.5"
  :tag "languages" "emacs>=24"
  :added "2021-01-29"
  :url "https://github.com/idris-hackers/idris-mode"
  :emacs>= 24
  :ensure t
  :after prop-menu)

;; ;; R
;; (leaf ess
;;   :doc "Emacs Speaks Statistics"
;;   :req "emacs-25.1"
;;   :tag "emacs>=25.1"
;;   :added "2021-06-09"
;;   :url "https://ess.r-project.org/"
;;   :emacs>= 25.1
;;   :ensure t
;;   :require reformatter
;;   :defun r-format r-format-on-save-mode r-format-on-save r-format-region evil-r-format
;;   :init
;;   (reformatter-define r-format
;;     :stdin nil
;;     :program "R"
;;     :args `("--slave" "-e" ,(concat "library(formatR); tidy_source(source = \"" input-file "\")")))

;;   (evil-define-operator evil-r-format (beg end)
;;     "Format R code."
;;     :repeat nil
;;     (r-format-region beg end))

;;   :hook (ess-mode-hook . r-format-on-save)
;;   :bind
;;   (:ess-mode-map
;;    ([remap eval-region] . ess-eval-region)
;;    ([remap evil-indent] . evil-r-format))
;;   :config
;;   (leaf ess-view-data
;;     :doc "View Data"
;;     :req "emacs-26.1" "ess-18.10.1" "csv-mode-1.12"
;;     :tag "tools" "emacs>=26.1"
;;     :added "2021-06-09"
;;     :url "https://github.com/ShuguangSun/ess-view-data"
;;     :emacs>= 26.1
;;     :ensure t
;;     :after ess csv-mode))


(leaf smartparens
  :doc "Automatic insertion, wrapping and paredit-like navigation with user defined pairs."
  :req "dash-2.13.0" "cl-lib-0.3"
  :added "2020-12-02"
  :ensure t
  :blackout t
  :require t
  :global-minor-mode
  smartparens-global-mode
  show-smartparens-global-mode
  :config
  ;; enable smartparens
  (sp-with-modes '(emacs-lisp-mode
		   lisp-mode
		   lisp-interaction-mode)
    (sp-local-pair "'" nil :actions nil)
    (sp-local-pair "`" nil :actions nil))
  (sp-pair "⟨" "⟩")
  
  (leaf evil-cleverparens
    :doc "Evil friendly minor-mode for editing lisp."
    :req "evil-1.0" "paredit-1" "smartparens-1.6.1" "emacs-24.4" "dash-2.12.0"
    :tag "smartparens" "paredit" "evil" "parentheses" "cleverparens" "emacs>=24.4"
    :added "2021-06-09"
    :url "https://github.com/luxbock/evil-cleverparens"
    :emacs>= 24.4
    :ensure t
    :after evil paredit smartparens
    ;; :init
    ;; (define-globalized-minor-mode global-evil-cleverparens-mode
    ;;   evil-cleverparens-mode evil-cleverparens-mode)
    :global-minor-mode evil-cleverparens-mode
    :bind
    (:evil-cleverparens-mode-map
     ("<normal-state> M-y" . nil))
    :custom
    (evil-cleverparens-use-regular-insert . t)
    (evil-cleverparens-use-additional-movement-keys . nil)))

(leaf origami
  :doc "Flexible text folding"
  :req "s-1.9.0" "dash-2.5.0" "emacs-24" "cl-lib-0.5"
  :tag "folding" "emacs>=24"
  :added "2020-12-17"
  :url "https://github.com/gregsexton/origami.el"
  :emacs>= 24
  :ensure t
  :blackout t
  :global-minor-mode global-origami-mode
  :bind
  (:mode-specific-map
   ("@ C-c" . origami-forward-toggle-node)
   ("@ C-a" . origami-toggle-all-nodes)))

(leaf dired
  :doc "directory-browsing commands"
  :tag "builtin" "files"
  :added "2020-12-02"
  :bind
  (:dired-mode-map
   ("z" . dired-atool-do-unpack)
   ("Z" . dired-atool-do-pack))
  :config
  (put 'dired-find-alternate-file 'disabled nil))

(leaf eww
  :doc "Emacs Web Wowser"
  :tag "builtin"
  :added "2020-12-02"
  :custom
  ;; ewwのデフォルトのエンジンをgoogleに
  ((eww-search-prefix . "https://www.google.co.jp/search?q=")))

(leaf auto-sudoedit
  :doc "Auto sudo edit by tramp"
  :req "emacs-24.4" "f-0.19.0"
  :tag "emacs>=24.4"
  :added "2021-01-29"
  :url "https://github.com/ncaq/auto-sudoedit"
  :emacs>= 24.4
  :ensure t
  :global-minor-mode auto-sudoedit-mode)

(leaf magit
  :doc "A Git porcelain inside Emacs."
  :req "emacs-25.1" "async-20200113" "dash-20200524" "git-commit-20200516" "transient-20200601" "with-editor-20200522"
  :tag "vc" "tools" "git" "emacs>=25.1"
  :added "2020-12-28"
  :url "https://github.com/magit/magit"
  :emacs>= 25.1
  :ensure t
  :after git-commit with-editor
  :config

  (leaf diff-hl
    :doc "Highlight uncommitted changes using VC"
    :req "cl-lib-0.2" "emacs-24.3"
    :tag "diff" "vc" "emacs>=24.3"
    :added "2020-12-28"
    :url "https://github.com/dgutov/diff-hl"
    :emacs>= 24.3
    :ensure t
    :global-minor-mode global-diff-hl-mode
    :hook
    ((magit-pre-refresh-hook . diff-hl-magit-pre-refresh)
     (magit-post-refresh-hook . diff-hl-magit-post-refresh)))

  (leaf gitignore-mode
    :doc "Major mode for editing .gitignore files"
    :tag "git" "vc" "convenience"
    :added "2020-12-16"
    :url "https://github.com/magit/git-modes"
    :ensure t))

(leaf *goto-line-beginning-indent
  :tag "out-of-MELPA"
  :added "2020-12-02"
  :bind (:global-map
	 ([remap move-beginning-of-line] . my-goto-line-beginning-or-indent))
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
   ;; ([remap delete-forward-char] . smart-hungry-delete-forward-char)
   ([remap delete-backward-char] . smart-hungry-delete-backward-char)))

;; (leaf cua-base
;;   :doc "emulate CUA key bindings"
;;   :tag "builtin"
;;   :added "2020-12-07"
;;   :global-minor-mode cua-mode
;;   ;; :bind
;;   ;; (:cua-global-keymap
;;   ;;  ("M-y" . counsel-yank-pop))
;;   )

(leaf transpose-mark
  :doc "Transpose data using the Emacs mark"
  :tag "convenience" "transpose"
  :added "2020-12-28"
  :ensure t
  :preface
  :bind
  (:global-map
   ("C-m" . transpose-mark)))

;; (setq show-paren-style 'mixed)
;; (setq show-paren-when-point-inside-paren t)
;; (setq show-paren-when-point-in-periphery nil)

;;; init.el ens here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(amx-history-length 50)
 '(auto-save-file-name-transforms '((".*" "~/.emacs.d/backups" t)))
 '(backup-directory-alist '(("." . "~/.emacs.d/backups")))
 '(company-backends
   '(company-capf
     (company-tabnine company-yasnippet :with company-capf company-dabbrev company-dabbrev-code company-files company-gtags company-etags company-keywords)))
 '(company-idle-delay 0)
 '(company-minimum-prefix-length 1)
 '(company-quickhelp-mode -1 t)
 '(company-require-match nil)
 '(company-show-numbers t)
 '(company-sort-by-backend-importance nil t)
 '(company-sort-by-occurrence nil t)
 '(company-sort-by-statistics nil t)
 '(company-transformers nil)
 '(cursor-type '(bar . 1))
 '(custom-safe-themes
   '("27a1dd6378f3782a593cc83e108a35c2b93e5ecc3bd9057313e1d88462701fcd" "b73a23e836b3122637563ad37ae8c7533121c2ac2c8f7c87b381dd7322714cd0" "eb3ef63dc31fbebb37df3646fbc1e07f25159d19bb1cade2a80000a2764690de" "171d1ae90e46978eb9c342be6658d937a83aaa45997b1d7af7657546cae5985b" default))
 '(desktop-save-mode t)
 '(display-time-default-load-average nil)
 '(evil-default-cursor 'bar)
 '(evil-insert-state-cursor '(bar . 1) t)
 '(evil-normal-state-cursor 'box t)
 '(evil-undo-system 'undo-tree)
 '(evil-visual-state-cursor 'box t)
 '(eww-search-prefix "https://www.google.co.jp/search?q=" t)
 '(flymake-run-in-place nil t)
 '(fringe-mode '(nil . 0) nil (fringe))
 '(haskell-program-name "stack repl" t)
 '(highlight-indent-guides-delay 0)
 '(highlight-indent-guides-highlighter-function 'rainbow-indent-highlighter)
 '(highlight-indent-guides-method 'character)
 '(highlight-indent-guides-responsive 'top)
 '(imenu-list-position 'left)
 '(imenu-list-size 20)
 '(ivy-height 40)
 '(ivy-initial-inputs-alist nil)
 '(ivy-re-builders-alist '((t . ivy--regex-ignore-order)) t)
 '(linum-format " %4d")
 '(load-prefer-newer t)
 '(lsp-haskell-process-path-hie "haskell-language-server-8.8.4" t)
 '(lsp-prefer-flymake nil t)
 '(lsp-ui-doc-enable nil t)
 '(org-agenda-files '(org-directory) t)
 '(org-default-notes-file "notes.org" t)
 '(org-directory "~/Desktop/org/" t)
 '(package-archives
   '(("org" . "https://orgmode.org/elpa/")
     ("melpa" . "https://melpa.org/packages/")
     ("melpa-stable" . "http://stable.melpa.org/packages/")
     ("gnu" . "https://elpa.gnu.org/packages/")))
 '(package-selected-packages
   '(ess-view-data reformatter counsel avy cliphist evil-cleverparens ess company-ghc lsp-mode lsp-ivy eglot yasnippet-snippets yaml-mode which-key vimrc-mode undo-tree transpose-mark telephone-line switch-window spaceline smartparens smart-hungry-delete shackle session rainbow-delimiters projectile powerline-evil ov origami one-themes multiple-cursors moe-theme magit lsp-ui lsp-haskell lean-mode leaf-tree leaf-convert ivy-rich idris-mode htmlize highlight-indent-guides gitignore-mode ghub fringe-helper flycheck-pos-tip evil-surround diff-hl company-tabnine company-statistics company-flx blackout bind-key backup-each-save auto-sudoedit amx adaptive-wrap))
 '(rainbow-delimiters-outermost-only-face-count 1)
 '(recentf-auto-cleanup 'never)
 '(session-use-package t nil (session))
 '(shackle-lighter "" t)
 '(shackle-rules
   '(("*Agenda Commands*" :aline right :ratio 0.3)
     ("*Org Agenda*" :aline right :ratio 0.3)
     ("*Help*" :align bottom :ratio 0.3)))
 '(switch-window-minibuffer-shortcut 122 t)
 '(switch-window-threshold 3 t)
 '(uim-candidate-display-frame t t)
 '(uim-candidate-display-inline t t)
 '(uim-preedit-display-fences t t)
 '(warning-suppress-types '((comp) (comp)))
 '(whitespace-display-mappings
   '((space-mark 32
		 [183]
		 [46])
     (space-mark 12288
		 [9633])
     (space-mark 160
		 [164]
		 [95])
     (space-mark 9
		 [10236 9]
		 [92 9])
     (space-mark 10
		 [172 10])) t)
 '(whitespace-space-regexp "\\(　+\\)" t)
 '(winner-dont-bind-my-keys t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(highlight-indent-guides-top-character-face ((t (:inherit mode-line-face :invert t))) nil "Customized with leaf in `highlight-indent-guides' block at `/home/linguini/.emacs.d/init.el'")
 '(rainbow-delimiters-depth-1-face ((t (:foreground "#9a4040" :bold t))) nil "Customized with leaf in `rainbow-delimiters' block at `/home/linguini/.emacs.d/init.el'")
 '(rainbow-delimiters-depth-2-face ((t (:foreground "#ff5e5e" :bold t))) nil "Customized with leaf in `rainbow-delimiters' block at `/home/linguini/.emacs.d/init.el'")
 '(rainbow-delimiters-depth-3-face ((t (:foreground "#ffaa77" :bold t))) nil "Customized with leaf in `rainbow-delimiters' block at `/home/linguini/.emacs.d/init.el'")
 '(rainbow-delimiters-depth-4-face ((t (:foreground "#dddd77" :bold t))) nil "Customized with leaf in `rainbow-delimiters' block at `/home/linguini/.emacs.d/init.el'")
 '(rainbow-delimiters-depth-5-face ((t (:foreground "#80ee80" :bold t))) nil "Customized with leaf in `rainbow-delimiters' block at `/home/linguini/.emacs.d/init.el'")
 '(rainbow-delimiters-depth-6-face ((t (:foreground "#66bbff" :bold t))) nil "Customized with leaf in `rainbow-delimiters' block at `/home/linguini/.emacs.d/init.el'")
 '(rainbow-delimiters-depth-7-face ((t (:foreground "#da6bda" :bold t))) nil "Customized with leaf in `rainbow-delimiters' block at `/home/linguini/.emacs.d/init.el'")
 '(rainbow-delimiters-depth-8-face ((t (:foreground "#afafaf" :bold t))) nil "Customized with leaf in `rainbow-delimiters' block at `/home/linguini/.emacs.d/init.el'")
 '(rainbow-delimiters-depth-9-face ((t (:foreground "#f0f0f0" :bold t))) nil "Customized with leaf in `rainbow-delimiters' block at `/home/linguini/.emacs.d/init.el'"))
