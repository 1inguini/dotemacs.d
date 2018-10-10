;;; package --- Summary
;;; Commentary:
;;; Code:

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
;; (add-to-list 'load-path "/home/linguini/.emacs.d/elpa/exwm-x-20180227.1057"

;; set exwm buffer name according to application
(defun exwm-rename-buffer-to-title () (exwm-workspace-rename-buffer exwm-title))
(add-hook 'exwm-update-title-hook 'exwm-rename-buffer-to-title)

;; don't send keys to application while line-mode


;; Turn on `display-time-mode' if you don't use an external bar.
(setq display-time-default-load-average nil)
(display-time-mode nil)

(menu-bar-mode t)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(fringe-mode 1)

;; (add-to-list 'load-path "/home/linguini/.emacs.d/elpa/ibus-el-0.3.29")
;; (require #'ibus)
;; (add-hook 'after-init-hook 'ibus-mode-on)

;;(setq mozc-helper-program-name "home/linguini/.cache/yay/mozc/pkg/emacs-mozc/usr/bin/mozc_emacs_helper")
(require #'mozc)
(setq default-input-method "japanese-mozc")


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
(smartparens-mode 1)


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
(package-install #'magit)
 

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


(setq cursor-type '(bar . 1))


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



(set-face-attribute 'default nil :family "inconsolata" :height 120)

                                        ; 半角ｶﾅ設定
(set-fontset-font (frame-parameter nil #'font)
                  #'katakana-jisx0201
                  (font-spec :family "NasuM" :size  16))

                                        ; 全角かな設定
(set-fontset-font (frame-parameter nil #'font)
		  #'japanese-jisx0208
                  (font-spec :family "NasuM" :size 16))

                                        ;; ずれ確認用
                                        ;; abcdefghijklmnopqrstuvwxyzabcdefghijklmn
                                        ;; 0123456789012345678901234567890123456789
                                        ;; ｱｲｳｴｵｱｲｳｴｵｱｲｳｴｵｱｲｳｴｵｱｲｳｴｵｱｲｳｴｵｱｲｳｴｵｱｲｳｴｵ
                                        ;; あいうえおあいうえおあいうえおあいうえお
                                        ;; 愛愛愛愛愛愛愛愛愛愛愛愛愛愛愛愛愛愛愛愛


(global-set-key (kbd "<f1> ESC") #'execute-extended-command)

(global-set-key (kbd "C-l") #'avy-goto-line)

(setq exwm-input-global-keys
      `(([?\M-x] . execute-extended-command)
	([?\M-m] . Control-X-prefix)
	))


(package-install 'general)
(general-define-key
 :keymaps 'global-map

 "C-c" 'kill-ring-save
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
 :keymaps 'ctl-x-map
 "C-b" 'swiper-multi
 "t" 'universal-argument
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
;;  "k" 'kill-current-buffer
;;  )

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#303030" "#ff4b4b" "#d7ff5f" "#fce94f" "#5fafd7" "#d18aff" "#afd7ff" "#c6c6c6"])
 '(custom-safe-themes
   (quote
    ("13d20048c12826c7ea636fbe513d6f24c0d43709a761052adbca052708798ce3" "e61752b5a3af12be08e99d076aedadd76052137560b7e684a8be2f8d2958edc3" "43c1a8090ed19ab3c0b1490ce412f78f157d69a29828aa977dae941b994b4147" "26d49386a2036df7ccbe802a06a759031e4455f07bda559dcf221f53e8850e69" default)))
 '(exwm-input-line-mode-passthrough t)
 '(face-font-family-alternatives
   (quote
    (("Monospace" "courier" "fixed" "ipa-gothic")
     ("Monospace Serif" "Courier 10 Pitch" "Consolas" "Courier Std" "FreeMono" "Nimbus Mono L" "courier" "fixed")
     ("courier" "CMU Typewriter Text" "fixed")
     ("Sans Serif" "helv" "helvetica" "arial" "fixed")
     ("helv" "helvetica" "arial" "fixed"))))
 '(icomplete-mode t)
 '(package-selected-packages
   (quote
    (adaptive-wrap mozc company-quickhelp company-quickhelp-mode company-flx company smex mozc-mode moe leuven-theme leuven leaven uimage twittering-mode auto-sudoedit w3m general counsel avy winner exwm-surf winner-mode undo-tree rainbow-delimiters dired-toggle-sudo dired-atool multi-term magit powerline multiple-cursors which-key ivy exwm moe-theme smartparens helm 0blayout exwm-x))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(put 'dired-find-alternate-file 'disabled nil)

