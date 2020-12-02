;; package --- Summfont-lock-ary
;;; Commentary:
;;; Code:

;; (setenv "LANG" "ja_JP.UTF-8")
;; (when load-file-name
;;   (setq user-emacs-directory
;;	(file-name-directory
;;	 load-file-name)))
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

(add-to-list 'load-path "~/.emacs.d/mylisp")
(add-to-list 'load-path "/usr/share/emacs/site-lisp")
(add-to-list 'load-path "/usr/share/emacs/site-lisp/uim-el")

(load-file "~/.emacs.d/packages.el")


(set-language-environment "Japanese")

(prefer-coding-system 'utf-8)
(setq coding-system-for-read
      'utf-8)
(setq coding-system-for-write
      'utf-8)

(require #'srefactor-lisp)
(require #'general)
(require #'flycheck-popup-tip)
(require #'generic-x)
;; (require #'company-lua)
;; (require #'lua-mode)
(require #'diminish)
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
(add-to-list 'load-path "~/.emacs.d/mylisp/company-mlton")
(require #'company-mlton)
(require #'lsp-mode)
(require #'lsp-haskell)
(require #'lsp-ui)
(add-to-list 'load-path "/home/linguini/my-repo/source/llvm/llvm/llvm/utils/emacs")
(require #'llvm-mode)
(require #'tablegen-mode)
(add-to-list 'load-path "~/.emacs.d/mylisp/undo-tree")
(require #'undo-tree)
(require #'company-tabnine)

(when (eq 'x window-system)
  (require #'xcb)
  (require #'exwm)
  (require #'exwm-randr)
  (require #'exwm-config)
  (require #'gpastel)
  )



;; (setq c-mode-common-hook nil)
(add-hook 'c-mode-common-hook 'flycheck-mode t)


(load "flycheck-smlsharp.el")

(require 'flycheck)

(font-lock-add-keywords 'sml-mode
			'(("|" . 'font-lock-keyword-face)))

(defun my-company-mlton-init ()
  "Initializes company-mlton backend.
Makes variable `company-backends' buffer local, pushes
`company-mlton-grouped-backend' (consisting of
`company-mlton-keyword' and `company-mlton-basis') to it, calls
`company-mlton-basis-autodetect', and enables `company-mode'.
This function is suitable for adding to `sml-mode-hook'."
  (interactive)
  (setq-local company-backends
	      '((company-yasnippet :with
				   company-mlton-grouped-backend
				   ;; company-lua
				   company-dabbrev
				   company-files
				   company-dabbrev-code
				   company-gtags
				   company-etags
				   company-keywords)))
  (company-mlton-basis-autodetect))

(add-hook 'sml-mode-hook #'my-company-mlton-init)


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

;; (setq flycheck-disabled-checkers '(haskell-stack-ghc haskell-ghc))

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


(with-eval-after-load 'flycheck
  (flycheck-ats2-setup))
;; If you use PATSHOME instead of ATSHOME, please set PATSHOME as follows:

(setenv "PATSHOME" "/usr/lib/ats2-postiats-0.3.13")
(load "ats2-mode.el")


;; (add-hook 'haskell-mode-hook #'lsp)

;; (add-hook 'haskell-mode-hook #'haskell-interactive-mode)
(setq haskell-stylish-on-save t)
;; フックを設定
(add-hook 'haskell-mode-hook 'haskell-indentation-mode)
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)
(add-hook 'haskell-mode-hook 'haskell-decl-scan-mode)
(add-hook 'haskell-mode-hook 'haskell-doc-mode)

;; (add-hook 'haskell-mode-hook 'view-mode)

;; (setenv "PATH" "home/linguini/.opam/default/bin:/home/linguini/.opam/default/bin:/home/linguini/.cargo/bin:/home/linguini/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/env:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/home/linguini/.stack/snapshots/x86_64-linux-tinfo6/9d4d78a5e69ddae38593d6526911d8c84af84e5639229895687a73788eb833bb/8.6.5/bin:/home/linguini/.stack/compiler-tools/x86_64-linux-tinfo6/ghc-8.6.5/bin:/home/linguini/.stack/programs/x86_64-linux/ghc-tinfo6-8.6.5/bin:/home/linguini/.opam/default/bin:/sbin:/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/env:/home/linguini/.gem/ruby/2.6.0:/home/linguini/.nimble/bin")

;; (getenv "PATH")

;; (executable-find "hlint")

;; (setq racer-rust-src-path
;;       (concat (string-trim
;;                (shell-command-to-string "rustc --print sysroot"))
;;               "/lib/rustlib/src/rust/src"))

(flycheck-add-next-checker 'haskell-stack-ghc 'haskell-hlint)
(add-hook 'haskell-mode-hook
          '(lambda ()
             (setq flycheck-checker 'haskell-stack-ghc)))

(add-hook 'haskell-mode-hook #'haskell-mode-company-init)
(add-hook 'haskell-mode-hook #'subword-mode)
(defun haskell-mode-company-init ()
  (add-to-list 'company-backends
	       '(company-yasnippet :with company-ghc
				   company-dabbrev
				   company-files
				   company-dabbrev-code
				   company-gtags
				   company-etags
				   company-keywords)))

(setq haskell-process-type 'stack)
(setq haskell-process-path-ghci "stack")
(setq haskell-process-args-ghci "ghci")
(setq haskell-mode-stylish-haskell-path "~/.local/bin/stylish-haskell")

(defun haskell-underscore-to-camelcase ()
  (interactive)
  (let* ((bounds (bounds-of-thing-at-point 'symbol))
         (symb (buffer-substring-no-properties (car bounds) (cdr bounds)))
         (rep-func '(lambda (str)
                      (if (not (= 2 (length str)))
                          str
                        (let ((listed (mapcar 'char-to-string
                                              (string-to-list str))))
                          (upcase (cadr listed)))))))
    (save-restriction
      (when (and symb
                 (<= 2 (length symb)))

        (narrow-to-region (car bounds) (cdr bounds))
        (delete-region (point-min) (point-max))
        (insert (replace-regexp-in-string "\\(_[a-zA-Z]\\)" rep-func symb))
        (goto-char (cdr bounds))
        ))))

(setq lsp-print-io t)

;; (setq lsp-haskell-process-path-hie "hie-wrapper")
(setq lsp-haskell-process-path-hie "haskell-language-server-wrapper")

;; (setq eglot-server-programs
;;       ( add-to-list
;; 	(remove '(haskell-mode "hie-wrapper") eglot-server-programs)
;; 	'(haskell-mode . ("haskell-language-server-wrapper")))
;;       )

;; (lsp-register-client
;;  (make-lsp-client :new-connection (lsp-tramp-connection "hie-wrapper")
;;                   :major-modes '(haskell-mode)
;;                   :remote? t
;;                   :server-id 'hie-wrapper))

(setq lsp-prefer-flymake nil)

;; (add-hook 'lsp-mode-hook 'my-lsp-company-init)
(add-hook 'lsp-mode-hook 'lsp-ui-mode)
(add-hook 'lsp-mode-hook 'lsp-ui-doc-mode)
(add-hook 'lsp-mode-hook 'lsp-ui-peek-mode)

(setq lsp-ui-sideline-enable nil)
(setq lsp-ui-doc-position 'top)
(setq lsp-ui-doc-alignment 'window)

(defun my-lsp-company-init ()
  (setq-local company-backends
	      '((company-yasnippet :with
				   company-lsp
				   company-dabbrev
				   company-files
				   company-dabbrev-code
				   company-gtags
				   company-etags
				   company-keywords))))

;; (add-hook #'prog-mode-hook #'highlight-indent-guides-mode)



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
      '((company-tabnine
	 company-yasnippet
	 :with
	 company-capf
	 company-dabbrev
	 company-dabbrev-code
	 company-files
	 company-gtags
	 company-etags
	 company-keywords
	 company-lsp
	 )
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
	))
;; Number the candidates (use M-1, M-2 etc to select completions).

(setq company-show-numbers t)

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

;; enable smartparens
(sp-with-modes '(emacs-lisp-mode lisp-mode lisp-interaction-mode
				 ;;slime-mode
				 clojure-mode
				 )
  (sp-local-pair "'" nil :actions nil)
  (sp-local-pair "`" nil :actions nil))
(smartparens-global-mode 1)

(sp-pair "⟨" "⟩")

(show-smartparens-global-mode 1)

;;my-moe theme
;; (require 'my-moe-dark-theme)
;; (load-theme 'my-moe-dark t :no-confirm)


;; enable powerline
;; (powerline-default-theme)
;;install magit
;;(package-install  #'magit)


(winum-mode t)

;; dired の圧縮・解凍機能で atool を使う
(define-key dired-mode-map "z" #'dired-atool-do-unpack)
(define-key dired-mode-map "Z" #'dired-atool-do-pack)

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
 "<delete>" 'smart-hungry-delete-forward-char
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
 "TAB" 'company-indent-or-complete-common
 "M-/" 'company-complete-common
 "<backtab>" 'self-insert-command)

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
 "M-m" 'Control-X-prefix
 "C-h" nil)


;; (general-define-key
;;  :keymaps 'key-translation-map
;;  "M-m" (kbd "C-x")
;;  "s-c" (kbd "C-c"))


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
 :keymaps 'ivy-minibuffer-map
 "<backspace>" 'ivy-backward-delete-char
 "M-<tab>" 'next-line
 "M-<iso-lefttab>" 'previous-line)

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


(when (eq 'x window-system)
  ;; ←GUI用設定を、ここに記述

  
  ;; (set-fontset-font (frame-parameter nil #'font)
  ;;			#'unicode
  ;;			(font-spec :family "Inconsolata"
  ;;				   :size 14))

  ;; (set-face-attribute 'default nil :family "inconsolata" :height 160)
  (setq font-size 14)
  (setq japanese-fonts "UmeGothic")
  (setq japanese-font-size 14)

  (set-fontset-font nil
		    #'unicode
		    (font-spec :family "NotoSansMonoCJK"
			       :size font-size))

  (set-fontset-font nil '(#x1F000 . #x1FAFF) "NotoEmoji")

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
			       :size japanese-font-size))

  ;;ずれ確認用
  ;; abcdefghijklmnopqrstuvwxyzabcdefghijklmn
  ;; 0123456789012345678901234567890123456789
  ;; ｱｲｳｴｵｱｲｳｴｵｱｲｳｴｵｱｲｳｴｵｱｲｳｴｵｱｲｳｴｵｱｲｳｴｵｱｲｳｴｵ
  ;; あいうえおあいうえおあいうえおあいうえお
  ;; 愛愛愛愛愛愛愛愛愛愛愛愛愛愛愛愛愛愛愛愛
  ;; 🤔
  
  ;; (add-hook 'kill-emacs-hook
  ;;		(lambda ()
  ;;		  (window-configuration-to-register ?1)
  ;;		  (save-buffer-kill-emacs)))

  ;; (diff-hl-mode t)
  ;; (diff-hl-margin-mode -1)

  
  ;;(package-install #'exwm-x); ; (require 'exwmx-sendstring)
  ;;(add-to-list 'load-path "/home/linguini/.emacs.d/elpa/exwm-x-20180227.1057"
  ;; set exwm buffer name according to application
  (defun exwm-rename-buffer-to-title ()
    (exwm-workspace-rename-buffer exwm-title))
  (add-hook 'exwm-update-title-hook 'exwm-rename-buffer-to-title)
  (setq exwm-workspace-number 3)
  ;; (require 'exwm-systemtray)
  ;; (exwm-systemtray-enable)

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


  (setq exwm-debug-on nil)
  (add-to-list 'exwm-manage-configurations '((equal exwm-class-name "Slack") managed t))
  (setq switch-window-shortcut-appearance 'text)
  ;; (fringe-mode '(nil . 0))ini
  (setq exwm-randr-workspaoce-output-plist '(
					     0 "HDMI1"
					     1  "HDMI-0"
					     ;; 2 "DP1"
					     ))
  ;; (add-hook 'exwm-randr-screen-change-hook (lambda () (load-file "~/.emacs.d/init.el")))
  (add-hook 'exwm-randr-screen-change-hook
	    (lambda ()
	      (start-process-shell-command "sh" nil "sh ~/.screenlayout/default.sh")))
  (add-hook 'exwm-randr-screen-change-hook #'cce/refresh-display-scale)
  ;; (exwm-enable)
  (exwm-randr-enable)
 )

;; (setq undo-tree-auto-save-history t)
(desktop-save-mode t)

(server-start)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(blink-matching-delay 0)
 '(blink-matching-paren-dont-ignore-comments t)
 '(cider-completion-annotations-include-ns 'always)
 '(custom-safe-themes
   '("13d20048c12826c7ea636fbe513d6f24c0d43709a761052adbca052708798ce3" "fe1c13d75398b1c8fd7fdd1241a55c286b86c3e4ce513c4292d01383de152cb7" "26d49386a2036df7ccbe802a06a759031e4455f07bda559dcf221f53e8850e69" default))
 '(debug-on-error t)
 '(desktop-globals-to-clear nil)
 '(desktop-globals-to-save
   '(kill-ring desktop-missing-file-warning tags-file-name tags-table-list search-ring regexp-search-ring register-alist file-name-history))
 '(desktop-restore-in-current-display nil)
 '(desktop-save-mode t)
 '(diff-hl-flydiff-mode t)
 '(diff-hl-margin-mode t)
 '(display-time-mode t)
 '(elpy-modules
   '(elpy-module-company elpy-module-eldoc elpy-module-pyvenv elpy-module-yasnippet elpy-module-django elpy-module-sane-defaults))
 '(enable-recursive-minibuffers nil)
 '(exwm-input-line-mode-passthrough nil)
 '(exwm-input-move-event [M-down-mouse-1])
 '(exwm-input-prefix-keys
   '([134217848]
     [134217824]
     [134217766]
     [134217786]
     [134217837]
     [M-tab]))
 '(exwm-input-resize-event [M-down-mouse-3])
 '(fci-rule-color "#202020")
 '(flycheck-clang-warnings '("all" "extra"))
 '(flycheck-display-errors-function #'flycheck-pos-tip-error-messages)
 '(flycheck-pos-tip-mode nil)
 '(global-auto-revert-mode t)
 '(global-centered-cursor-mode nil)
 '(global-company-mode t)
 '(global-hl-line-mode t)
 '(global-hl-line-sticky-flag t)
 '(global-linum-mode t)
 '(global-undo-tree-mode t)
 '(icomplete-mode t)
 '(imenu-list-position 'left)
 '(imenu-list-size 30)
 '(indent-guide-global-mode nil)
 '(ivy-height 40)
 '(ivy-height-alist nil)
 '(ivy-rich-mode t)
 '(line-spacing 0.1)
 '(lispy-compat '(edebug cider))
 '(lispy-eval-display-style 'overlay)
 '(magit-log-arguments '("-n256" "--graph" "--decorate" "--color"))
 '(mode-icons-mode t)
 '(mozc-candidate-style 'overlay)
 '(org-agenda-restore-windows-after-quit t)
 '(org-agenda-window-setup 'current-window)
 '(package-archive-priorities
   '(("elpa" . 15)
     ("melpa-stable" . 10)
     ("melpa" . 5)
     ("marmalade" . 1)
     ("org" . 0)
     ("gnu" . 0)))
 '(package-archives
   '(("melpa" . "https://melpa.org/packages/")
     ("gnu" . "https://elpa.gnu.org/packages/")
     ("melpa-stable" . "https://stable.melpa.org/packages/")
     ("marmalade" . "http://marmalade-repo.org/packages/")
     ("org" . "http://orgmode.org/elpa/")
     ("emacswiki" . "http://www.emacswiki.org/emacs/download/")))
 '(package-selected-packages
   '(dracula-theme pkgbuild-mode lean-mode fstar-mode idris-mode flycheck-ats2 company-tabnine htmlize company-ghc fish-mode yaml-mode exec-path-from-shell lsp-mode lsp-ui company-lsp lsp-haskell haskell-mode haskell-snippets smart-hungry-delete sml-mode dune flycheck-ocaml merlin-eldoc merlin tuareg arduino-mode company-arduino rainbow-mode winum telephone-line centered-cursor-mode calfw-org calfw git-gutter-fringe+ lispxmp highlight-indent-guides quickrun flycheck-nim nim-mode eglot clang-format shackle diminish projectile elein use-package cider clj-refactor clojure-mode s srefactor m-buffer ov elisp-def pcre2el lispy switch-window lua-mode company-lua yasnippet-snippets flycheck flycheck-pos-tip flycheck-popup-tip py-autopep8 jedi company-jedi pipenv elpy rust-mode cargo racer flycheck-rust review-mode org-plus-contrib nix-mode auto-sudoedit avy winner company-quickhelp company company-flx company-statistics counsel smex ivy-rich smartparens leuven-theme moe-theme which-key multiple-cursors powerline multi-term dired-atool dired-toggle-sudo adaptive-wrap rainbow-delimiters general switch-window exwm gpastel))
 '(projectile-mode t nil (projectile))
 '(rust-always-locate-project-on-open t)
 '(skk-jisyo-edit-user-accepts-editing t)
 '(smartparens-global-mode t)
 '(switch-window-mouse-mode t nil (switch-window))
 '(telephone-line-mode t)
 '(tool-bar-mode nil)
 '(tooltip-delay 0.3)
 '(tooltip-hide-delay 100)
 '(undo-limit 8000000)
 '(whitespace-display-mappings t t)
 '(window-divider-default-places t)
 '(window-divider-mode nil)
 '(winum-mode t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


(setq package-selected-packages (append my-common-packages
					my-gui-packages
					my-cui-packages))

(put 'dired-find-alternate-file 'disabled
     nil)
;; ## added by OPAM user-setup for emacs / base ## 56ab50dc8996d2bb95e7856a6eddb17b ## you can edit, but keep this line
(require 'opam-user-setup "~/.emacs.d/opam-user-setup.el")
;; ## end of OPAM user-setup addition for emacs / base ## keep this line
