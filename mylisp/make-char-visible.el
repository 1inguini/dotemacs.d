;; package --- Summary

;; Copyright (C) 2019 by 1inguini

;;; Commentary:
;;; Code:

(require #'pcre2el)
(require #'ov)
(require #'m-buffer)
(require #'s)

;; * customs

(defgroup make-char-visible nil
  "Show"
  :group 'environment)

(defcustom invisibles-to-show (pcre-to-elisp "^ +| +$|\t +| +\t")
  ""
  :type 'string
  :group 'make-char-visible)


(defcustom char-to-visualize " "
  ""
  :type 'string
  :group 'make-char-visible)


(defcustom invisible-indicator "·"
  ""
  :type 'string
  :group 'make-char-visible)

(defun show-invisibles-reset ()
  "clear"
  (interactive)
  (dolist (i show-invisibles-ov)
    (ov-reset i))
  )

(defun show-invisibles-write ()
  "show"
  (interactive)
  ;(show-invisibles-reset)
  "whitespace with char instead of highlight"
  (dolist (i (m-buffer-match (current-buffer)
			     ;; the regexp string
			     invisibles-to-show
			     :numeric t))
    (let ($substrings
	  (buffer-substring-no-properties (nth 0 i) (nth 1 i))))
    
    ;; remove chars other than the invisible char to show before the invisibles from region 
    (while (s-match (pcre-to-elisp (concat "^(?!." char-to-visualize ")")) $substrings)
      (setcar i (+ 1 (nth 0 i))))
    
    ;; remove chars other than the invisible char to show after the invisibles from region 
    (while (s-match (pcre-to-elisp (concat "(?!." char-to-visualize ")$")) $substrings)
     	(setcar (cdr i) (- (nth 1 i) 1)))

    
    (add-to-list 'show-invisibles-ov
		 (ov (nth 0 i) (nth 1 i)
		     'display
		     (apply #'concat
			    (make-list (- (nth 1 i) (nth 0 i))
				       invisible-indicator))))))

;; * provide

(provide 'make-char-visible)

;;; make-char-visible.el ends here
