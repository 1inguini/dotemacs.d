
;;; package --- Summary
;;; Commentary:
;;; Code:
;; (setenv "LANG" "ja_JP.UTF-8")

(locale-name-match (locale-translate "ja_JP.UTF-8")
		   locale-language-names)

(locale-name-match (locale-translate "ja_JP.UTF-8")
		   locale-charset-language-names)

(set-language-environment "Japanese")

(prefer-coding-system 'utf-8)
(setq coding-system-for-read 'utf-8)
(setq coding-system-for-write 'utf-8)

(require #'package)
;; MELPAを追加
(add-to-list #'package-archives #'("melpa" . "https://melpa.org/packages/") t)
;; MELPA-stableを追加
(add-to-list #'package-archives #'("melpa-stable" . "https://stable.melpa.org/packages/") t)
;; Marmaladeを追加
(add-to-list #'package-archives  #'("marmalade" . "http://marmalade-repo.org/packages/") t)
;; Orgを追加
(add-to-list #'package-archives #'("org" . "http://orgmode.org/elpa/") t)

(setq package-check-signature nil)
;; 初期化
(package-initialize)


(package-install #'exwm)
(require 'exwm)
;; (package-install #'exwm-x)
;; (require 'exwmx-sendstring)
;; (add-to-list 'load-path "/home/linguini/.emacs.d/elpa/exwm-x-20180227.1057"

;; set exwm buffer name according to application
(defun exwm-rename-buffer-to-title () (exwm-workspace-rename-buffer exwm-title))
(add-hook 'exwm-update-title-hook 'exwm-rename-buffer-to-title)

(setq exwm-workspace-number 3)

;; (require 'exwm-systemtray)
;; (exwm-systemtray-enable)m


(require 'exwm-randr)
(exwm-randr-enable)
(setq exwm-randr-workspace-output-plist '(0 "HDMI1" 1 "HDMI-0" 2 "DP1"))
(add-hook 'exwm-randr-screen-change-hook
          (lambda ()
            (async-shell-command
	     "
compton &

plank -n dock1
")))

(package-install #'exwm-edit)

;; Turn on `display-time-mode' if you don't use an external bar.
(setq display-time-default-load-average nil)
(display-time-mode nil)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(fringe-mode 1)

;; (add-to-list 'load-path "/home/linguini/.emacs.d/elpa/ibus-el-0.3.29")
;; (require #'ibus)
;; (add-hook 'after-init-hook 'ibus-mode-on)

;;(setq mozc-helper-program-name "home/linguini/.cache/yay/mozc/pkg/emacs-mozc/usr/bin/mozc_emacs_helper")
(require #'mozc)
(setq default-input-method "japanese-mozc")

(package-install 'ddskk)
(require #'skk)
;; M-x skk-tutorialでNo file found as 〜とエラーが出たときにskk-tut-fileを設定
;; make what-whereでSKK tutorialsで表示されるディレクトリ上のSKK.tutを指定
(setq skk-tut-file "/usr/share/skk/SKK.tut")
;; (setq SKK_DATADIR "/usr/share/skk")
(setq skk-show-annotation nil)
(setq skk-show-inline 'vertical)
(setq skk-auto-insert-paren t)
(setq skk-egg-like-newline t)


(setq recentf-auto-cleanup 'never)


(package-install #'org-plus-contrib)
(require 'ox-latex)
(require 'ox-bibtex)

;;; LaTeX 形式のファイル PDF に変換するためのコマンド
(setq org-latex-pdf-process
      '("platex %f"
        "platex %f"
        "bibtex %b"
        "platex %f"
        "platex %f"
        "dvipdfmx %b.dvi"))

;;; \hypersetup{...} を出力しない
;; (setq org-latex-with-hyperref nil)

(add-to-list 'org-latex-classes
             '("thesis"
               "\\documentclass{jarticle}
                [NO-PACKAGES]
                [NO-DEFAULT-PACKAGES]
                \\usepackage[dvipdfmx]{graphicx}"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))


(package-install 'nix-mode)


(package-install #'twittering-mode)
(require #'twittering-mode)
(twittering-icon-mode 1)
(setq twittering-use-master-password t)

(package-install #'auto-sudoedit)


(package-install #'w3m)


;; ace jump mode major function
(package-install #'avy)



(package-install #'winner)
(winner-mode 1)



(package-install #'company)
(package-install #'company-flx)
(package-install #'company-quickhelp)

(global-company-mode t)

(with-eval-after-load 'company
  (company-flx-mode t))

(company-quickhelp-mode t)
 
(setq company-quickhelp-delay 0)
;; (set-face-attribute 'company-tooltip nil
;;                     :foreground "black" :background "lightgrey")
;; (set-face-attribute 'company-tooltip-common nil
;;                     :foreground "black" :background "lightgrey")
;; (set-face-attribute 'company-tooltip-common-selection nil
;;                     :foreground "white" :background "steelblue")
;; (set-face-attribute 'company-tooltip-selection nil
;;                     :foreground "black" :background "steelblue")
;; (set-face-attribute 'company-preview-common nil
;;                     :background nil :foreground "lightgrey" :underline t)
;; (set-face-attribute 'company-scrollbar-fg nil
;;                     :background "orange")
;; (set-face-attribute 'company-scrollbar-bg nil
;;                     :background "gray40")

 
;; (package-install #'auto-complete)
;; (global-auto-complete-mode t)
;; (setq ac-auto-start 1)
;; (setq-default ac-sources #'(ac-source-filename ac-source-words-in-same-mode-buffers))
;; (add-hook 'emacs-lisp-mode-hook (lambda () (add-to-list 'ac-sources 'ac-source-symbols t )))


(package-install #'undo-tree)
(global-undo-tree-mode t)


;; ivy設定
(package-install #'counsel)
(package-install #'smex)
(ivy-mode 1)
(ivy-rich-mode t)
(setq ivy-re-builders-alist
      #'((t . ivy--regex-ignore-order)))

;; enable smartparens
(package-install #'smartparens)
(require #'smartparens)
(smartparens-global-mode 1)


;; leaven theme
(package-install #'leuven-theme)
(package-install #'moe-theme)
(load-theme #'moe-dark t)


;; enable which key mode
(package-install #'which-key)
(which-key-mode 1)


;; enable multiple cursor
(package-install #'multiple-cursors)
(multiple-cursors-mode 1)


;; enable powerline
(package-install #'powerline)
(powerline-default-theme)

;; install magit
;; (package-install #'magit)
 

;; install multi-term
(package-install #'multi-term)


;; dired の圧縮・解凍機能で atool を使う
(package-install #'dired-atool)
(define-key dired-mode-map "z" #'dired-atool-do-unpack)
(define-key dired-mode-map "Z" #'dired-atool-do-pack)


;; install sudo-mode
(package-install #'dired-toggle-sudo)


;; インデントに合わせて折り返し
(package-install #'adaptive-wrap)
(adaptive-wrap-prefix-mode 1)


(setq-default cursor-type '(bar . 1))


;; 括弧の深さをカラーコードで表す
(package-install #'rainbow-delimiters)
(rainbow-delimiters-mode t)
(setq rainbow-delimiters-outermost-only-face-count 1)

(set-face-foreground #'rainbow-delimiters-depth-1-face "#9a4040")
(set-face-foreground #'rainbow-delimiters-depth-2-face "#ff5e5e")
(set-face-foreground #'rainbow-delimiters-depth-3-face "#ffaa77")
(set-face-foreground #'rainbow-delimiters-depth-4-face "#dddd77")
(set-face-foreground #'rainbow-delimiters-depth-5-face "#80ee80")
(set-face-foreground #'rainbow-delimiters-depth-6-face "#66bbff")

(set-face-foreground #'rainbow-delimiters-depth-7-face "#da6bda")
(set-face-foreground #'rainbow-delimiters-depth-8-face "#afafaf")
(set-face-foreground #'rainbow-delimiters-depth-9-face "#f0f0f0")

;; ewwのデフォルトのエンジンをgoogleに
(setq eww-search-prefix "https://www.google.co.jp/search?q=")

(global-set-key (kbd "<f1> ESC") #'execute-extended-command)

(global-set-key (kbd "C-l") #'redraw-display)

(setq exwm-input-global-keys
      `(([?\M-x] . counsel-M-x)
	([?\M-m] . Control-X-prefix)
	))

(counsel-mode t)

(package-install 'general)
(general-define-key
 :keymaps 'global-map
 "M-m" 'Control-X-prefix
 "M-<tab>" 'switch-to-buffer
 "C-c" 'nil ;;kill-ring-save
 "C-x" 'kill-region
 "C-v" 'yank
 "C-z" 'undo-tree-undo
 "C-y" 'undo-tree-redo
 "C-s" 'save-buffer
 "C-f" 'swiper 
 ;; "C-b" 'previous-buffer
 "M-<left>" 'backward-word
 "M-<right>" 'forward-word
 )

(general-define-key
 :keymaps 'ivy-minibuffer-map
 "M-<tab>" 'next-line
 "M-<iso-lefttab>" 'previous-line
 )

(general-define-key
 :keymaps 'ctl-x-map
 "C-b" 'swiper-multi
 "t" 'universal-argument
 "c" 'mode-specific-command-prefix
 "w" 'exwm-edit--compose
 "M-j" 'skk-mode
 )


(general-define-key
 :keymaps 'mode-specific-map
 "<left>" 'winner-undo
 "<right>" 'winner-redo
 )


(general-define-key
 :keymaps 'swiper-map
 "C-r" 'swiper-query-replace
 "C-z" 'ivy-reverse-i-search
 )

;; (general-define-key
;;  :keymaps 'global-map
;;  :prefix "M-b"
;;  "" nil
;;  "s" 'ivy-switch-buffer
;;  "e" 'eval-buffer
;;  "i" 'ibuffer
;;  "M-k" 'kill-buffer
;;  "k" 'kill-current-buffer+
;;  )



                                        ; 半角ｶﾅ設定
(set-fontset-font (frame-parameter nil #'font)
                  #'katakana-jisx0201
                  (font-spec :family "NasuM" :size 12))

                                        ; 全角かな設定
(set-fontset-font (frame-parameter nil #'font)
		  #'japanese-jisx0208
                  (font-spec :family "NasuM" :size 12))

                                        ;; ずれ確認用
                                        ;; abcdefghijklmnopqrstuvwxyzabcdefghijklmn
                                        ;; 0123456789012345678901234567890123456789
                                        ;; ｱｲｳｴｵｱｲｳｴｵｱｲｳｴｵｱｲｳｴｵｱｲｳｴｵｱｲｳｴｵｱｲｳｴｵｱｲｳｴｵ
                                        ;; あいうえおあいうえおあいうえおあいうえお
                                        ;; 愛愛愛愛愛愛愛愛愛愛愛愛愛愛愛愛愛愛愛愛




(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(desktop-globals-to-save
   (quote
    (kill-ring desktop-missing-file-warning tags-file-name tags-table-list search-ring regexp-search-ring register-alist file-name-history)))
 '(desktop-save-mode t)
 '(display-time-mode t)
 '(exwm-input-line-mode-passthrough nil)
 '(exwm-input-move-event [M-down-mouse-1])
 '(exwm-input-resize-event [M-down-mouse-3])
 '(face-font-family-alternatives
   (quote
    (("Monospace" "courier" "fixed" "ipa-gothic")
     ("Monospace Serif" "Courier 10 Pitch" "Consolas" "Courier Std" "FreeMono" "Nimbus Mono L" "courier" "fixed")
     ("courier" "CMU Typewriter Text" "fixed")
     ("Sans Serif" "helv" "helvetica" "arial" "fixed")
     ("helv" "helvetica" "arial" "fixed"))))
 '(fringe-mode 0 nil (fringe))
 '(icomplete-mode t)
 '(package-selected-packages
   (quote
    (add-hooks ddskk exwm-edit org-plus-contrib nix-mode adaptive-wrap mozc company-quickhelp company-quickhelp-mode company-flx company smex mozc-mode moe leuven-theme leuven leaven uimage twittering-mode auto-sudoedit w3m general counsel avy winner exwm-surf winner-mode undo-tree rainbow-delimiters dired-toggle-sudo dired-atool multi-term powerline multiple-cursors which-key ivy exwm moe-theme smartparens helm 0blayout exwm-x)))
 '(skk-jisyo-edit-user-accepts-editing t)
 '(smartparens-global-mode t)
 '(tool-bar-mode nil)
 '(window-divider-default-places t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Inconsolata" :foundry "PfEd" :slant normal :weight normal :height 113 :width normal)))))



(put 'dired-find-alternate-file 'disabled nil)
