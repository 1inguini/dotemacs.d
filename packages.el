;;; Commentary:

;;; Code:

(require  #'package)

(setq package-archives
      '(
	("elpa" . "https://elpa.gnu.org/packages/")
	;; MELPAを追加
	("melpa" . "https://melpa.org/packages/")
	;; MELPA-stableを追加
	("melpa-stable" . "https://stable.melpa.org/packages/")
	;; Marmaladeを追加
	("marmalade" . "http://marmalade-repo.org/packages/")
	;; Orgを追加
	("org" . "http://orgmode.org/elpa/")
	;; emacswikiを追加
	("emacswiki" . "http://www.emacswiki.org/emacs/download/"))

      package-archive-priorities
      '(("elpa" . 15)
	("melpa-stable" . 10)
	("melpa" . 5)
	("marmalade" . 1)
	("org" . 0)))

(setq package-check-signature nil)
;;初期化
(package-initialize)

;; packages to be installed in both gui and cui
(setq my-gui-packages
      ;; packages to be installed only in gui
      #'(exwm
	 gpastel))

(setq my-common-packages #'(yaml-mode
			    exec-path-from-shell
			    lsp-mode
			    lsp-ui
			    company-lsp
			    lsp-haskell
			    haskell-mode
			    haskell-snippets
			    smart-hungry-delete
			    sml-mode
			    dune
			    flycheck-ocaml
			    merlin-eldoc
			    merlin
			    tuareg
			    arduino-mode
			    company-arduino
			    rainbow-mode
			    winum
			    telephone-line
			    centered-cursor-mode
			    calfw-org
			    calfw
			    git-gutter-fringe+
			    ;; diff-hl
			    lispxmp
			    highlight-indent-guides
			    quickrun
			    flycheck-nim
			    nim-mode
			    eglot
			    clang-format
			    shackle
			    diminish
			    projectile
			    elein
			    use-package
			    cider
			    clj-refactor
			    clojure-mode
			    s
			    srefactor
			    m-buffer
			    ov
			    elisp-def
			    pcre2el
			    lispy
			    switch-window
			    lua-mode
			    company-lua
			    yasnippet-snippets
			    flycheck
			    flycheck-pos-tip
			    flycheck-popup-tip
			    py-autopep8
			    jedi
			    company-jedi
			    pipenv
			    elpy
			    rust-mode
			    cargo
			    racer
			    flycheck-rust
			    ;; indent-guide
			    review-mode
			    org-plus-contrib
			    nix-mode
			    auto-sudoedit
			    avy
			    winner
			    company-quickhelp
			    company
			    company-flx
			    company-statistics
			    undo-tree
			    counsel
			    smex
			    ivy-rich
			    smartparens
			    leuven-theme
			    moe-theme
			    which-key
			    multiple-cursors
			    powerline
			    multi-term
			    dired-atool
			    dired-toggle-sudo
			    adaptive-wrap
			    rainbow-delimiters
			    general
			    switch-window))


(setq my-cui-packages
      ;; packages to be installed only in cui
      #'())

(dolist (package my-common-packages)
  (unless (package-installed-p package)
    (package-install package)))

(if window-system
    (progn
      (dolist (package my-gui-packages)
	(unless (package-installed-p package)
	  (package-install package)))))

(if (not window-system)
    (progn
      (dolist (package my-cui-packages)
	(unless (package-installed-p package)
	  (package-install package)))))
