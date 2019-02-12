;;; Commentary:

;;; Code:

(require  #'package)
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

;; packages to be installed in both gui and cui
(setq my-gui-packages
      ;; packages to be installed only in gui
      #'(exwm gpastel))



(setq my-common-packages #'(telephone-line
			    centered-cursor-mode
			    calfw-org
			    diff-hl
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
