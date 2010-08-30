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
                                     (:file "utilities" :depends-on ("package"))
                                     (:file "evaluation-and-compilation"
                                            :depends-on ("utilities"))
                                     
                                     (:file "data-and-control-flow"
                                            :depends-on ("utilities"))
                                     (:file "iteration" :depends-on ("utilities"))
                                     (:file "objects" :depends-on ("utilities"))
                                     (:file "structures" :depends-on ("utilities"))
                                     (:file "conditions" :depends-on ("utilities"))
                                     (:file "symbols" :depends-on ("utilities"))

                                     (:file "numbers"
                                            :depends-on ("utilities"
                                                         "evaluation-and-compilation"
                                                         "data-and-control-flow"
                                                         "objects"
                                                         "conses"
                                                         "sequences"))
                                     (:file "characters" :depends-on ("utilities"))
                                     (:file "conses" :depends-on ("utilities"))
                                     (:file "arrays" :depends-on ("utilities"))
                                     (:file "strings" :depends-on ("utilities"))
                                     (:file "sequences" :depends-on ("utilities"))
                                     (:file "hash-tables" :depends-on ("utilities"))
                                     (:file "filenames" :depends-on ("utilities"))
                                     (:file "files" :depends-on ("utilities"))
                                     (:file "streams" :depends-on ("utilities"))
                                     (:file "printer" :depends-on ("utilities"))
                                     (:file "reader" :depends-on ("utilities"))

                                     (:file "system-construction"
                                            :depends-on ("utilities"))))))

;;; want to define this in such a way that it's easy to build the
;;; later pieces on the earlier

;;; EG, loom.objects and loom.symbols, etc. should be defined so they
;;; can be used by loom.numbers (without interning cl's number
;;; functions) to eliminate lengthy shadow lists.