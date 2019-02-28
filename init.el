;; package --- Summary
;;; Commentary:
;;; Code:

;; (setenv "LANG" "ja_JP.UTF-8")
;; (when load-file-name
;;   (setq user-emacs-directory
;;	(file-name-directory
;;	 load-file-name)))
(require  #'package)
(setq package-enable-at-startup nil)
;; MELPAを追加
(add-to-list  #'package-archives #'("melpa" . "https://melpa.org/packages/") t)
;; MELPA-stableを追加
(add-to-list  #'package-archives #'("melpa-stable" . "https://stable.melpa.org/packages/") t)
;; Marmaladeを追加
(add-to-list  #'package-archives  #'("marmalade" . "http://marmalade-repo.org/packages/") t)
;; Orgを追加
(add-to-list  #'package-archives #'("org" . "http://orgmode.org/elpa/") t)
;; emacswikiを追加
;; (add-to-list  #'package-archives #'("emacswiki" . "http://www.emacswiki.org/emacs/download/") t)

(setq package-check-signature nil)
;;初期化
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/mylisp")

(load-file
 "~/.emacs.d/packages.el")


(set-language-environment
 "Japanese")

(prefer-coding-system 'utf-8)
(setq coding-system-for-read
      'utf-8)
(setq coding-system-for-write
      'utf-8)

(require #'rainbow-delimiters)
(require #'srefactor-lisp)
(require #'general)
(require #'winum)
(require #'telephone-line)
(require #'flycheck-popup-tip)
(require #'jedi)
(require #'company-jedi)
(require #'highlight-indent-guides)
(require #'switch-window)
(require #'uim)
(require #'generic-x)
(require #'rust-mode)
(require #'cargo)
(require #'racer)
(require #'flycheck-rust)
(require #'elpy)
(require #'pipenv)
(require #'company-lua)
(require #'lua-mode)
(require #'diminish)
(require #'whitespace)
(require #'smartparens)
(require #'ivy-rich)
(require #'avy)
(require #'ox-latex)
(require #'ox-bibtex)
(require #'shackle)
(require #'ov)
(require #'calfw-org)
(require #'git-gutter-fringe+)
(require #'tuareg)
(require #'merlin)
(require #'merlin-eldoc)

(if window-system
    (progn
      (require #'exwm)
      (require #'exwm-randr)
      ;; (require #'gpastel)
      ))

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(setq custom-safe-themes t)
(load-theme 'my-moe-dark t)


;; Turn on `display-time-mode' if you don't use an external bar.
(setq display-time-default-load-average nil)
(display-time-mode nil)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)


(setq linum-format " %4d")


(setq switch-window-threshold 2)
(setq switch-window-minibuffer-shortcut ?z)

;; (add-to-list 'load-path "/home/linguini/.emacs.d/elpa/ibus-el-0.3.29")
;; (require  #'ibus)

;; (add-hook 'after-init-hook 'ibus-mode-on)

;; (setq mozc-helper-program-name "home/linguini/.cache/yay/mozc/pkg/emacs-mozc/usr/bin/mozc_emacs_helper")
;; (require #'mozc)
;; (setq default-input-method "japanese-mozc")
;; (setq mozc-candidate-style 'overlay)

(setq uim-candidate-display-inline t)
(setq uim-preedit-display-fences t)
(setq uim-candidate-display-frame t)
(define-globalized-minor-mode global-uim-mode
  uim-mode
  uim-mode)
(global-uim-mode t)

;; (package-install 'ddskk)
;; (require  #'skk)
;; ;; M-x skk-tutorialでNo file found as 〜とエラーが出たときにskk-tut-fileを設定
;; ;; make what-whereでSKK tutorialsで表示されるディレクトリ上のSKK.tutを指定
;; (setq skk-tut-file "/usr/share/skk/SKK.tut"); ; (setq SKK_DATADIR "/usr/share/skk")
;; (setq skk-show-annotation nil)
;; (setq skk-show-inline 'vertical)
;; (setq skk-auto-insert-paren t)
;; (setq skk-egg-like-newline t)
(setq recentf-auto-cleanup 'never)

;; (setq c-mode-common-hook nil)
(add-hook 'c-mode-common-hook 'flycheck-mode t)


;;This snippet enables lua-mode
;; This line is not necessary, if lua-mode.el is already on your load-path

(autoload 'lua-mode "lua-mode" "Lua editing mode."
  t)
(add-to-list 'interpreter-mode-alist
	     '("lua" . lua-mode))
(add-to-list 'auto-mode-alist
	     '("\\.lua$" . lua-mode))

(package-install #'company-lua)

(defun my-lua-mode-company-init ()
  (setq-local company-backends
	      '((company-yasnippet :with
				   company-lua
				   company-dabbrev
				   company-files
				   company-dabbrev-code
				   company-gtags
				   company-etags
				   company-keywords))))

(add-hook 'lua-mode-hook #'my-lua-mode-company-init)

(eval-after-load 'flymake
  '(progn
     (add-to-list 'flymake-allowed-file-name-masks '(".+\\.sml$"
                                                     (lambda ()
                                                       (list "/usr/local/bin/smlsharp" (list "-ftypecheck-only" (buffer-file-name))))
                                                     (lambda () nil)))
     (add-to-list 'flymake-err-line-patterns '("^\\([^: ]*\\):\\([0-9]+\\)\\.\\([0-9]+\\)-[0-9]+\\.[0-9]+ \\(Error\\|Warning\\):"
                                               1 2 3 4))))
;; (add-hook 'sml-mode-hook #'flymake-mode)

;; (flycheck-define-checker smlsharp
;;   "A SMLsharp syntax checker using the `SMLsharp -ftype-only` command."
  
;;   :command ("smlsharp" "-ftypecheck-only" source)
;;   :error-patterns
;;   ((error line-start (file-name) ":" line "." column "-" line "." column " Error:\n"
;; 	  (message) "\n" line-end))
;;   :modes sml-mode)
;; (add-to-list 'flycheck-checkers 'smlsharp)

(load "flycheck-smlsharp.el")

(font-lock-add-keywords 'sml-mode
			'(("|" . 'font-lock-keyword-face)))

(defun my-c-mode-common-hook ()
  "."
  ;; コメント形式
  (setq comment-start "// ")
  (setq comment-end ""))
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)


(add-hook 'nim-mode-hook 'nimsuggest-mode)

(global-auto-revert-mode t)

(defun nimpretty ()
  (interactive)
  (shell-command-to-string
   (mapconcat #'shell-quote-argument
	      (list "nimpretty" (buffer-file-name)) " ")))

(defun nimpretty-on-save ()
  (interactive)
  (save-buffer)
  (nimpretty)
  (save-buffer))

(setq nim-indent-offset 4)

(defun nim-mode-company-init ()
  (add-to-list 'company-backends
	       '(company-yasnippet :with company-nimsuggest
				   company-dabbrev
				   company-files
				   company-dabbrev-code
				   company-gtags
				   company-etags
				   company-keywords)))

;; (add-hook 'nim-mode-hook #'nim-mode-company-init)

(add-hook 'prog-mode-hook #'flycheck-mode)

;; (require #'flycheck)

;; (defun flycheck-ignore-setup-failure ()
;;   (ignore-errors (flycheck-mode)))

;; (define-globalized-minor-mode global-flycheck-mode-ignore-failure
;;   flycheck-mode flycheck-ignore-setup-failure)
;; (global-flycheck-mode-check-buffers)
;; (global-flycheck-mode-ignore-failure t)

;; (require #'flymake)
;; (flymake-mode t)
;; ;;errorやwarningを表示する
;; (package-install #'flymake-python-pyflakes)
;; (require 'flymake-python-pyflakes)
;; (flymake-python-pyflakes-load)


(use-package cider
  :init
  (add-hook 'cider-mode-hook #'clj-refactor-mode)
					;(add-hook 'cider-mode-hook #'company-mode)
  (add-hook 'cider-mode-hook #'eldoc-mode)
					;(add-hook 'cider-repl-mode-hook #'company-mode)
  (add-hook 'cider-repl-mode-hook #'eldoc-mode)
  (add-hook 'cider-repl-mode-hook #'cider-company-enable-fuzzy-completion)
  (add-hook 'cider-mode-hook #'cider-company-enable-fuzzy-completion)
  :diminish subword-mode
  :config
  (setq nrepl-log-messages t
	cider-repl-display-in-current-window t
	cider-repl-use-clojure-font-lock t
	cider-prompt-save-file-on-load 'always-save
	cider-font-lock-dynamically '(macro core function var)
	cider-overlays-use-font-lock t)
  (cider-repl-toggle-pretty-printing))

(add-hook 'emacs-lisp-mode-hook #'lispy-mode)
(add-hook 'clojure-mode-hook #'lispy-mode)


(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook 'flycheck-popup-tip-mode))
;; (package-install #'flycheck-pycheckers)
;; (require #'flycheck-pycheckers)

;;(setq py-autopep8-options '("--max-line-length=200"))
;;(setq flycheck-flake8-maximum-line-length 200)

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

;; (setq-local company-backends
;;	    '(company-jedi company-files elpy-company-backend))


(add-hook 'python-mode-hook #'pipenv-mode)


(elpy-enable)
;; (package-install #'virtualenvwrapper)
;; (package-install #'auto-virtualenvwrapper)
;; (require 'virtualenvwrapper)
;; (require 'auto-virtualenvwrapper)
;; (add-hook 'python-mode-hook #'auto-virtualenvwrapper-activate)


(add-hook 'rust-mode-hook 'cargo-minor-mode)
(setq rust-format-on-save t)
(with-eval-after-load 'rust-mode
  (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))
(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)
(add-hook 'racer-mode-hook #'company-mode)
(setq company-tooltip-align-annotations t)
(add-hook 'flycheck-mode-hook #'flycheck-rust-setup)


(defun my-arduino-mode-company-init ()
  (setq-local company-backends
	      '((company-yasnippet :with
				   company-arduino
				   company-dabbrev
				   company-files
				   company-dabbrev-code
				   company-gtags
				   company-etags
				   company-keywords))))

(add-hook 'arduino-mode 'may-arduino-company-init)

(autoload 'tuareg-mode "tuareg" "Major mode for editing OCaml code" t)
(autoload 'tuareg-run-ocaml "tuareg" "Run an inferior OCaml process." t)
(autoload 'ocamldebug "ocamldebug" "Run the OCaml debugger" t)
(autoload 'merlin-mode "merlin" "Merlin mode" t)

(with-eval-after-load 'merlin
  ;; Disable Merlin's own error checking
  (setq merlin-error-after-save nil)

  ;; Enable Flycheck checker
  (flycheck-ocaml-setup))

(add-hook 'tuareg-mode-hook 'merlin-mode)
;; (add-hook 'caml-mode-hook 'merlin-mode)

;; (require #'indent-guide)
;; (set-face-foreground #'indent-guide-face "LightGrey")
;; (setq indent-guide-recursive nil)

;; (indent-guide-global-mode)

(setq highlight-indent-guides-method 'character)
;; (setq highlight-indent-guides-character ?\|)
(setq highlight-indent-guides-character ?\x0020)
(setq highlight-indent-guides-delay 0)
(setq highlight-indent-guides-responsive 'top)
;; (setq rainbow-indent-highlighter-count 9)

;; (defun rainbow-indent-highlighter (level responsive display)
;;   (cond
;;    ((null responsive)
;;     (concat "rainbow-delimiters-depth-"
;;	    (number-to-string
;;	     (if (<= (+ level 1) rainbow-delimiters-max-face-count)
;;		 ;; Our nesting depth has a face defined for it.
;;		 (+ level 1)
;;	       ;; Deeper than # of defined faces; cycle back through to
;;	       ;; `rainbow-delimiters-outermost-only-face-count' + 1.
;;	       ;; Return face # that corresponds to current nesting level.
;;	       (+ 1 rainbow-delimiters-outermost-only-face-count
;;		  (mod (- level rainbow-delimiters-outermost-only-face-count 1)
;;		       (- rainbow-delimiters-max-face-count
;;			  rainbow-delimiters-outermost-only-face-count)))))
;;	    "-face"))
;;    ((eq responsive 'top)
;;     'highlight-indent-guides-top-character-face)
;;    (t nil)))



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


(setq highlight-indent-guides-highlighter-function 'rainbow-indent-highlighter)

;; (add-hook #'prog-mode-hook #'highlight-indent-guides-mode)

(defun lisp-less-prog-mode-hook-highlight-indent-guides-mode ()
  (if (or (eq major-mode 'emacs-lisp-mode)
	  (eq major-mode 'clojure-mode)
	  (eq major-mode 'common-lisp-mode)
	  (eq major-mode 'dune-mode))
      (highlight-indent-guides-mode -1)
    (highlight-indent-guides-mode t)))

(add-hook 'prog-mode-hook 'lisp-less-prog-mode-hook-highlight-indent-guides-mode)


;; (remove-hook #'emacs-lisp-mode-hook #'highlight-indent-guides-mode t)

(diminish 'company-mode) ;; 自分でMinor Mode名を定義
(diminish 'ivy-mode) ;; 非表示設定（この例だとivyがMinor Mode欄から消える）
(diminish 'counsel-mode)
(diminish 'undo-tree-mode)
(diminish 'auto-sudoedit-mode)
(diminish 'highlight-indent-guides-mode)
(diminish 'projectile-mode)
(diminish 'centered-cursor-mode)
(diminish 'which-key-mode)
(diminish 'hs-minor-mode)
(diminish 'flycheck-mode)


(defun my/buffer-minchoize ()
  "Minchoize current buffer."
  (interactive)
  (ov (point-min) (point-max) 'face '(:family "umeMincho")))


(setq whitespace-space-regexp "\\(\u3000+\\)")
(setq whitespace-display-mappings
      '((space-mark ?\  [?·] [?.])
	(space-mark ?\u3000 [?\□])
	(space-mark ?\xA0 [?\u00A4] [?_])
	(space-mark ?\t [?⟼ ?\t] [?\\?\t])
	(space-mark ?\n [?\¬ ?\n])))

;; (setq org-mode-hook nil)

(add-hook 'rust-mode-hook
	  (lambda ()
	    (push '("=>" . ?⇒) prettify-symbols-alist)
	    (prettify-symbols-mode)))

(add-hook 'rust-mode-hook
	  (lambda ()
	    (adaptive-wrap-prefix-mode  -1)))

;; (defun my-rust-mode-company-init ()
;;   (setq-local company-backends
;; 	      '((company-yasnippet))))
;; (add-hook 'rust-mode-hook 'my-rust-mode-company-init)

(setq shackle-rules
      '(("*Agenda Commands*" :aline right :ratio 0.3)
	("*Org Agenda*" :aline right :ratio 0.3)
	("*Help*" :align right :ratio 0.3)))
(shackle-mode 1)
(setq shackle-lighter "")


;; (set-face-background 'highlight-indentation-face "#0000ff")
;; (set-face-background 'highlight-indentation-current-column-face "#ff0000")

;; ;;; org-mode
;; ;;;
;; ;; org-modeの初期化
;; (require 'org-install)
;; ;; キーバインドの設定
;; (general-define-key
;;  :keymap my-org-map
;;  "")
;; (define-key global-map "\C-cl" 'org-store-link)
;; (define-key global-map "\C-caq" 'org-agenda)
;; (define-key global-map "\C-cr" 'org-remember)
;; ;; 拡張子がorgのファイルを開いた時，自動的にorg-modeにする
;; (add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
;; ;; org-modeでの強調表示を可能にする
;; (add-hook 'org-mode-hook 'turn-on-font-lock)
;; ;; 見出しの余分な*を消す
;; (setq org-hide-leading-stars t)
;; org-default-notes-fileのディレクトリ
(setq org-directory "~/Desktop/org/")
;; org-default-notes-fileのファイル名
(setq org-default-notes-file "notes.org")

(setq org-agenda-files (list org-directory))




;;;LaTeX 形式のファイル PDF に変換するためのコマンド
(setq org-latex-pdf-process '("platex %f" "platex %f" "bibtex %b" "platex %f"
			      "platex %f" "dvipdfmx %b.dvi"))
;;;\hypersetup{...} を出力しない
;; (setq org-latex-with-hyperref nil)

(add-to-list 'org-latex-classes
	     '("thesis" "\\documentclass{jarticle}
		[NO-PACKAGES]
		[NO-DEFAULT-PACKAGES]
		\\usepackage[dvipdfmx]{graphicx}"
	       ("\\section{%s}" . "\\section*{%s}")
	       ("\\subsection{%s}" . "\\subsection*{%s}")
	       ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
	       ("\\paragraph{%s}" . "\\paragraph*{%s}")
	       ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))


;; (require #'twittering-mode)
;; (twittering-icon-mode 1)
;; (setq twittering-use-master-password t)

;;(package-install  #'w3m)


;; ace jump mode major function

(defun my-avy-goto-char (char &optional arg)
  "Jump to after the currently visible CHAR.
The window scope is determined by `avy-all-windows' (ARG negates it)."
  (interactive (list (read-char "char: " t)
		     current-prefix-arg))
  (avy-goto-char char arg)
  (forward-char 1)
  )

(winner-mode 1)




(global-company-mode t)
(setq company-idle-delay 0)
(with-eval-after-load 'company
  (company-flx-mode t))

(setq company-minimum-prefix-length 1)
;; (setq company-quickhelp-delay 0)
;; (set-face-attribute 'company-tooltip nil
;;                     : foreground "black" : background "lightgrey")
;; (set-face-attribute 'company-tooltip-common nil
;;                     : foreground "black" : background "lightgrey")
;; (set-face-attribute 'company-tooltip-common-selection nil
;;                     : foreground "white" : background "steelblue")
;; (set-face-attribute 'company-tooltip-selection nil
;;                     : foreground "black" : background "steelblue")
;; (set-face-attribute 'company-preview-common nil
;;                    : background nil : foreground "lightgrey" : underline t)
;; (set-face-attribute 'company-scrollbar-fg nil
;;                     : background "orange")
;; (set-face-attribute 'company-scrollbar-bg nil
;;                     : background "gray40")

(company-quickhelp-mode -1)
(setq company-backends
      '((company-yasnippet :with
			   company-capf
			   company-dabbrev
			   company-dabbrev-code
			   company-files
			   company-gtags
			   company-etags
			   company-keywords)
	(company-yasnippet :with company-dabbrev)
	(company-yasnippet :with company-bbdb)
	(company-yasnippet :with company-eclim)
	(company-yasnippet :with company-semantic)
	(company-yasnippet :with company-clang)
	(company-yasnippet :with company-xcode)
	(company-yasnippet :with company-cmake)
	(company-yasnippet :with company-files)
	(company-yasnippet :with company-oddmuse)
	(company-yasnippet :with company-capf)))

(company-statistics-mode)
(setq company-transformers '(company-sort-by-backend-importance
			     company-sort-by-statistics
			     company-sort-by-occurrence))

(setq company-require-match nil)

(yas-global-mode t)

;; ;; YASnippet のスニペットを候補に表示するための設定
;; (defvar company-mode/enable-yas t "Enable yasnippet for all backends.")
;; (defun company-mode/backend-with-yas (backend)
;;   (if (or (not company-mode/enable-yas)
;;	  (and (listp backend)
;;	       (member 'company-yasnippet backend)))
;;       backend
;;     (append (if (consp backend)
;;		backend
;;	      (list backend))
;;	    '(:with company-yasnippet))))
;; (defun set-yas-as-company-backend ()
;;   (setq company-backends (mapcar #'company-mode/backend-with-yas company-backends)))
;; (add-hook 'company-mode-hook 'set-yas-as-company-backend)

;; (package-install  #'auto-complete)
;; (global-auto-complete-mode t)
;; (setq ac-auto-start 1)
;; (setq-default ac-sources  #'(ac-source-filename ac-source-words-in-same-mode-buffers))
;; (add-hook 'emacs-lisp-mode-hook (lambda () (add-to-list 'ac-sources 'ac-source-symbols t )))


;; (global-undo-tree-mode)
;; (setq undo-tree-visualizer-diff t)

;;ivy設定

(ivy-mode 1)
(ivy-rich-mode t)
(setq ivy-re-builders-alist #'((t . ivy--regex-ignore-order)))


;; enable smartparens

(sp-with-modes '(emacs-lisp-mode lisp-mode lisp-interaction-mode
				 ;;slime-mode
				 clojure-mode
				 )
  (sp-local-pair "'" nil :actions nil)
  (sp-local-pair "`" nil :actions nil))
(smartparens-global-mode 1)

(show-smartparens-global-mode 1)

;;my-moe theme
;; (require 'my-moe-dark-theme)
;; (load-theme 'my-moe-dark t :no-confirm)




;; enable which key mode
(which-key-mode t)

;; enable multiple cursor
(multiple-cursors-mode 1)

;; enable powerline
;; (powerline-default-theme)
;;install magit
;;(package-install  #'magit)

(projectile-global-mode t)

(winum-mode t)

;; telephone-line
(setq telephone-line-height 14)
;; (setq telephone-line-faces
;;       '((evil . (mode-line . mode-line-inactive))
;;         (accent .(mode-line-emphasis . mode-line-emphasis))
;;         (nil . (mode-line-inactive . mode-line-inactive))))

(setq telephone-line-faces
      '((evil . (mode-line-inactive . mode-line-inactive))
        (accent . (telephone-line-accent-active . telephone-line-accent-inactive))
        (nil . (mode-line . mode-line-inactive))))

(telephone-line-defsegment telephone-line-nil-segment ()
  "")

;; Left edge
(setq telephone-line-lhs
      '((nil . ((telephone-line-window-number-segment t)
		 telephone-line-input-info-segment))
	(accent . (telephone-line-projectile-buffer-segment
		   telephone-line-buffer-modified-segment))
	(evil . (telephone-line-simple-major-mode-segment
		telephone-line-simple-minor-mode-segment
		telephone-line-nil-segment))))
;; Right edge
(setq telephone-line-rhs
      '((evil . (telephone-line-atom-encoding-segment
		telephone-line-misc-info-segment))
	(accent . (telephone-line-flycheck-segment
		   (telephone-line-vc-segment :active)))
	(nil . (telephone-line-filesize-segment
		telephone-line-hud-segment))))

(telephone-line-mode t)


;; dired の圧縮・解凍機能で atool を使う
(define-key dired-mode-map "z" #'dired-atool-do-unpack)
(define-key dired-mode-map "Z" #'dired-atool-do-pack)


;; インデントに合わせて折り返し
(define-globalized-minor-mode global-adaptive-wrap-prefix-mode
  adaptive-wrap-prefix-mode
  adaptive-wrap-prefix-mode)
(global-adaptive-wrap-prefix-mode 1)

(add-hook #'rust-mode-hook '(lambda () (adaptive-wrap-prefix-mode -1)))

(setq-default cursor-type '(bar . 1))
;;括弧の深さをカラーコードで表す
(setq rainbow-delimiters-outermost-only-face-count 1)

(define-globalized-minor-mode global-rainbow-delimiters-mode
  rainbow-delimiters-mode
  rainbow-delimiters-mode)

(global-rainbow-delimiters-mode 1)

(define-globalized-minor-mode global-centered-cursor-mode
  centered-cursor-mode
  centered-cursor-mode)
(global-centered-cursor-mode 1)

(defun my_hideshow-ignore-setup-failure ()
  (ignore-errors (hs-minor-mode)))
(define-globalized-minor-mode global-hs-minor-mode
  hs-minor-mode my_hideshow-ignore-setup-failure)
(global-hs-minor-mode)

;; ewwのデフォルトのエンジンをgoogleに
(setq eww-search-prefix "https://www.google.co.jp/search?q=")

(global-set-key (kbd "<f1> ESC")
		#'execute-extended-command)

(global-set-key (kbd "C-l")
		#'redraw-display)


(counsel-mode t)



(defun my-goto-line-beginning-or-indent (&optional $position)
  "copied from https://qiita.com/ShingoFukuyama/items/62269c4904ca085f9149"
  (interactive)
  (or $position (setq $position (point)))
  (let (($starting-position (progn (back-to-indentation) (point))))
    (if (eq $starting-position $position)
	(move-beginning-of-line 1))))


(general-define-key
 :keymaps 'global-map
 "<delete>" 'smart-hungry-delete-forrward-char
 "<backspace>" 'smart-hungry-delete-backward-char
 "C-x" 'Control-X-prefix
 "C-\\" 'mozc-mode
 "M-m" 'Control-X-prefix
 "M-t" 'recenter
 "M-y" 'yank-pop
 "M-<tab>" 'exwm-workspace-switch-to-buffer
 ;; "C-c" 'kill-ring-save
 "C-<tab>" 'my-avy-goto-char
 "C-a" 'my-goto-line-beginning-or-indent
 "C-x" nil
 "C-v" 'yank
 "C-z" 'undo-tree-undo
 "C-y" 'undo-tree-redo
 "C-s" 'save-buffer
 "C-f" 'swiper
 ;; "C-b" 'previous-buffer
 "M-<left>" 'backward-word
 "M-<right>" 'forward-word
 "TAB" 'company-indent-or-complete-common)

(general-define-key
 :keymaps 'gpastel-mode-map
 "M-y" 'gpastel-exwm-counsel-yank-pop)

(defun clang-save ()
  (interactive)
  (clang-format-buffer)
  (save-buffer))

(general-define-key
 :keymaps 'c-mode-map
 "C-s" 'clang-save)

(general-define-key
 :keymaps 'arduino-mode-map
 "C-s" 'clang-save)


(defun smlformat-buffer ()
  (interactive)
  (shell-command-to-string
   (mapconcat #'shell-quote-argument
	      (list "smlformat" (buffer-file-name)) " ")))

(defun smlsharp-format-save ()
  (interactive)
  (smlformat-buffer)
  (save-buffer))

(general-define-key
 :keymaps 'sml-mode-map
 "C-s" 'smlsharp-format-save)


;; (general-define-key
;;  :keymaps 'prog-mode-map
;;  "C-s" 'save-buffer)

(general-define-key
 :keymaps 'nim-mode-map
 "C-s" 'nimpretty-on-save)

(general-define-key
 :keymaps 'uim-mode-map
 "ESC" nil
 "M-m" 'Control-X-prefix)


;; (general-define-key
;;  :keymaps 'key-translation-map
;;  "M-m" (kbd "C-x")
;;  "s-c" (kbd "C-c"))


(general-define-key
 :keymaps 'ivy-minibuffer-map
 "M-<tab>" 'next-line
 "M-<iso-lefttab>" 'previous-line)

(general-define-key
 :keymaps 'ctl-x-map
 "C-b" 'swiper-multi
 "t" 'universal-argument
 "c" 'mode-specific-command-prefix
 ;; "w" 'exwm-edit--compose
 "u" 'undo-tree-visualize
 "o" 'switch-window
 ;; "M-j" 'skk-mode
 "M-o" 'exwm-workspace-switch)


(general-define-key
 :keymaps 'mode-specific-map
 "<left>" 'winner-undo
 "<right>" 'winner-redo)


(general-define-key
 :keymaps 'swiper-map
 "C-r" 'swiper-query-replace
 "C-z" 'ivy-reverse-i-search
 "M-c" 'swiper-mc
 "C-o" 'ivy-occur
 "C-v" 'yank)

(with-eval-after-load "lispy"
  (general-define-key
   :keymaps 'lispy-mode-map
   "M-m" nil
   "M-m M-m" 'lispy-mark-symbol
   "C-y" 'undo-tree-redo
   "C-v" 'lispy-yank
   "C-o" 'lispy-open-line
   "<C-return>" nil))


(general-define-key
 :keymaps 'ccm-map
 "C-v" 'yank)

(with-eval-after-load "yasnippet"
  (general-define-key
   :keymaps 'yas-minor-mode-map
   "<tab>" nil
   "TAB" nil
   "<C-return>" 'yas-next-field))





;; (general-define-key
;;  :keymaps 'exwm-edit-mode-map
;;  "C-c" nil
;;  "C-c '" nil
;;  "C-c C-'" nil
;;  "C-c C-c" nil
;;  "C-c C-k" nil
;;  "C-s" 'exwm-edit--finish
;;  )



;; (general-define-key
;;  : keymaps 'global-map
;;  : prefix "M-b"
;;  "" nil
;;  "s" 'ivy-switch-buffer
;;  "e" 'eval-buffer
;;  "i" 'ibuffer
;;  "M-k" 'kill-buffer
;;  "k" 'kill-current-buffer
;;  )


;; (setq undo-tree-auto-save-history t)
(desktop-save-mode t)
(if window-system
    (progn
      ;; ←GUI用設定を、ここに記述
      ;;(package-install #'exwm-x); ; (require 'exwmx-sendstring)
      ;;(add-to-list 'load-path "/home/linguini/.emacs.d/elpa/exwm-x-20180227.1057"
      ;; set exwm buffer name according to application
      (defun exwm-rename-buffer-to-title ()
	(exwm-workspace-rename-buffer exwm-title))
      (add-hook 'exwm-update-title-hook 'exwm-rename-buffer-to-title)
      (setq exwm-workspace-number 3)
      ;; (require 'exwm-systemtray)
      ;; (exwm-systemtray-enable)
      (exwm-randr-enable)

      ;;(add-hook 'exwm-randr-screen-change-hook;;           (lambda ()
      ;;             (async-shell-command
      ;;	     "
      ;; ")))
      ;; (package-install  #'exwm-edit)
      ;; (require #'exwm-edit)
      (defun gpastel-exwm-counsel-yank-pop ()
	"Same as `counsel-yank-pop' and paste into exwm buffer."
	(interactive)
	(let ((inhibit-read-only t)
	      ;; Make sure we send selected yank-pop candidate to
	      ;; clipboard:
	      (yank-pop-change-selection t))
	  (call-interactively #'counsel-yank-pop))
	(when (derived-mode-p 'exwm-mode)
	  ;; https://github.com/ch11ng/exwm/issues/413#issuecomment-386858496
	  (exwm-input--set-focus (exwm--buffer->id (window-buffer (selected-window))))
	  ;; (exwm-input--fake-key ?\C-v)
	  ))
      
      (exwm-input-set-key (kbd "M-y")
			  #'gpastel-exwm-counsel-yank-pop)
      (exwm-input-set-key (kbd "M-y")
			  #'gpastel-exwm-counsel-yank-pop)
      ;; (gpastel-mode -1)


      ;; (set-fontset-font (frame-parameter nil #'font)
      ;;			#'unicode
      ;;			(font-spec :family "Inconsolata"
      ;;				   :size 14))

      ;; (set-face-attribute 'default nil :family "inconsolata" :height 160)

      (setq japanese-fonts "UmeGothic")

      (set-fontset-font nil
			#'ascii
			(font-spec :family "inconsolata"
				   :size 12))


					; 半角ｶﾅ設定
      (set-fontset-font nil
			;; (frame-parameter nil #'font)
			#'katakana-jisx0201
			(font-spec :family japanese-fonts
				   :size 12))

					; 全角かな設定
      (set-fontset-font nil
			;; (frame-parameter nil #'font)
			#'japanese-jisx0208
			(font-spec :family japanese-fonts
				   :size 12))

      ;;ずれ確認用
      ;; abcdefghijklmnopqrstuvwxyzabcdefghijklmn
      ;; 0123456789012345678901234567890123456789
      ;; ｱｲｳｴｵｱｲｳｴｵｱｲｳｴｵｱｲｳｴｵｱｲｳｴｵｱｲｳｴｵｱｲｳｴｵｱｲｳｴｵ
      ;; あいうえおあいうえおあいうえおあいうえお
      ;; 愛愛愛愛愛愛愛愛愛愛愛愛愛愛愛愛愛愛愛愛
      ;; (add-hook 'kill-emacs-hook
      ;;		(lambda ()
      ;;		  (window-configuration-to-register ?1)
      ;;		  (save-buffer-kill-emacs)))

      ;; (diff-hl-mode t)
      ;; (diff-hl-margin-mode -1)

      (setq switch-window-shortcut-appearance 'text)
      ;; (fringe-mode '(nil . 0))
      (setq exwm-randr-workspaoce-output-plist '(0 "HDMI-0" 1  "HDMI1" 2 "DP1"))
      (add-hook 'exwm-randr-screen-change-hook (lambda () (load-file "~/.emacs.d/init.el")))
      (remove-hook 'exwm-randr-screen-change-hook
		(lambda ()
		  (start-process-shell-command "bash" nil "bash ~/.screenlayout/default.sh")))))

(if (not window-system)
    (progn
      ;; ←CUI用設定を、ここに記述
      ;; (diff-hl-margin-mode)

      (setq switch-window-shortcut-appearance
	    'asciiart)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(blink-matching-delay 0)
 '(blink-matching-paren-dont-ignore-comments t)
 '(cider-completion-annotations-include-ns (quote always))
 '(debug-on-error t)
 '(desktop-globals-to-clear nil)
 '(desktop-globals-to-save
   (quote
    (kill-ring desktop-missing-file-warning tags-file-name tags-table-list search-ring regexp-search-ring register-alist file-name-history)))
 '(desktop-restore-in-current-display nil)
 '(desktop-save-mode t)
 '(diff-hl-flydiff-mode t)
 '(diff-hl-margin-mode t)
 '(display-time-mode t)
 '(elpy-modules
   (quote
    (elpy-module-company elpy-module-eldoc elpy-module-pyvenv elpy-module-yasnippet elpy-module-django elpy-module-sane-defaults)))
 '(enable-recursive-minibuffers nil)
 '(exwm-input-line-mode-passthrough nil)
 '(exwm-input-move-event [M-down-mouse-1])
 '(exwm-input-prefix-keys
   (quote
    ([134217848]
     [134217824]
     [134217766]
     [134217786]
     [134217837]
     [M-tab])))
 '(exwm-input-resize-event [M-down-mouse-3])
 '(fci-rule-color "#202020")
 '(flycheck-clang-warnings (quote ("all" "extra")))
 '(flycheck-display-errors-function (function flycheck-pos-tip-error-messages))
 '(flycheck-pos-tip-mode nil)
 '(global-auto-revert-mode t)
 '(global-centered-cursor-mode nil)
 '(global-company-mode t)
 '(global-hl-line-mode t)
 '(global-hl-line-sticky-flag t)
 '(global-undo-tree-mode t)
 '(icomplete-mode t)
 '(indent-guide-global-mode nil)
 '(ivy-height 40)
 '(ivy-height-alist nil)
 '(ivy-rich-mode t)
 '(line-spacing 0.2)
 '(lispy-compat (quote (edebug cider)))
 '(lispy-eval-display-style (quote overlay))
 '(magit-log-arguments (quote ("-n256" "--graph" "--decorate" "--color")))
 '(mode-icons-mode t)
 '(mozc-candidate-style (quote overlay))
 '(org-agenda-restore-windows-after-quit t)
 '(org-agenda-window-setup (quote current-window))
 '(package-selected-packages
   (quote
    (smart-hungry-delete smart-hungry-mode sml-mode dune merlin-eldoc flycheck-ocaml merlin tuareg company-arduino arduino-mode rainbow-mode undo-tree winum telephone-line lispxmp xah-replace-pairs flycheck-nim fcitx lsp-mode clang-format shackle calfw-ical calfw calfw-cal calfw-org diminish eldoc-eval doom-modeline magit elein elien clj-refactor cider CIDER all-the-icons m-buffer ov el-doc pcre2el swiper flx markdown-mode pyvenv highlight-indentation find-file-in-project auto-complete jedi-core python-environment epc ctable concurrent deferred popup pos-tip pkg-info epl f dash s memoize quelpa package yasnippet yasnippet-snippets layout-restore poet-theme neotree all-the-icons-dired all-the-icons-ivy htmlize gpastel ivy-rich company-statistics switch-window rust-mode ace-window flycheck-pos-tip flycheck-popup-tip flycheck-rust racer cargo elpy flycheck indent-guide-mode pipenv company-lua lua-mode auto-virtualenvwrapper virtualenvwrapper virtalenvwrapper flymake-python company-jedi py-autopep8 jedi counsel-jedi yaml-mode review-mode add-hooks ddskk exwm-edit org-plus-contrib nix-mode adaptive-wrap mozc company-quickhelp company-quickhelp-mode company-flx company smex mozc-mode moe leuven-theme leuven leaven uimage auto-sudoedit w3m general counsel avy winner exwm-surf winner-mode rainbow-delimiters dired-toggle-sudo dired-atool multi-term multiple-cursors which-key ivy moe-theme smartparens helm 0blayout exwm-x)))
 '(projectile-mode t nil (projectile))
 '(rust-always-locate-project-on-open t)
 '(skk-jisyo-edit-user-accepts-editing t)
 '(smartparens-global-mode t)
 '(switch-window-mouse-mode t nil (switch-window))
 '(telephone-line-mode t)
 '(tool-bar-mode nil)
 '(tooltip-delay 0.3)
 '(tooltip-hide-delay 100)
 '(whitespace-display-mappings t)
 '(window-divider-default-places t)
 '(window-divider-mode nil)
 '(winum-mode t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


(put 'dired-find-alternate-file 'disabled
     nil)
;; ## added by OPAM user-setup for emacs / base ## 56ab50dc8996d2bb95e7856a6eddb17b ## you can edit, but keep this line
(require 'opam-user-setup "~/.emacs.d/opam-user-setup.el")
;; ## end of OPAM user-setup addition for emacs / base ## keep this line
