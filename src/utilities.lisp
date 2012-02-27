(cl:defpackage loom.internals
  (:use #:cl)
  (:export #:defpackage #:make-generic #:define-generic-nary)
  (:shadow #:defpackage))

(cl:in-package #:loom.internals)

(defmacro defpackage
          (name (use &rest uses) (export &rest exports) &rest options)
  (declare (ignore use export))
  `(progn
     (cl:defpackage ,(intern (concatenate 'string "CL." (symbol-name name)))
       (:use #:cl)
       (:export ,@exports))
     (cl:defpackage ,(intern (concatenate 'string "LOOM." (symbol-name name)))
       (:nicknames ,name)
       (:use ,@uses)
       (:export ,@exports)
       ,@options)
     (use-package ',(intern (concatenate 'string "LOOM." (symbol-name name)))
                  :loom)
     (export (mapcar (lambda (sym) (find-symbol (symbol-name sym) :loom))
                     (append ',exports
                             ',(cdr (find :export options :key #'car))))
             :loom)))

(defmacro make-generic (fn arguments &rest options-and-methods)
  "Converts an existing non-generic function with the given name and arguments
   into a generic function, with the original behavior in a non-specialized
   method."
  (flet ((collect-keys (lambda-list)
           (let ((key-pos (position '&key lambda-list)))
             (if key-pos
               (subseq lambda-list (1+ key-pos)
                       (position '&allow-other-keys lambda-list))
               nil)))
         (add-&rest (lambda-list)
           (let ((splice-point (position '&key lambda-list)))
             (if splice-point
               (append (subseq lambda-list 0 splice-point)
                       (list '&rest 'loom-keys) ; wanted to gensym this, but …
                       (subseq lambda-list splice-point))
               lambda-list)))
         (remove-lambda-list-keywords (lambda-list)
           (remove '&optional
                   (remove '&rest
                           (subseq lambda-list 0
                                   (position '&key lambda-list))))))
    `(defgeneric ,fn ,arguments
       (:documentation ,(or (documentation (intern (symbol-name fn) :cl)
                                           'function)
                            ""))
       ,@(cond (options-and-methods `,options-and-methods)
               ((find '&rest arguments)
                `((:method ,arguments
                    (declare (ignore ,@(collect-keys arguments)))
                    (apply #',(intern (symbol-name fn) :cl)
                           ,@(remove-lambda-list-keywords arguments)))))
               ((find '&key arguments)
                (let ((new-args (add-&rest arguments)))
                  `((:method ,new-args
                      (declare (ignore ,@(collect-keys new-args)))
                      (apply #',(intern (symbol-name fn) :cl)
                             ,@(remove-lambda-list-keywords new-args))))))
               (t
                `((:method ,arguments
                    (,(intern (symbol-name fn) :cl)
                      ,@(remove-lambda-list-keywords arguments)))))))))

(defmacro define-generic-nary (fn (left right &optional collective) &body body)
  "Takes an nary function and reframes it as a reduction on a binary generic
   function that can be specialized."
  (let ((documentation (or (documentation (intern (symbol-name fn) :cl)
                                          'function) ""))
        (lambda-list (if collective
                         `(&rest ,collective)
                         `(,left &rest ,right))))
    `(progn
       (defgeneric ,(intern (concatenate 'string "BINARY-" (symbol-name fn)))
           (,left ,right)
         (:documentation ,documentation)
         (:method (,left ,right)
           (,(intern (symbol-name fn) :cl) ,left ,right)))
       (defgeneric ,(intern (symbol-name fn)) ,lambda-list
         (:documentation ,documentation)
         (:method ,lambda-list
           ,@(or body
                 `((reduce #',(intern (concatenate 'string
                                                   "BINARY-" (symbol-name fn)))
                           ,(or collective `(cons ,left ,right))))))))))
