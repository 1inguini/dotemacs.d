;;; skk-jisx0201.el --- JIS X 0201 カナ, Roman -*- coding: iso-2022-7bit -*-

;; Copyright (C) 1999-2007  SKK Development Team <skk@ring.gr.jp>

;; Author: Tsukamoto Tetsuo <czkmt@remus.dti.ne.jp>
;; Maintainer: SKK Development Team <skk@ring.gr.jp>
;; Keywords: japanese, mule, input method
;; Created: Oct. 30, 1999.

;; This file is part of Daredevil SKK.

;; Daredevil SKK is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 2, or
;; (at your option) any later version.

;; Daredevil SKK is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with Daredevil SKK, see the file COPYING.  If not, write to
;; the Free Software Foundation Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Commentary:

;; <簡単な説明>
;;
;; ~/.skk に
;;
;; (setq skk-use-jisx0201-input-method t)
;;
;; と書くことでインストールされます。使い方は以下のようになります。
;;
;; ◎カタカナモードにおいて、
;;   ・"C-q" で全角カナモードと半角カナモードを切りかえます。
;;
;; ◎ひらがな/カタカナ両モード内での▽モードにおいて、
;;   ・"C-q" を押すと、見出し語として入力されたひらがな/カタカナをハンカクカタカナに変
;;     換します。
;;
;; `skk-jisx0201-roman-rule-list' に JISX0201.1976 Japanese Roman
;; (latin-jisx0201) の文字列を定義しています。ただし GNU Emacs 23 以降、ファ
;; イル保存時に JIS X 0201 Roman と ASCII の区別がされなくなったようです (円
;; 記号およびオーバーラインを除く)。したがってこのファイルの現行版では、これ
;; らの 2 文字以外は ASCII の文字が定義されています。
;;
;; カナ と roman を切り替える機能 `skk-toggle-jisx0201' にはキー定義していませ
;; ん。
;;
;; <業務連絡>
;;
;; GNU Emacs 20.3 〜 22 でこのファイルを編集する場合は、ファイルを開く前に
;;
;; (setq standard-translation-table-for-decode (make-translation-table nil))
;;
;; を評価してください。

;;; Code:

(eval-when-compile
  (require 'skk-macs)
  (require 'skk-vars))

(require 'japan-util)

;; 諸般の事情により skk-vars.el に入れるべきでない変数
(defvar skk-jisx0201-base-rule-list
  '(("a" nil "ア")
    ("bb" "b" "ッ") ("ba" nil "バ") ("be" nil "ベ")
    ("bi" nil "ビ") ("bo" nil "ボ") ("bu" nil "ブ") ("bya" nil "ビャ")
    ("bye" nil "ビェ") ("byi" nil "ビィ") ("byo" nil "ビョ") ("byu" nil "ビュ")
    ("cc" "c" "ッ") ("cha" nil "チャ") ("che" nil "チェ") ("chi" nil "チ")
    ("cho" nil "チョ") ("chu" nil "チュ") ("cya" nil "チャ") ("cye" nil "チェ")
    ("cyi" nil "チィ") ("cyo" nil "チョ") ("cyu" nil "チュ")
    ("dd" "d" "ッ") ("da" nil "ダ") ("de" nil "デ") ("dha" nil "デャ")
    ("dhe" nil "デェ") ("dhi" nil "ディ") ("dho" nil "デョ") ("dhu" nil "デュ")
    ("di" nil "ヂ") ("do" nil "ド") ("du" nil "ヅ") ("dya" nil "ヂャ")
    ("dye" nil "ヂェ") ("dyi" nil "ヂィ") ("dyo" nil "ヂョ") ("dyu" nil "ヂュ")
    ("e" nil "エ")
    ("ff" "f" "ッ") ("fa" nil "ファ") ("fe" nil "フェ") ("fi" nil "フィ")
    ("fo" nil "フォ") ("fu" nil "フ") ("fya" nil "フャ") ("fye" nil "フェ")
    ("fyi" nil "フィ") ("fyo" nil "フョ") ("fyu" nil "フュ") ("gg" "g" "ッ")
    ("ga" nil "ガ") ("ge" nil "ゲ") ("gi" nil "ギ") ("go" nil "ゴ")
    ("gu" nil "グ") ("gya" nil "ギャ") ("gye" nil "ギェ") ("gyi" nil "ギィ")
    ("gyo" nil "ギョ") ("gyu" nil "ギュ")
    ("ha" nil "ハ") ("he" nil "ヘ") ("hi" nil "ヒ") ("ho" nil "ホ")
    ("hu" nil "フ") ("hya" nil "ヒャ") ("hye" nil "ヒェ") ("hyi" nil "ヒィ")
    ("hyo" nil "ヒョ") ("hyu" nil "ヒュ") ("i" nil "イ")
    ("jj" "j" "ッ") ("ja" nil "ジャ") ("je" nil "ジェ") ("ji" nil "ジ")
    ("jo" nil "ジョ") ("ju" nil "ジュ") ("jya" nil "ジャ") ("jye" nil "ジェ")
    ("jyi" nil "ジィ") ("jyo" nil "ジョ") ("jyu" nil "ジュ")
    ("kk" "k" "ッ") ("ka" nil "カ") ("ke" nil "ケ") ("ki" nil "キ")
    ("ko" nil "コ") ("ku" nil "ク") ("kya" nil "キャ") ("kye" nil "キェ")
    ("kyi" nil "キィ") ("kyo" nil "キョ") ("kyu" nil "キュ")
    ("mm" "c" "ッ") ("ma" nil "マ") ("me" nil "メ") ("mi" nil "ミ")
    ("mo" nil "モ") ("mu" nil "ム") ("mya" nil "ミャ") ("mye" nil "ミェ")
    ("myi" nil "ミィ") ("myo" nil "ミョ") ("myu" nil "ミュ")
    ("n" nil "ン") ("n'" nil "ン") ("na" nil "ナ") ("ne" nil "ネ")
    ("ni" nil "ニ") ("nn" nil "ン") ("no" nil "ノ") ("nu" nil "ヌ")
    ("nya" nil "ニャ") ("nye" nil "ニェ") ("nyi" nil "ニィ") ("nyo" nil "ニョ")
    ("nyu" nil "ニュ")
    ("o" nil "オ")
    ("pp" "p" "ッ") ("pa" nil "パ") ("pe" nil "ペ") ("pi" nil "ピ")
    ("po" nil "ポ") ("pu" nil "プ") ("pya" nil "ピャ") ("pye" nil "ピェ")
    ("pyi" nil "ピィ") ("pyo" nil "ピョ") ("pyu" nil "ピュ")
    ("rr" "r" "ッ") ("ra" nil "ラ") ("re" nil "レ") ("ri" nil "リ")
    ("ro" nil "ロ") ("ru" nil "ル") ("rya" nil "リャ") ("rye" nil "リェ")
    ("ryi" nil "リィ") ("ryo" nil "リョ") ("ryu" nil "リュ")
    ("ss" "s" "ッ") ("sa" nil "サ") ("se" nil "セ") ("sha" nil "シャ")
    ("she" nil "シェ") ("shi" nil "シ") ("sho" nil "ショ") ("shu" nil "シュ")
    ("si" nil "シ") ("so" nil "ソ") ("su" nil "ス") ("sya" nil "シャ")
    ("sye" nil "シェ") ("syi" nil "シィ") ("syo" nil "ショ") ("syu" nil "シュ")
    ("tt" "t" "ッ") ("ta" nil "タ") ("te" nil "テ") ("tha" nil "テァ")
    ("the" nil "テェ") ("thi" nil "ティ") ("tho" nil "テョ") ("thu" nil "テュ")
    ("ti" nil "チ") ("to" nil "ト") ("tsu" nil "ツ") ("tu" nil "ツ")
    ("tya" nil "チャ") ("tye" nil "チェ") ("tyi" nil "チィ") ("tyo" nil "チョ")
    ("tyu" nil "チュ")
    ("u" nil "ウ")
    ("vv" "v" "ッ") ("va" nil "ヴァ") ("ve" nil "ヴェ") ("vi" nil "ヴィ")
    ("vo" nil "ヴォ") ("vu" nil "ヴ")
    ("ww" "w" "ッ") ("wa" nil "ワ") ("we" nil "ウェ") ("wi" nil "ウィ")
    ("wo" nil "ヲ") ("wu" nil "ウ")
    ("xx" "x" "ッ") ("xa" nil "ァ") ("xe" nil "ェ") ("xi" nil "ィ")
    ("xka" nil "カ") ("xke" nil "ケ") ("xo" nil "ォ") ("xtsu" nil "ッ")
    ("xtu" nil "ッ") ("xu" nil "ゥ") ("xwa" nil "ワ") ("xwe" nil "ェ")
    ("xwi" nil "ィ") ("xya" nil "ャ") ("xyo" nil "ョ") ("xyu" nil "ュ")
    ("yy" "y" "ッ") ("ya" nil "ヤ") ("ye" nil "イェ") ("yo" nil "ヨ")
    ("yu" nil "ユ")
    ("zz" "z" "ッ") ("z," nil "‥") ("z-" nil "〜") ("z." nil "…")
    ("z/" nil "・") ("z[" nil "『") ("z]" nil "』") ("za" nil "ザ")
    ("ze" nil "ゼ") ("zh" nil "←") ("zi" nil "ジ") ("zj" nil "↓")
    ("zk" nil "↑") ("zl" nil "→") ("zo" nil "ゾ") ("zu" nil "ズ")
    ("zya" nil "ジャ") ("zye" nil "ジェ") ("zyi" nil "ジィ") ("zyo" nil "ジョ")
    ("zyu" nil "ジュ")
    ("," nil "、") ("." nil "。") ("-" nil "ー") (":" nil ":") (";" nil ";")
    ("?" nil "?") ("[" nil "「") ("]" nil "」")
    ("l" nil skk-latin-mode)
    ("q" nil skk-toggle-katakana)
    ("L" nil skk-jisx0208-latin-mode)
    ("Q" nil skk-set-henkan-point-subr)
    ("X" nil skk-purge-from-jisyo)
    ("/" nil skk-abbrev-mode)
    ("$" nil skk-display-code-for-char-at-point)
    ("@" nil skk-today)
    ("\\" nil skk-input-by-code-or-menu)
    (skk-kakutei-key nil skk-kakutei))
  "*SKK JISX0201 モードのベースのルール。")

(defvar skk-jisx0201-roman-rule-list
  '(("!" nil "!") ("\"" nil "\"") ("#" nil "#") ("$" nil "$") ("%" nil "%")
    ("&" nil "&") ("'" nil "'") ("\(" nil "(") ("\)" nil ")") ("*" nil "*")
    ("+" nil "+") ("," nil ",") ("-" nil "-") ("." nil ".") ("/" nil "/")
    ("0" nil "0") ("1" nil "1") ("2" nil "2") ("3" nil "3") ("4" nil "4")
    ("5" nil "5") ("6" nil "6") ("7" nil "7") ("8" nil "8") ("9" nil "9")
    (":" nil ":") (";" nil ";") ("<" nil "<") ("=" nil "=") (">" nil ">")
    ("?" nil "?") ("@" nil "@")
    ("A" nil "A") ("B" nil "B") ("C" nil "C") ("D" nil "D") ("E" nil "E")
    ("F" nil "F") ("G" nil "G") ("H" nil "H") ("I" nil "I") ("J" nil "J")
    ("K" nil "K") ("L" nil "L") ("M" nil "M") ("N" nil "N") ("O" nil "O")
    ("P" nil "P") ("Q" nil "Q") ("R" nil "R") ("S" nil "S") ("T" nil "T")
    ("U" nil "U") ("V" nil "V") ("W" nil "W") ("X" nil "X") ("Y" nil "Y")
    ("Z" nil "Z")
    ("[" nil "[") ("\\" nil "\\") ("]" nil "]") ("^" nil "^") ("_" nil "_")
    ("`" nil "`")
    ("a" nil "a") ("b" nil "b") ("c" nil "c") ("d" nil "d") ("e" nil "e")
    ("f" nil "f") ("g" nil "g") ("h" nil "h") ("i" nil "i") ("j" nil "j")
    ("k" nil "k") ("l" nil "l") ("m" nil "m") ("n" nil "n") ("o" nil "o")
    ("p" nil "p") ("q" nil "q") ("r" nil "r") ("s" nil "s") ("t" nil "t")
    ("u" nil "u") ("v" nil "v") ("w" nil "w") ("x" nil "x") ("y" nil "y")
    ("z" nil "z")
    ("{" nil "{") ("|" nil "|") ("}" nil "}") ("~" nil "~"))
  "*SKK JISX0201 モードの Roman のルール。")

(defvar skk-jisx0201-rule-list
  '(("\(" nil "(")
    ("{" nil "{"))
  "*SKK JISX0201 モードの追加のルール。")

(setq skk-jisx0201-base-rule-tree
      (skk-compile-rule-list skk-jisx0201-base-rule-list
			     skk-jisx0201-rule-list))
(setq skk-jisx0201-roman-rule-tree
      (skk-compile-rule-list skk-jisx0201-roman-rule-list))

;; Hooks.

;; inline functions.
(defsubst skk-jisx0201-mode-on (&optional arg)
  "SKK JIS X 0201 (カナ) モードを起動する。"
  (make-local-variable 'skk-rule-tree)
  (setq skk-mode t
	skk-jisx0201-mode t
	skk-jisx0201-roman arg
	skk-rule-tree (if arg
			  skk-jisx0201-roman-rule-tree
			skk-jisx0201-base-rule-tree)
	skk-abbrev-mode nil
	skk-latin-mode nil
	skk-j-mode nil
	skk-jisx0208-latin-mode nil
	skk-katakana nil)
  (skk-update-modeline 'jisx0201)
  (skk-cursor-set))

;; Pieces of advice.
(defadvice skk-mode (before skk-jisx0201-ad activate)
  (setq skk-jisx0201-mode nil)
  (kill-local-variable 'skk-rule-tree))

(defadvice skk-kakutei (around skk-jisx0201-ad activate)
  (let ((jisx0201 skk-jisx0201-mode))
    ad-do-it
    (when jisx0201
      (skk-jisx0201-mode-on skk-jisx0201-roman))))

(defadvice skk-latin-mode (before skk-jisx0201-ad activate)
  (setq skk-jisx0201-mode nil)
  (kill-local-variable 'skk-rule-tree))

(defadvice skk-jisx0208-latin-mode (before skk-jisx0201-ad activate)
  (setq skk-jisx0201-mode nil)
  (kill-local-variable 'skk-rule-tree))

(defadvice skk-abbrev-mode (before skk-jisx0201-ad activate)
  (setq skk-jisx0201-mode nil)
  (kill-local-variable 'skk-rule-tree))

(defadvice skk-set-okurigana (around skk-jisx0201-ad activate)
  "半角カナの送り仮名を正しく取得する。"
  (cond
   (skk-jisx0201-mode
    (skk-save-point
     (goto-char skk-okurigana-start-point)
     (when (eq ?* (following-char))
       (delete-char 1))
     (skk-jisx0201-zenkaku-region skk-henkan-start-point
				  skk-okurigana-start-point))
    ;;
    (let ((pt1 (point))
	  pt2 okuri sokuon)
      (setq okuri
	    (skk-save-point
	     (backward-char 1)
	     (buffer-substring-no-properties
	      (setq pt2 (point)) pt1)))
      (cond
       ((member okuri '("゛" "゜"))
	(setq okuri
	      (concat (skk-save-point
		       (backward-char 2)
		       (buffer-substring-no-properties
			(point)	pt2))
		       okuri))
	(setq sokuon t))
       (okuri
	(setq sokuon
	      (skk-save-point
	       (backward-char 2)
	       (buffer-substring-no-properties
		(point) pt2)))
	(unless (member sokuon '("ッ"))
	  (setq sokuon nil))))
      ;;
      (when okuri
	(skk-save-point
	 (backward-char (if sokuon 2 1))
	 (skk-set-marker skk-okurigana-start-point (point)))
	(setq skk-okuri-char (skk-okurigana-prefix
			      (skk-katakana-to-hiragana
			       (skk-jisx0201-zenkaku okuri))))
	;;
	(let ((skk-katakana t))
	  ad-do-it))))
   (t
    ad-do-it)))

(defadvice skk-insert (around skk-jisx0201-ad activate)
  "SKK JIS X 0201 モードの文字入力を行う。"
  (cond
   (skk-jisx0201-mode
    (let ((arg (ad-get-arg 0))
	  (ch (skk-last-command-char)))
      (cond
       ((or (and (not skk-jisx0201-roman)
		 (memq ch skk-set-henkan-point-key)
		 (or skk-okurigana
		     (not (skk-get-prefix skk-current-rule-tree))
		     (not (skk-select-branch
			   skk-current-rule-tree ch))))
	    (and skk-henkan-mode
		 (memq ch skk-special-midashi-char-list)))
	ad-do-it)
       ;;
       ((and skk-henkan-mode
	     (eq ch skk-start-henkan-char))
	(skk-kana-cleanup 'force)
	(unless (or skk-okurigana
		    skk-okuri-char)
	  (let ((jisx0201 (buffer-substring-no-properties
			   skk-henkan-start-point
			   (point)))
		jisx0208)
	    (when (and jisx0201
		       (setq jisx0208
			     (skk-jisx0201-zenkaku jisx0201)))
	      (insert-before-markers jisx0208)
	      (delete-region skk-henkan-start-point
			     (- (point) (length jisx0208))))))
	(let ((skk-katakana t))
	  (skk-start-henkan arg))
	(skk-cursor-set))
       ;;
       (skk-jisx0201-roman
	(let (skk-set-henkan-point-key)
	  ad-do-it))
       ;;
       (t
	ad-do-it))))
   ;;
   (t
    ad-do-it)))

(defadvice skk-search-sagyo-henkaku (before skk-jisx0201-set-okuri activate)
  "SKK JIS X 0201 モードでは送り仮名を半角カナにする。"
  (when skk-jisx0201-mode
    (ad-set-arg 0 '("サ" "シ" "ス" "セ"))))

;; functions.
;;;###autoload
(defun skk-jisx0201-mode (arg)
  "SKK のモードを JIS X 0201 モードに変更する。"
  (interactive "P")
  (skk-kakutei)
  (skk-jisx0201-mode-on))

(defun skk-toggle-jisx0201 (arg)
  "半角カナモードとローマ字モードを切り替える。"
  (interactive "P")
  (cond
   ((eq skk-henkan-mode 'on)
    (skk-jisx0201-henkan arg))
   (skk-jisx0201-roman
    (setq skk-rule-tree skk-jisx0201-base-rule-tree
	  skk-jisx0201-roman nil))
   (t
    (setq skk-rule-tree skk-jisx0201-roman-rule-tree
	  skk-jisx0201-roman t))))

(defun skk-jisx0201-string-conversion (str func)
  (with-temp-buffer
    (insert str)
    (funcall func 1 (point))
    (buffer-string)))

(defun skk-jisx0201-zenkaku (str)
  "STR の JIS X 0201 カナ文字を対応する JIS X 0208 の文字で置き換える。"
  (skk-jisx0201-string-conversion str #'skk-jisx0201-zenkaku-region))

(defun skk-jisx0201-hankaku (str)
  "STR の JIS X 0208 文字を対応する JIS X 0201 カナの文字で置き換える。"
  (skk-jisx0201-string-conversion str #'japanese-hankaku-region))

;;;###autoload
(defun skk-toggle-katakana (arg)
  (interactive "P")
  (cond
   ((eq skk-henkan-mode 'on)
    (skk-jisx0201-henkan arg))
   (skk-jisx0201-mode
    (when (eq skk-henkan-mode 'active)
      (skk-kakutei))
    (setq skk-jisx0201-mode nil)
    (skk-j-mode-on)
    (kill-local-variable 'skk-rule-tree))
   (t
    (when (eq skk-henkan-mode 'active)
      (skk-kakutei))
    (skk-jisx0201-mode-on))))

(defun skk-jisx0201-zenkaku-region (start end)
  (japanese-zenkaku-region start end 'katakana-only))

(defun skk-jisx0201-henkan (arg)
  "▽モードであれば、領域のひらがな/カタカナを ハンカクカタカナ に変換する。
▼モードでは何もしない。
その他のモードでは、オリジナルのキー割り付けでバインドされているコマンドを実行
する。"
  (interactive "*P")
  (skk-henkan-skk-region-by-func #'skk-jisx0201-region arg))

(defun skk-jisx0201-region (start end)
  "領域のひらがな/カタカナを ハンカクカタカナ に変換する。
引数の START と END は数字でもマーカーでも良い。"
  (interactive "*r\nP")
  (setq end (set-marker (make-marker) end))
  (skk-hiragana-to-jisx0201-region start end)
  (skk-katakana-to-jisx0201-region start end)
  (set-marker end nil))

;;;###autoload
(defun skk-hiragana-to-jisx0201-region (start end)
  (skk-search-and-replace
   start end
   "[ぁ-ん。、・ー゛゜]+"
   (lambda (matched)
     (save-match-data
       (skk-jisx0201-hankaku matched)))))

;;;###autoload
(defun skk-katakana-to-jisx0201-region (start end)
  (skk-search-and-replace
   start end
   "[ァ-ヴ。、・ー゛゜]+"
   (lambda (matched)
     (save-match-data
       (skk-jisx0201-hankaku matched)))))

(provide 'skk-jisx0201)

;;; skk-jisx0201.el ends here
