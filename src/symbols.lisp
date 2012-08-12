(loom.internals:defpackage symbols
  (:use #:cl.data-and-control-flow #:loom.internals)
  (:export #:symbol
           #:keyword
           #:symbolp
           #:keywordp
           #:make-symbol
           #:copy-symbol
           #:gensym
           #:*gensym-counter*
           #:gentemp
           #:symbol-function
           #:symbol-name
           #:symbol-package
           #:symbol-plist
           #:symbol-value
           #:get
           #:remprop
           #:boundp
           #:makunbound
           #:set
           #:unbound-variable)
  (:import-from #:cl
                #:symbol
                #:keyword
                #:*gensym-counter*
                #:unbound-variable))

(cl:in-package #:loom.symbols)

(make-generic symbolp (object))

(make-generic keywordp (object))

(make-generic make-symbol (name))

(make-generic copy-symbol (symbol &optional copy-properties))

(make-generic gensym (&optional x))

(make-generic gentemp (&optional prefix package))

(make-generic symbol-function (symbol))
;; FIXME: MAKE-GENERIC should work with SETF functions
;; (make-generic (setf symbol-function) (new-contents symbol))

(make-generic symbol-name (symbol))

(make-generic symbol-package (symbol))

(make-generic symbol-plist (symbol))
;; FIXME: MAKE-GENERIC should work with SETF functions
;; (make-generic (setf symbol-plist) (new-plist symbol))

(make-generic symbol-value (symbol))
;; FIXME: MAKE-GENERIC should work with SETF functions
;; (make-generic (setf symbol-value) (new-value symbol))

(make-generic get (symbol indicator &optional default))
;; FIXME: MAKE-GENERIC should work with SETF functions
;; (make-generic (setf get) (new-value symbol indicator &optional default))

(make-generic remprop (symbol indicator))

(make-generic boundp (symbol))

(make-generic makunbound (symbol))

(make-generic set (symbol value))
