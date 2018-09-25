
(require 'package)
;; MELPAを追加
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; MELPA-stableを追加
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
;; Marmaladeを追加
(add-to-list 'package-archives  '("marmalade" . "http://marmalade-repo.org/packages/") t)
;; Orgを追加
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
;; 初期化
(package-initialize)


(package-install 'exwm)
(require 'exwm)
(require 'exwm-config)
(exwm-config-default)

;; (add-to-list 'load-path "/home/linguini/.emacs.d/elpa/exwm-x-20180227.1057")



(package-install 'undo-tree)



;; ivy設定
(package-install 'ivy)
(require 'ivy)
(ivy-mode 1)
(setq ivy-re-builders-alist
      '((t . ivy--regex-ignore-order)))


;; enable smartparens
(package-install 'smartparens)
(require 'smartparens)
(smartparens-mode 1)


;; moe theme
(package-install 'moe-theme)
(load-theme 'moe-dark 1)

;; enable which key mode
(package-install 'which-key)
(require 'which-key)
(which-key-mode 1)

;; enable multiple cursor
(package-install 'multiple-cursors)
(require 'multiple-cursors)
(multiple-cursors-mode 1)


;; enable powerline
(package-install 'powerline)
(require 'powerline)
(powerline-default-theme)

;; install magit
(package-install 'magit)
 

;; install multi-term
(package-install 'multi-term)


;; dired の圧縮・解凍機能で atool を使う
(package-install 'dired-atool)
(require 'dired)
(define-key dired-mode-map "z" #'dired-atool-do-unpack)
(define-key dired-mode-map "Z" #'dired-atool-do-pack)


;; install sudo-mode
(package-install 'dired-toggle-sudo)


;; インデントに合わせて折り返し
(package-install 'adaptive-wrap)


;; 括弧の深さをカラーコードで表す
(package-install 'rainbow-delimiters)
(require 'rainbow-delimiters)
(rainbow-delimiters-mode t)
(setq rainbow-delimiters-outermost-only-face-count 1)

(set-face-foreground 'rainbow-delimiters-depth-1-face "#9a4040")
(set-face-foreground 'rainbow-delimiters-depth-2-face "#ff5e5e")
(set-face-foreground 'rainbow-delimiters-depth-3-face "#ffaa77")
(set-face-foreground 'rainbow-delimiters-depth-4-face "#dddd77")
(set-face-foreground 'rainbow-delimiters-depth-5-face "#80ee80")
(set-face-foreground 'rainbow-delimiters-depth-6-face "#66bbff")
(set-face-foreground 'rainbow-delimiters-depth-7-face "#da6bda")
(set-face-foreground 'rainbow-delimiters-depth-8-face "#afafaf")
(set-face-foreground 'rainbow-delimiters-depth-9-face "#f0f0f0")

;; ewwのデフォルトのエンジンをgoogleに
(setq eww-search-prefix "https://www.google.co.jp/search?q=")


                                        ; 半角ｶﾅ設定
(set-fontset-font (frame-parameter nil 'font)
                  'katakana-jisx0201
                  (font-spec :family "NasuM" :size  14))

                                        ; 全角かな設定
(set-fontset-font (frame-parameter nil 'font)
                  'japanese-jisx0208
                  (font-spec :family "NasuM" :size 14))

                                        ; ずれ確認用
                                        ; abcdefghijklmnopqrstuvwxyzabcdefghijklmn
                                        ; 0123456789012345678901234567890123456789
                                        ; ｱｲｳｴｵｱｲｳｴｵｱｲｳｴｵｱｲｳｴｵｱｲｳｴｵｱｲｳｴｵｱｲｳｴｵｱｲｳｴｵ
                                        ; あいうえおあいうえおあいうえおあいうえお
                                        ; 愛愛愛愛愛愛愛愛愛愛愛愛愛愛愛愛愛愛愛愛


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("26d49386a2036df7ccbe802a06a759031e4455f07bda559dcf221f53e8850e69" default)))
 '(face-font-family-alternatives
   (quote
    (("Monospace" "courier" "fixed" "ipa-gothic")
     ("Monospace Serif" "Courier 10 Pitch" "Consolas" "Courier Std" "FreeMono" "Nimbus Mono L" "courier" "fixed")
     ("courier" "CMU Typewriter Text" "fixed")
     ("Sans Serif" "helv" "helvetica" "arial" "fixed")
     ("helv" "helvetica" "arial" "fixed"))))
 '(package-selected-packages
   (quote
    (undo-tree rainbow-delimiters adaptive-wrap dired-toggle-sudo dired-atool multi-term magit powerline multiple-cursors which-key ivy exwm moe-theme smartparens helm 0blayout exwm-x))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(put 'dired-find-alternate-file 'disabled nil)
