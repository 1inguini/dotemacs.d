;; package --- Summary
;;; Commentary:
;;; Code:
;; (setenv "LANG" "ja_JP.UTF-8")
(when load-file-name
  (setq user-emacs-directory
	(file-name-directory
	 load-file-name)))

(load-file
 "~/.emacs.d/packages.el")

(set-language-environment
 "Japanese")

(prefer-coding-system 'utf-8)
(setq coding-system-for-read
      'utf-8)
(setq coding-system-for-write
      'utf-8)


(if window-system
    (progn
      ;; ←GUI用設定を、ここに記述
      (require #'exwm)
      ;;(package-install #'exwm-x); ; (require 'exwmx-sendstring)
      ;;(add-to-list 'load-path "/home/linguini/.emacs.d/elpa/exwm-x-20180227.1057"
      ;; set exwm buffer name according to application
      (defun exwm-rename-buffer-to-title ()
	(exwm-workspace-rename-buffer exwm-title))
      (add-hook 'exwm-update-title-hook 'exwm-rename-buffer-to-title)
      (setq exwm-workspace-number 3)
      ;; (require 'exwm-systemtray)
      ;; (exwm-systemtray-enable)
      (require 'exwm-randr)
      (exwm-randr-enable)
      (setq exwm-randr-workspace-output-plist '(0 "HDMI1" 1 "HDMI-0" 2 "DP1" 3))
      ;;(add-hook 'exwm-randr-screen-change-hook;;           (lambda ()
      ;;             (async-shell-command
      ;;	     "
      ;; ")))
      ;; (package-install  #'exwm-edit)
      ;; (require #'exwm-edit)
      (require #'gpastel)
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
      (set-face-attribute 'default nil :family "inconsolata"
			  :height 130)
					; 半角ｶﾅ設定
      (set-fontset-font (frame-parameter nil #'font)
			#'katakana-jisx0201
			(font-spec :family "NasuM"
				   :size 14))
					; 全角かな設定
      (set-fontset-font (frame-parameter nil #'font)
			#'japanese-jisx0208
			(font-spec :family "NasuM"
				   :size 14))
      ;;ずれ確認用
      ;; abcdefghijklmnopqrstuvwxyzabcdefghijklmn
      ;; 0123456789012345678901234567890123456789
      ;; ｱｲｳｴｵｱｲｳｴｵｱｲｳｴｵｱｲｳｴｵｱｲｳｴｵｱｲｳｴｵｱｲｳｴｵｱｲｳｴｵ
      ;; あいうえおあいうえおあいうえおあいうえお
      ;; 愛愛愛愛愛愛愛愛愛愛愛愛愛愛愛愛愛愛愛愛
      ;; (add-hook 'kill-emacs-hook
      ;; 		(lambda ()
      ;; 		  (window-configuration-to-register ?1)
      ;; 		  (save-buffer-kill-emacs)))
      (setq switch-window-shortcut-appearance 'text)))

(if (not window-system)
    (progn
      ;; ←CUI用設定を、ここに記述
      (setq switch-window-shortcut-appearance
	    'asciiart)))



;; Turn on `display-time-mode' if you don't use an external bar.
(setq display-time-default-load-average
      nil)
(display-time-mode nil)

(menu-bar-mode t)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(fringe-mode 1)

(require #'switch-window)
(setq switch-window-threshold 2)
(setq switch-window-minibuffer-shortcut ?z)

;; (add-to-list 'load-path "/home/linguini/.emacs.d/elpa/ibus-el-0.3.29")
;; (require  #'ibus)

;; (add-hook 'after-init-hook 'ibus-mode-on)

;; (setq mozc-helper-program-name "home/linguini/.cache/yay/mozc/pkg/emacs-mozc/usr/bin/mozc_emacs_helper")
(require #'mozc)
(setq default-input-method "japanese-mozc")

(require #'uim)
(setq-default uim-candidate-display-inline
	      t)
(setq-default uim-preedit-display-fences t)
(setq-default uim-candidate-display-frame
	      t)


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


(require #'generic-x)

;;;; This snippet enables lua-mode
;; This line is not necessary, if lua-mode.el is already on your load-path
(require #'lua-mode)
(autoload 'lua-mode "lua-mode" "Lua editing mode."
  t)
(add-to-list 'auto-mode-alist
	     '("\\.lua$" . lua-mode))
(add-to-list 'interpreter-mode-alist
	     '("lua" . lua-mode))

(package-install #'company-lua)
(require #'company-lua)
(defun my-lua-mode-company-init ()
  (setq-local company-backends
	      '((company-lua))))
(add-hook 'lua-mode-hook #'my-lua-mode-company-init)



;; (require #'flymake)
;; (flymake-mode t)
;; ;;errorやwarningを表示する
;; (package-install #'flymake-python-pyflakes)
;; (require 'flymake-python-pyflakes)
;; (flymake-python-pyflakes-load)


(use-package cider
  :init
  (add-hook 'cider-mode-hook #'clj-refactor-mode)
  (add-hook 'cider-mode-hook #'company-mode)
  (add-hook 'cider-mode-hook #'eldoc-mode)
  (add-hook 'cider-repl-mode-hook #'company-mode)
  (add-hook 'cider-repl-mode-hook #'eldoc-mode)
  :diminish subword-mode
  :config
  (setq nrepl-log-messages t
        cider-repl-display-in-current-window t
        cider-repl-use-clojure-font-lock t
        cider-prompt-save-file-on-load 'always-save
        cider-font-lock-dynamically '(macro core function var)
        cider-overlays-use-font-lock t)
  (cider-repl-toggle-pretty-printing))

(require #'flycheck)
;; (global-flycheck-mode)

(require #'flycheck-popup-tip)
(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook flycheck-popup-tip-mode))
;; (package-install #'flycheck-pycheckers)
;; (require #'flycheck-pycheckers)

(require #'py-autopep8)
;;(setq py-autopep8-options '("--max-line-length=200"))
;;(setq flycheck-flake8-maximum-line-length 200)

(require 'jedi)
(require 'company-jedi)
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

(setq-local company-backends
	    '(company-jedi company-files elpy-company-backend))

(require #'pipenv)
(add-hook 'python-mode-hook #'pipenv-mode)

(require #'elpy)
(elpy-enable)
;; (package-install #'virtualenvwrapper)
;; (package-install #'auto-virtualenvwrapper)
;; (require 'virtualenvwrapper)
;; (require 'auto-virtualenvwrapper)
;; (add-hook 'python-mode-hook #'auto-virtualenvwrapper-activate)

(require #'rust-mode)
(require #'cargo)
(require #'racer)
(require #'flycheck-rust)
(add-hook 'rust-mode-hook 'cargo-minor-mode)
(setq rust-format-on-save t)
(with-eval-after-load 'rust-mode
  (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))
(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)
(add-hook 'racer-mode-hook #'company-mode)
(setq company-tooltip-align-annotations t)
(add-hook 'flycheck-mode-hook #'flycheck-rust-setup)


(require #'indent-guide)
(set-face-foreground #'indent-guide-face "LightGrey")
(indent-guide-global-mode)


;; (require #'whitespace)
;; ;; (setq whitespace-space-regexp "\\(\u3000+\\)")
;; (setq whitespace-display-mappings
;;       '(
;; 	(space-mark ?\  [?~] [?.])
;; 	(space-mark ?\u3000 [?\□])
;; 	(space-mark ?\xA0 [?\u00A4] [?_])
;; 	(space-mark ?\t [?⟼ ?\t] [?\\?\t])
;; 	(space-mark ?\n [?\¬ ?\n])
;; 	))

;; (set-face-background 'highlight-indentation-face "#0000ff")
;; (set-face-background 'highlight-indentation-current-column-face "#ff0000")

(require 'ox-latex)
(require 'ox-bibtex)
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


(require #'twittering-mode)
(twittering-icon-mode 1)
(setq twittering-use-master-password t)

;;(package-install  #'w3m)


;; ace jump mode major function
(require #'avy)

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

(company-quickhelp-mode nil)

(setq company-quickhelp-delay 0)
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

(require 'company-statistics)
(company-statistics-mode)
(setq company-transformers '(company-sort-by-backend-importance company-sort-by-statistics
								company-sort-by-occurrence))

(setq company-require-match nil)

(yas-global-mode t)

;; YASnippet のスニペットを候補に表示するための設定
(defvar company-mode/enable-yas t "Enable yasnippet for all backends.")
(defun company-mode/backend-with-yas (backend)
  (if (or (not company-mode/enable-yas)
	  (and (listp backend)
	       (member 'company-yasnippet backend)))
      backend
    (append (if (consp backend)
		backend
	      (list backend))
	    '(:with company-yasnippet))))
(defun set-yas-as-company-backend ()
  (setq company-backends (mapcar #'company-mode/backend-with-yas company-backends)))
(add-hook 'company-mode-hook 'set-yas-as-company-backend)

;; (package-install  #'auto-complete)
;; (global-auto-complete-mode t)
;; (setq ac-auto-start 1)
;; (setq-default ac-sources  #'(ac-source-filename ac-source-words-in-same-mode-buffers))
;; (add-hook 'emacs-lisp-mode-hook (lambda () (add-to-list 'ac-sources 'ac-source-symbols t )))


(global-undo-tree-mode t)

;;ivy設定
(require 'ivy-rich)
(ivy-mode 1)
(ivy-rich-mode t)
(setq ivy-re-builders-alist #'((t . ivy--regex-ignore-order)))


;; enable smartparens
(require #'smartparens)
(sp-with-modes '(emacs-lisp-mode lisp-mode lisp-interaction-mode
				 ;;slime-mode
				 clojure-mode
				 )
  (sp-local-pair "'" nil :actions nil)
  (sp-local-pair "`" nil :actions nil))
(smartparens-global-mode 1)

(show-smartparens-global-mode 1)

;;leaven theme
(require #'moe-theme)
;; (moe-dark)
;; (load-theme 'moe-dark)
;; (enable-theme 'moe-dark)

;; enable which key mode
(which-key-mode t)
;; enable multiple cursor
(multiple-cursors-mode 1)
;; enable powerline
(powerline-default-theme)
;;install magit
;;(package-install  #'magit)


;; install multi-term


;; dired の圧縮・解凍機能で atool を使う
(define-key dired-mode-map "z" #'dired-atool-do-unpack)
(define-key dired-mode-map "Z" #'dired-atool-do-pack)




;; インデントに合わせて折り返し
(define-globalized-minor-mode global-adaptive-wrap-prefix-mode
  adaptive-wrap-prefix-mode
  (lambda ()
    (adaptive-wrap-prefix-mode 1)))
(global-adaptive-wrap-prefix-mode 1)

(setq-default cursor-type '(bar . 1)) ;;括弧の深さをカラーコードで表す
(require #'rainbow-delimiters)
(setq rainbow-delimiters-outermost-only-face-count 1)

(set-face-foreground #'rainbow-delimiters-depth-1-face
		     "#9a4040")
(set-face-foreground #'rainbow-delimiters-depth-2-face
		     "#ff5e5e")
(set-face-foreground #'rainbow-delimiters-depth-3-face
		     "#ffaa77")
(set-face-foreground #'rainbow-delimiters-depth-4-face
		     "#dddd77")
(set-face-foreground #'rainbow-delimiters-depth-5-face
		     "#80ee80")
(set-face-foreground #'rainbow-delimiters-depth-6-face
		     "#66bbff")

(set-face-foreground #'rainbow-delimiters-depth-7-face
		     "#da6bda")
(set-face-foreground #'rainbow-delimiters-depth-8-face
		     "#afafaf")
(set-face-foreground #'rainbow-delimiters-depth-9-face
		     "#f0f0f0")

(define-globalized-minor-mode global-rainbow-delimiters-mode
  rainbow-delimiters-mode
  (lambda ()
    (rainbow-delimiters-mode 1)))
(global-rainbow-delimiters-mode 1)


;; ewwのデフォルトのエンジンをgoogleに
(setq eww-search-prefix "https://www.google.co.jp/search?q=")

(global-set-key (kbd "<f1> ESC")
		#'execute-extended-command)

(global-set-key (kbd "C-l")
		#'redraw-display)

(setq exwm-input-global-keys `(([?\M-x] . counsel-M-x)
			       ([?\M-m] . Control-X-prefix)))

(counsel-mode t)

(require #'srefactor-lisp)

(require #'general)
(exwm-input-set-key (kbd "M-y")
		    #'gpastel-exwm-counsel-yank-pop)

(defun my-goto-line-beginning-or-indent (&optional $position)
  "copied from https://qiita.com/ShingoFukuyama/items/62269c4904ca085f9149"
  (interactive)
  (or $position (setq $position (point)))
  (let (($starting-position (progn (back-to-indentation) (point))))
    (if (eq $starting-position $position)
	(move-beginning-of-line 1))))

(general-define-key
 :keymaps 'global-map
 "M-m" 'Control-X-prefix
 "M-y" 'gpastel-exwm-counsel-yank-pop
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
 "C-o" 'ivy-occur)

(eval-after-load "lispy"
  `(progn
     ;; ;; replace a global binding with own function
     ;; (define-key lispy-mode-map (kbd "C-e") 'my-custom-eol)
     ;; ;; replace a global binding with major-mode's default
     ;; (define-key lispy-mode-map (kbd "C-j") nil)
     ;; ;; replace a local binding
     ;; (lispy-define-key lispy-mode-map "s" 'lispy-down)
     (general-define-key
      :keymaps 'lispy-mode-map
      "M-m" nil
      "M-m M-m" 'lispy-mark-symbol
      "C-y" 'undo-tree-redo
      "C-v" 'lispy-yank)))



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






(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(all-the-icons-ivy-buffer-commands
   (quote
    (ivy-switch-buffer ivy-switch-buffer-other-window counsel-projectile-switch-to-buffer exwm-workspace-switch-to-buffer)))
 '(company-backends
   (quote
    ((company-bbdb :with company-yasnippet)
     (company-eclim :with company-yasnippet)
     (company-semantic :with company-yasnippet)
     (company-clang :with company-yasnippet)
     (company-xcode :with company-yasnippet)
     (company-cmake :with company-yasnippet)
     (company-files :with company-yasnippet)
     (company-dabbrev-code company-gtags company-etags company-keywords :with company-yasnippet)
     (company-oddmuse :with company-yasnippet)
     (company-dabbrev :with company-yasnippet))))
 '(counsel-linux-app-format-function (quote counsel-linux-app-format-function-default))
 '(custom-safe-themes
   (quote
    ("203fe0858c2018058526eff9887b06facf5044a94cf8af4dbf66bd16057d28f1" "e61752b5a3af12be08e99d076aedadd76052137560b7e684a8be2f8d2958edc3" "d88c43fe03ac912e35963695caf0ae54bc6ce6365c3a42da434ef639f7a37399" "d70c11f5a2b69a77f9d56eff42090138721d4c51d9d39ce986680786d694f492" "26d49386a2036df7ccbe802a06a759031e4455f07bda559dcf221f53e8850e69" "43c1a8090ed19ab3c0b1490ce412f78f157d69a29828aa977dae941b994b4147" default)))
 '(desktop-globals-to-clear nil)
 '(desktop-globals-to-save
   (quote
    (kill-ring desktop-missing-file-warning tags-file-name tags-table-list search-ring regexp-search-ring register-alist file-name-history)))
 '(desktop-save-mode t)
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
 '(face-font-family-alternatives
   (quote
    (("Monospace" "courier" "fixed" "ipa-gothic")
     ("Monospace Serif" "Courier 10 Pitch" "Consolas" "Courier Std" "FreeMono" "Nimbus Mono L" "courier" "fixed")
     ("courier" "CMU Typewriter Text" "fixed")
     ("Sans Serif" "helv" "helvetica" "arial" "fixed")
     ("helv" "helvetica" "arial" "fixed"))))
 '(fci-rule-color "#202020")
 '(flycheck-display-errors-function (function flycheck-pos-tip-error-messages))
 '(flycheck-pos-tip-mode t)
 '(global-company-mode t)
 '(global-hl-line-mode t)
 '(global-hl-line-sticky-flag t)
 '(icomplete-mode t)
 '(ivy-height 40)
 '(ivy-height-alist nil)
 '(ivy-rich-mode t)
 '(line-spacing 0.2)
 '(linum-format "%2d")
 '(lispy-compat (quote (edebug cider)))
 '(lispy-eval-display-style (quote overlay))
 '(mode-icons-mode t)
 '(nil nil t)
 '(package-selected-packages
   (quote
    (magit elein elien clj-refactor cider CIDER all-the-icons m-buffer ov el-doc pcre2el swiper flx markdown-mode pyvenv highlight-indentation find-file-in-project auto-complete jedi-core python-environment epc ctable concurrent deferred popup pos-tip pkg-info epl f dash s memoize quelpa package yasnippet yasnippet-snippets layout-restore poet-theme neotree all-the-icons-dired all-the-icons-ivy htmlize gpastel ivy-rich company-statistics switch-window rust-mode ace-window flycheck-pos-tip flycheck-popup-tip flycheck-rust racer cargo elpy flycheck indent-guide-mode indent-guide pipenv company-lua lua-mode auto-virtualenvwrapper virtualenvwrapper virtalenvwrapper flymake-python company-jedi py-autopep8 jedi counsel-jedi yaml-mode review-mode add-hooks ddskk exwm-edit org-plus-contrib nix-mode adaptive-wrap mozc company-quickhelp company-quickhelp-mode company-flx company smex mozc-mode moe leuven-theme leuven leaven uimage twittering-mode auto-sudoedit w3m general counsel avy winner exwm-surf winner-mode undo-tree rainbow-delimiters dired-toggle-sudo dired-atool multi-term powerline multiple-cursors which-key ivy exwm moe-theme smartparens helm 0blayout exwm-x)))
 '(rust-always-locate-project-on-open t)
 '(skk-jisyo-edit-user-accepts-editing t)
 '(smartparens-global-mode t)
 '(switch-window-mouse-mode t nil (switch-window))
 '(tool-bar-mode nil)
 '(tooltip-delay 0.3)
 '(tooltip-hide-delay 100)
 ;; '(whitespace-display-mappings nil)
 '(window-divider-default-places t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(hl-line ((t (:background "grey30")))))

(put 'dired-find-alternate-file 'disabled
     nil)
