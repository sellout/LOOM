(loom.internals:defpackage environment
  (:use #:cl.evaluation-and-compilation #:cl.data-and-control-flow
        #:loom.internals #:loom.environment-numbers-resolution)
  (:export #:decode-universal-time
           #:encode-universal-time
           #:get-universal-time #:get-decoded-time
           #:sleep
           #:apropos #:apropos-list
           #:describe
           #:describe-object
           #:trace #:untrace
           #:step
           #:time
           #:internal-time-units-per-second
           #:get-internal-real-time
           #:get-internal-run-time
           #:disassemble
           #:documentation
           #:room
           #:ed
           #:inspect
           #:dribble
           #:-
           #:+ #:++ #:+++
           #:* #:** #:***
           #:/ #:// #:///
           #:lisp-implementation-type #:lisp-implementation-version
           #:short-site-name #:long-site-name
           #:machine-instance
           #:machine-type
           #:machine-version
           #:software-type #:software-version
           #:user-homedir-pathname)
  (:import-from #:cl
                #:describe-object
                #:trace #:untrace
                #:step
                #:time
                #:internal-time-units-per-second
                #:documentation
                #:++ #:+++
                #:** #:***
                #:// #:///))

(cl:in-package #:loom.environment)

(make-generic decode-universal-time (universal-time &optional time-zone))

(make-generic encode-universal-time
              (second minute hour date month year &optional time-zone))

(make-generic get-universal-time ())
(make-generic get-decoded-time ())

(make-generic sleep (seconds))

(make-generic apropos (string &optional package))
(make-generic apropos-list (string &optional package))

(make-generic describe (object &optional stream))

(make-generic get-internal-real-time ())

(make-generic get-internal-run-time ())

(make-generic disassemble (fn))

(make-generic room (&optional x))

(make-generic ed (&optional x))

(make-generic inspect (object))

(make-generic dribble (&optional pathname))

(define-symbol-macro - cl:-)

(define-symbol-macro + cl:+)

(define-symbol-macro * cl:*)

(define-symbol-macro / cl:/)

(make-generic lisp-implementation-type ())
(make-generic lisp-implementation-version ())

(make-generic short-site-name ())
(make-generic long-site-name ())

(make-generic machine-instance ())

(make-generic machine-type ())

(make-generic machine-version ())

(make-generic software-type ())
(make-generic software-version ())

(make-generic user-homedir-pathname (&optional host))
