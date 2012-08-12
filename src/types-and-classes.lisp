(loom.internals:defpackage types-and-classes
  (:use #:cl.data-and-control-flow #:loom.internals)
  (:export #:nil
           #:boolean
           #:function
           #:compiled-function
           #:generic-function
           #:standard-generic-function
           #:class
           #:built-in-class
           #:structure-class
           #:standard-class
           #:method
           #:standard-method
           #:structure-object
           #:standard-object
           #:method-combination
           #:t
           #:satisfies
           ;#:member
           ;#:not
           #:and
           #:or
           #:values
           ;#:eql
           #:coerce
           #:deftype
           #:subtypep
           #:type-of
           #:typep
           #:type-error
           #:type-error-datum #:type-error-expected-type
           #:simple-type-error)
  (:import-from #:cl
                #:nil
                #:boolean
                #:function
                #:compiled-function
                #:generic-function
                #:standard-generic-function
                #:class
                #:built-in-class
                #:structure-class
                #:standard-class
                #:method
                #:standard-method
                #:structure-object
                #:standard-object
                #:method-combination
                #:t
                #:satisfies
                #:member
                #:and
                #:or
                #:values
                #:deftype
                #:type-error
                #:simple-type-error)
  (:shadowing-import-from #:cl
                          #:not
                          #:eql))

(in-package #:loom.types-and-classes)

(make-generic coerce (object result-type))

(make-generic subtypep (type-1 type-2 &optional environment))

(make-generic type-of (object))

(make-generic typep (object type-specifier &optional environment))

(make-generic type-error-datum (condition))
(make-generic type-error-expected-type (condition))
