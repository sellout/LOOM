(loom.internals:defpackage structures
  (:use #:cl.data-and-control-flow #:loom.internals)
  (:export #:defstruct
           #:copy-structure)
  (:import-from #:cl #:defstruct))

(cl:in-package #:loom.structures)

(make-generic copy-structure (structure))
