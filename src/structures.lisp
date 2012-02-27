(loom.internals:defpackage structures
  (:use #:data-and-control-flow #:loom.internals)
  (:export #:defstruct
           #:copy-structure)
  (:import-from #:cl #:defstruct))

(cl:in-package #:structures)

(make-generic copy-structure (structure))