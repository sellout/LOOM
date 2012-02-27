(loom.internals:defpackage evaluation-and-compilation
  (:use #:data-and-control-flow #:loom.internals)
  (:export #:lambda
           #:compile
           #:eval
           #:eval-when
           #:load-time-value
           #:quote
           #:compiler-macro-function
           #:define-compiler-macro
           #:defmacro
           #:macro-function
           #:macroexpand #:macroexpand-1
           #:define-symbol-macro
           #:symbol-macrolet
           #:*macroexpand-hook*
           #:proclaim
           #:declaim
           #:declare
           #:ignore #:ignorable
           #:dynamic-extent
           #:type
           #:inline #:notinline
           #:ftype
           #:declaration
           #:optimize
           #:special
           #:locally
           #:the
           #:special-operator-p
           #:constantp)
  (:import-from #:cl
                #:lambda
                #:eval-when
                #:load-time-value
                #:quote
                #:define-compiler-macro
                #:defmacro
                #:define-symbol-macro
                #:symbol-macrolet
                #:*macroexpand-hook*
                #:declaim
                #:declare
                #:ignore #:ignorable
                #:dynamic-extent
                #:type
                #:inline #:notinline
                #:ftype
                #:declaration
                #:optimize
                #:special
                #:locally
                #:the))

(cl:in-package #:evaluation-and-compilation)

(make-generic compile (name &optional definition))

(make-generic eval (form))

(make-generic compiler-macro-function (name &optional environment))
;; FIXME: MAKE-GENERIC should be able to handle SETF functions
;; (make-generic (setf compiler-macro-function)
;;               (new-function name &optional environment))

(make-generic macro-function (symbol &optional environment))
;; FIXME: MAKE-GENERIC should be able to handle SETF functions
;; (make-generic (setf macro-function) (new-function symbol &optional environment))

(make-generic macroexpand (form &optional env))
(make-generic macroexpand-1 (form &optional env))

(make-generic proclaim (declaration-specifier))

(make-generic special-operator-p (symbol))

(make-generic constantp (form &optional environment))
