;;; ddskk-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


(let ((loads (get 'context-skk 'custom-loads))) (if (member '"context-skk" loads) nil (put 'context-skk 'custom-loads (cons '"context-skk" loads))))

(defvar context-skk-context-check-hook '(context-skk-out-of-string-or-comment-in-programming-mode-p context-skk-on-keymap-defined-area-p context-skk-in-read-only-p) "\
*日妨貽呂鮗暗Ⅳ 閹にしたい「コンテキスト」にいれば t を返す
関数を登録する。")

(custom-autoload 'context-skk-context-check-hook "context-skk" t)

(defvar context-skk-programming-mode '(ada-mode antlr-mode asm-mode autoconf-mode awk-mode c-mode objc-mode java-mode idl-mode pike-mode cperl-mode delphi-mode f90-mode fortran-mode icon-mode idlwave-mode inferior-lisp-mode lisp-mode m4-mode makefile-mode metafont-mode modula-2-mode octave-mode pascal-mode perl-mode prolog-mode ps-mode postscript-mode ruby-mode scheme-mode sh-mode simula-mode tcl-mode vhdl-mode emacs-lisp-mode) "\
*context-skk にて「プログラミングモード」と見做すモードのリスト")

(custom-autoload 'context-skk-programming-mode "context-skk" t)

(defvar context-skk-mode-hook nil "\
*`context-skk-mode' を切り替える際に呼ばれるフック。")

(custom-autoload 'context-skk-mode-hook "context-skk" t)

(defvar context-skk-mode-on-hook nil "\
*`context-skk-mode' が on になる際に呼ばれるフック。")

(custom-autoload 'context-skk-mode-on-hook "context-skk" t)

(defvar context-skk-mode-off-hook nil "\
*`context-skk-mode' が off になる際に呼ばれるフック。")

(custom-autoload 'context-skk-mode-off-hook "context-skk" t)

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; ddskk-autoloads.el ends here
