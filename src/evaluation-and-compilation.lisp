(defpackage loom.evaluation-and-compilation
  (:nicknames #:evaluation-and-compilation)
  (:use #:cl)
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
           #:inline #:not-inline
           #:ftype
           #:declaration
           #:optimize
           #:special
           #:locally
           #:the
           #:special-operator-p
           #:constantp))
