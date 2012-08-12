(loom.internals:defpackage conditions
  (:use #:cl.data-and-control-flow #:loom.internals)
  (:export #:condition
           #:warning
           #:style-warning
           #:serious-condition
           #:error
           #:cell-error
           #:cell-error-name
           #:parse-error
           #:storage-condition
           #:assert
           #:cerror
           #:check-type
           #:simple-error
           #:invalid-method-error
           #:method-combination-error
           #:signal
           #:simple-condition
           #:simple-condition-format-control #:simple-condition-format-arguments
           #:warn
           #:simple-warning
           #:invoke-debugger
           #:break
           #:*debugger-hook*
           #:*break-on-signals*
           #:handler-bind
           #:handler-case
           #:ignore-errors
           #:define-condition
           #:make-condition
           #:restart
           #:compute-restarts
           #:find-restart
           #:invoke-restart
           #:invoke-restart-interactively
           #:restart-bind
           #:restart-case
           #:restart-name
           #:with-condition-restarts
           #:with-simple-restart
           #:abort
           #:continue
           #:muffle-warning
           #:store-value
           #:use-value)
  (:import-from #:cl
                #:condition
                #:warning
                #:style-warning
                #:serious-condition
                #:error
                #:cell-error
                #:parse-error
                #:storage-condition
                #:assert
                #:check-type
                #:simple-error
                #:simple-condition
                #:simple-warning
                #:break
                #:*debugger-hook*
                #:*break-on-signals*
                #:handler-bind
                #:handler-case
                #:ignore-errors
                #:define-condition
                #:restart
                #:compute-restarts
                #:restart-bind
                #:restart-case
                #:with-condition-restarts
                #:with-simple-restart
                #:abort
                #:continue
                #:muffle-warning
                ;;#:store-value
                ;;#:use-value
                ))

(cl:in-package #:loom.conditions)

(make-generic cell-error-name (condition))

;; (make-generic error (datum &rest arguments))

(make-generic cerror (continue-format-control datum &rest arguments))

(make-generic invalid-method-error (method format-control &rest args))

(make-generic method-combination-error (format-control &rest args))

(make-generic signal (datum &rest arguments))

(make-generic simple-condition-format-control (condition))
(make-generic simple-condition-format-arguments (condition))

(make-generic warn (datum &rest arguments))

(make-generic invoke-debugger (condition))

(make-generic make-condition (type &rest slot-initializations))

(make-generic find-restart (identifier &optional condition))

(make-generic invoke-restart (restart &rest arguments))

(make-generic invoke-restart-interactively (restart))

(make-generic restart-name (restart))

(make-generic store-value (value &optional condition))
(make-generic use-value (value &optional condition))
