(defpackage loom.internals
  (:use #:cl)
  (:export #:make-generic #:define-generic-nary))

(in-package #:loom.internals)

(defmacro make-generic (fn arguments)
  `(defgeneric ,fn ,arguments
     (:documentation ,(documentation (intern (symbol-name fn) :cl) 'function))
     (:method ,arguments
       (,(intern (symbol-name fn) :cl) ,@arguments))))

(defmacro define-generic-nary (fn (left right &optional collective) &body body)
  (let* ((fn-name (symbol-name fn))
         (binary-fn (intern (concatenate 'string "BINARY-" fn-name))))
    `(progn
       (defgeneric ,binary-fn (,left ,right)
         (:documentation ,(documentation (intern fn-name :cl) 'function))
         (:method (,left ,right)
           (,(intern fn-name :cl) ,left ,right)))
       (defun ,(intern fn-name)
           ,(if collective `(&rest ,collective) `(,left &rest ,right))
         ,@(or body
               `((reduce #',binary-fn
                         ,(or collective `(cons ,left ,right)))))))))