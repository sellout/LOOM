(defpackage loom.internals
  (:use #:cl)
  (:export #:make-generic #:define-generic-nary))

(in-package #:loom.internals)

(defmacro make-generic (fn arguments)
  "Converts an existing non-generic function with the given name and arguments
   into a generic function, with the original behavior in a non-specialized
   method."
  `(defgeneric ,fn ,arguments
     (:documentation ,(or (documentation (intern (symbol-name fn) :cl)
                                         'function)
                          ""))
     (:method ,arguments
       (,(intern (symbol-name fn) :cl) ,@arguments))))

(defmacro define-generic-nary (fn (left right &optional collective) &body body)
  "Takes an nary function and reframes it as a reduction on a binary generic
   function that can be specialized."
  `(progn
     (defgeneric ,(intern (concatenate 'string "BINARY-" (symbol-name fn)))
                 (,left ,right)
       (:documentation ,(or (documentation (intern (symbol-name fn) :cl)
                                           'function)
                            ""))
       (:method (,left ,right)
         (,(intern (symbol-name fn) :cl) ,left ,right)))
     (defun ,(intern (symbol-name fn))
            ,(if collective `(&rest ,collective) `(,left &rest ,right))
       ,(or (documentation (intern (symbol-name fn) :cl) 'function) "")
       ,@(or body
             `((reduce #',(intern (concatenate 'string
                                               "BINARY-" (symbol-name fn)))
                       ,(or collective `(cons ,left ,right))))))))
