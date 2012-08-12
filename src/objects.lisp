(loom.internals:defpackage objects
  (:use #:cl.data-and-control-flow #:loom.internals)
  (:export #:function-keywords
           #:ensure-generic-function
           #:allocate-instance
           #:reinitialize-instance
           #:shared-initialize
           #:update-instance-for-different-class
           #:update-instance-for-redefined-class
           #:change-class
           #:slot-boundp
           #:slot-exists-p
           #:slot-makunbound
           #:slot-missing
           #:slot-unbound
           #:slot-value
           #:method-qualifiers
           #:no-applicable-method
           #:no-next-method
           #:remove-method
           #:make-instance
           #:make-instance-obsolete
           #:make-load-form
           #:make-load-form-saving-slots
           #:with-accessors
           #:with-slots
           #:defclass
           #:defgeneric
           #:defmethod
           #:find-class
           #:next-method-p
           #:call-method #:make-method
           #:call-next-method
           #:compute-applicable-methods
           #:define-method-combination
           #:find-method
           #:add-method
           #:initialize-instance
           #:class-name
           #:class-of
           #:unbound-slot
           #:unbound-slot-instance)
  (:import-from #:cl
                #:function-keywords
                #:allocate-instance
                #:reinitialize-instance
                #:shared-initialize
                #:update-instance-for-different-class
                #:update-instance-for-redefined-class
                #:change-class
                #:slot-missing
                #:slot-unbound
                #:method-qualifiers
                #:no-applicable-method
                #:no-next-method
                #:remove-method
                #:make-instance
                #:make-instances-obsolete
                #:make-load-form
                #:with-accessors
                #:with-slots
                #:defclass
                #:defgeneric
                #:defmethod
                #:find-class ; TODO: make sure this is generic
                #:next-method-p
                #:call-method #:make-method
                #:call-next-method
                #:compute-applicable-methods
                #:define-method-combination
                #:find-method
                #:add-method
                #:initialize-instance
                #:class-name
                #:unbound-slot))

(cl:in-package #:loom.objects)

(make-generic ensure-generic-function
              (function-name
               &key argument-precedence-order declare documentation environment
               generic-function-class lambda-list method-class
               method-combination))

(make-generic slot-boundp (instance slot-name))

(make-generic slot-exists-p (object slot-name))

(make-generic slot-makunbound (instance slot-name))

(make-generic slot-value (object slot-name))

(make-generic make-load-form-saving-slots (object &key slot-names environment))

(make-generic class-of (object))

(make-generic unbound-slot-instance (condition))
