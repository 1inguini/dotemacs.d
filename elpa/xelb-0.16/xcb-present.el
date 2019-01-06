;;; xcb-present.el --- X11 Present extension  -*- lexical-binding: t -*-

;; Copyright (C) 2015-2018 Free Software Foundation, Inc.

;; This file is part of GNU Emacs.

;; GNU Emacs is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; GNU Emacs is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; This file was generated by 'el_client.el' from 'present.xml',
;; which you can retrieve from <git://anongit.freedesktop.org/xcb/proto>.

;;; Code:

(require 'xcb-types)

(defconst xcb:present:-extension-xname "Present")
(defconst xcb:present:-extension-name "Present")
(defconst xcb:present:-major-version 1)
(defconst xcb:present:-minor-version 2)

(require 'xcb-xproto)

(require 'xcb-randr)

(require 'xcb-xfixes)

(require 'xcb-sync)

(defconst xcb:present:Event:ConfigureNotify 0)
(defconst xcb:present:Event:CompleteNotify 1)
(defconst xcb:present:Event:IdleNotify 2)
(defconst xcb:present:Event:RedirectNotify 3)

(defconst xcb:present:EventMask:NoEvent 0)
(defconst xcb:present:EventMask:ConfigureNotify 1)
(defconst xcb:present:EventMask:CompleteNotify 2)
(defconst xcb:present:EventMask:IdleNotify 4)
(defconst xcb:present:EventMask:RedirectNotify 8)

(defconst xcb:present:Option:None 0)
(defconst xcb:present:Option:Async 1)
(defconst xcb:present:Option:Copy 2)
(defconst xcb:present:Option:UST 4)
(defconst xcb:present:Option:Suboptimal 8)

(defconst xcb:present:Capability:None 0)
(defconst xcb:present:Capability:Async 1)
(defconst xcb:present:Capability:Fence 2)
(defconst xcb:present:Capability:UST 4)

(defconst xcb:present:CompleteKind:Pixmap 0)
(defconst xcb:present:CompleteKind:NotifyMSC 1)

(defconst xcb:present:CompleteMode:Copy 0)
(defconst xcb:present:CompleteMode:Flip 1)
(defconst xcb:present:CompleteMode:Skip 2)
(defconst xcb:present:CompleteMode:SuboptimalCopy 3)

(defclass xcb:present:Notify
  (xcb:-struct)
  ((window :initarg :window :type xcb:WINDOW)
   (serial :initarg :serial :type xcb:CARD32)))

(defclass xcb:present:QueryVersion
  (xcb:-request)
  ((~opcode :initform 0 :type xcb:-u1)
   (major-version :initarg :major-version :type xcb:CARD32)
   (minor-version :initarg :minor-version :type xcb:CARD32)))
(defclass xcb:present:QueryVersion~reply
  (xcb:-reply)
  ((pad~0 :initform 1 :type xcb:-pad)
   (~sequence :type xcb:CARD16)
   (length :type xcb:CARD32)
   (major-version :initarg :major-version :type xcb:CARD32)
   (minor-version :initarg :minor-version :type xcb:CARD32)))

(defclass xcb:present:Pixmap
  (xcb:-request)
  ((~opcode :initform 1 :type xcb:-u1)
   (pad~0 :initform 8 :type xcb:-pad-align)
   (window :initarg :window :type xcb:WINDOW)
   (pixmap :initarg :pixmap :type xcb:PIXMAP)
   (serial :initarg :serial :type xcb:CARD32)
   (valid :initarg :valid :type xcb:xfixes:REGION)
   (update :initarg :update :type xcb:xfixes:REGION)
   (x-off :initarg :x-off :type xcb:INT16)
   (y-off :initarg :y-off :type xcb:INT16)
   (target-crtc :initarg :target-crtc :type xcb:randr:CRTC)
   (wait-fence :initarg :wait-fence :type xcb:sync:FENCE)
   (idle-fence :initarg :idle-fence :type xcb:sync:FENCE)
   (options :initarg :options :type xcb:CARD32)
   (pad~1 :initform 4 :type xcb:-pad)
   (target-msc :initarg :target-msc :type xcb:CARD64)
   (divisor :initarg :divisor :type xcb:CARD64)
   (remainder :initarg :remainder :type xcb:CARD64)
   (notifies~ :initform
	      '(name notifies type xcb:present:Notify size nil)
	      :type xcb:-list)
   (notifies :initarg :notifies :type xcb:-ignore)))

(defclass xcb:present:NotifyMSC
  (xcb:-request)
  ((~opcode :initform 2 :type xcb:-u1)
   (pad~0 :initform 8 :type xcb:-pad-align)
   (window :initarg :window :type xcb:WINDOW)
   (serial :initarg :serial :type xcb:CARD32)
   (pad~1 :initform 4 :type xcb:-pad)
   (target-msc :initarg :target-msc :type xcb:CARD64)
   (divisor :initarg :divisor :type xcb:CARD64)
   (remainder :initarg :remainder :type xcb:CARD64)))

(xcb:deftypealias 'xcb:present:EVENT 'xcb:-u4)

(defclass xcb:present:SelectInput
  (xcb:-request)
  ((~opcode :initform 3 :type xcb:-u1)
   (eid :initarg :eid :type xcb:present:EVENT)
   (window :initarg :window :type xcb:WINDOW)
   (event-mask :initarg :event-mask :type xcb:CARD32)))

(defclass xcb:present:QueryCapabilities
  (xcb:-request)
  ((~opcode :initform 4 :type xcb:-u1)
   (target :initarg :target :type xcb:CARD32)))
(defclass xcb:present:QueryCapabilities~reply
  (xcb:-reply)
  ((pad~0 :initform 1 :type xcb:-pad)
   (~sequence :type xcb:CARD16)
   (length :type xcb:CARD32)
   (capabilities :initarg :capabilities :type xcb:CARD32)))

(defclass xcb:present:Generic
  (xcb:-event)
  ((~code :initform 0)
   (extension :initarg :extension :type xcb:CARD8)
   (~sequence :type xcb:CARD16)
   (length :initarg :length :type xcb:CARD32)
   (evtype :initarg :evtype :type xcb:CARD16)
   (pad~0 :initform 2 :type xcb:-pad)
   (event :initarg :event :type xcb:present:EVENT)))

(defclass xcb:present:ConfigureNotify
  (xcb:-generic-event)
  ((~evtype :initform 0)
   (pad~0 :initform 2 :type xcb:-pad)
   (event :initarg :event :type xcb:present:EVENT)
   (window :initarg :window :type xcb:WINDOW)
   (x :initarg :x :type xcb:INT16)
   (y :initarg :y :type xcb:INT16)
   (width :initarg :width :type xcb:CARD16)
   (height :initarg :height :type xcb:CARD16)
   (off-x :initarg :off-x :type xcb:INT16)
   (off-y :initarg :off-y :type xcb:INT16)
   (pixmap-width :initarg :pixmap-width :type xcb:CARD16)
   (pixmap-height :initarg :pixmap-height :type xcb:CARD16)
   (pixmap-flags :initarg :pixmap-flags :type xcb:CARD32)))

(defclass xcb:present:CompleteNotify
  (xcb:-generic-event)
  ((~evtype :initform 1)
   (pad~0 :initform 8 :type xcb:-pad-align)
   (kind :initarg :kind :type xcb:CARD8)
   (mode :initarg :mode :type xcb:CARD8)
   (event :initarg :event :type xcb:present:EVENT)
   (window :initarg :window :type xcb:WINDOW)
   (serial :initarg :serial :type xcb:CARD32)
   (ust :initarg :ust :type xcb:CARD64)
   (msc :initarg :msc :type xcb:CARD64)))

(defclass xcb:present:IdleNotify
  (xcb:-generic-event)
  ((~evtype :initform 2)
   (pad~0 :initform 2 :type xcb:-pad)
   (event :initarg :event :type xcb:present:EVENT)
   (window :initarg :window :type xcb:WINDOW)
   (serial :initarg :serial :type xcb:CARD32)
   (pixmap :initarg :pixmap :type xcb:PIXMAP)
   (idle-fence :initarg :idle-fence :type xcb:sync:FENCE)))

(defclass xcb:present:RedirectNotify
  (xcb:-generic-event)
  ((~evtype :initform 3)
   (pad~0 :initform 8 :type xcb:-pad-align)
   (update-window :initarg :update-window :type xcb:BOOL)
   (pad~1 :initform 1 :type xcb:-pad)
   (event :initarg :event :type xcb:present:EVENT)
   (event-window :initarg :event-window :type xcb:WINDOW)
   (window :initarg :window :type xcb:WINDOW)
   (pixmap :initarg :pixmap :type xcb:PIXMAP)
   (serial :initarg :serial :type xcb:CARD32)
   (valid-region :initarg :valid-region :type xcb:xfixes:REGION)
   (update-region :initarg :update-region :type xcb:xfixes:REGION)
   (valid-rect :initarg :valid-rect :type xcb:RECTANGLE)
   (update-rect :initarg :update-rect :type xcb:RECTANGLE)
   (x-off :initarg :x-off :type xcb:INT16)
   (y-off :initarg :y-off :type xcb:INT16)
   (target-crtc :initarg :target-crtc :type xcb:randr:CRTC)
   (wait-fence :initarg :wait-fence :type xcb:sync:FENCE)
   (idle-fence :initarg :idle-fence :type xcb:sync:FENCE)
   (options :initarg :options :type xcb:CARD32)
   (pad~2 :initform 4 :type xcb:-pad)
   (target-msc :initarg :target-msc :type xcb:CARD64)
   (divisor :initarg :divisor :type xcb:CARD64)
   (remainder :initarg :remainder :type xcb:CARD64)
   (notifies~ :initform
	      '(name notifies type xcb:present:Notify size nil)
	      :type xcb:-list)
   (notifies :initarg :notifies :type xcb:-ignore)))

(defconst xcb:present:event-number-class-alist
  '((0 . xcb:present:Generic))
  "(event-number . event-class) alist.")

(defconst xcb:present:xge-number-class-alist
  '((0 . xcb:present:ConfigureNotify)
    (1 . xcb:present:CompleteNotify)
    (2 . xcb:present:IdleNotify)
    (3 . xcb:present:RedirectNotify))
  "(xge-number . event-class) alist.")



(provide 'xcb-present)

;;; xcb-present.el ends here
