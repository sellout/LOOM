(defpackage loom-system
  (:use #:cl #:asdf))

(in-package #:loom-system)

(defsystem loom
  :description "Lisp: Object-Oriented and Modular"
  :long-description "LOOM takes the completely standard set of CL
  functions and makes them all generic. It also segregates them into
  packages so you can have fewer symbols interned. It has the added
  benefit of (possibly) making your implementation very slow."
  :author "Greg Pfeil <greg@technomadic.org>"
  :licence "LLGPL"
  :components ((:module "src"
                        :components ((:file "package")
                                     (:file "utilities")
                                     (:file "evaluation-and-compilation")
                                     
                                     (:file "data-and-control-flow")
                                     (:file "iteration")
                                     (:file "objects")
                                     (:file "structures")

                                     (:file "symbols")

                                     (:file "numbers"
                                            :depends-on ("utilities"
                                                         "evaluation-and-compilation"
                                                         "data-and-control-flow"
                                                         "objects"
                                                         "conses"
                                                         "sequences"))
                                     (:file "characters")
                                     (:file "conses")
                                     (:file "arrays")
                                     (:file "strings")
                                     (:file "sequences")
                                     (:file "hash-tables")
                                     (:file "filenames")
                                     (:file "files")
                                     (:file "streams")

                                     (:file "system-construction")))))

;;; want to define this in such a way that it's easy to build the
;;; later pieces on the earlier

;;; EG, loom.objects and loom.symbols, etc. should be defined so they
;;; can be used by loom.numbers (without interning cl's number
;;; functions) to eliminate lengthy shadow lists.