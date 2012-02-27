(loom.internals:defpackage data-and-control-flow
  (:use #:loom.internals)
  (:export #:apply
           #:defun #:fdefinition #:fboundp #:fmakunbound
           #:flet #:labels #:macrolet
           #:funcall
           #:function
           #:function-lambda-expression
           #:functionp #:compiled-function-p
           #:call-arguments-list
           #:lambda-list-keywords
           #:lambda-parameters-limit
           #:defconstant
           #:defparameter #:defvar
           #:destructuring-bind
           #:let #:let*
           #:progv
           #:setq
           #:psetq
           #:block
           #:catch
           #:go
           #:return-from
           #:return
           #:tagbody
           #:throw
           #:unwind-protect
           #:nil
           #:not
           #:t
           #:eq #:eql #:equal #:equalp
           #:identity
           #:complement
           #:constantly
           #:every #:some #:notevery #:notany
           #:and
           #:cond
           #:if
           #:or
           #:when #:unless
           #:case #:ccase #:ecase #:otherwise
           #:typecase #:ctypecase #:etypecase
           #:multiple-value-bind
           #:multiple-value-call
           #:multiple-value-list
           #:multiple-value-prog1
           #:multiple-value-setq
           #:values
           #:values-list
           #:multiple-values-limit
           #:nth-value
           #:prog #:prog*
           #:prog1 #:prog2
           #:progn
           #:define-macro-modify
           #:defsetf
           #:define-setf-expander
           #:get-setf-expansion
           #:setf #:psetf
           #:shiftf
           #:rotatef
           #:control-error
           #:program-error
           #:undefined-function

           #:&optional
           #:&rest
           #:&aux
           #:&key
           #:&allow-other-keys
           #:&body
           #:&environment
           #:&whole)
  (:import-from #:cl
                #:defun
                #:flet #:labels #:macrolet
                #:function
                #:call-arguments-limit
                #:lambda-list-keywords
                #:lambda-parameters-limit
                #:defconstant
                #:defparameter #:defvar
                #:destructuring-bind
                #:let #:let*
                #:progv
                #:setq
                #:psetq
                #:block
                #:catch
                #:go
                #:return-from
                #:return
                #:tagbody
                #:throw
                #:unwind-protect
                #:nil
                #:t
                #:and
                #:cond
                #:if
                #:or
                #:when #:unless
                #:case #:ccase #:ecase
                #:typecase #:ctypecase #:etypecase
                #:multiple-value-bind
                #:multiple-value-call
                #:multiple-value-list
                #:multiple-value-prog1
                #:multiple-value-setq
                #:values
                #:multiple-values-limit
                #:nth-value
                #:prog #:prog*
                #:prog1 #:prog2
                #:progn
                #:define-modify-macro
                #:defsetf
                #:define-setf-expander
                #:setf #:psetf
                #:shiftf
                #:rotatef
                #:control-error
                #:program-error
                #:undefined-function)
  #.(cl:list* :import-from :cl
              (cl:mapcar #'cl:symbol-name lambda-list-keywords)))

(cl:in-package #:data-and-control-flow)

(make-generic apply (function &rest args+))

(make-generic fdefinition (function-name))
;; FIXME: MAKE-GENERIC should work for SETF functions
;;(make-generic (setf fdefinition) (new-definition function-name))

(make-generic fboundp (name))

(make-generic fmakunbound (name))

(make-generic funcall (function &rest args))

(make-generic function-lambda-expression (function))

(make-generic functionp (object))

(make-generic compiled-function-p (object))

(make-generic not (x))

(make-generic eq (x y))

(make-generic eql (x y))

(make-generic equal (x y))

(make-generic equalp (x y))

(make-generic identity (object))

(make-generic complement (function))

(make-generic constantly (value))

(make-generic every (predicate &rest sequences+))
(make-generic some (predicate &rest sequences+))
(make-generic notevery (predicate &rest sequences+))
(make-generic notany (predicate &rest sequences+))

;; FIXME: MAKE-GENERIC should work for SETF functions
;;(make-generic (setf values) (new-values &rest place))

(make-generic values-list (list))

(make-generic get-setf-expansion (place &optional environment))
