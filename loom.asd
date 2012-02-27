(defpackage loom-system
  (:use #:cl #:asdf))

(in-package #:loom-system)

(defsystem loom
  :description "Lisp: Object-Oriented and Modular"
  :long-description "LOOM takes the completely standard set of CL functions and
  makes them all generic. It also segregates them into packages so you can have
  fewer symbols interned. It has the added benefit of (possibly) making your
  implementation very slow.

  The real use case for this is overriding standard symbols to work on your own
  classes. Beyond just making things generic, I try to make it as easy as
  possible. For example:

• All “non-consing” functions fall back to their consing alternatives. So if you
  define INTERSECTION for your type, NINTERSECTION will work (but will cons).
• Trivial non-specialized implementations are given when possible. EG, #'>,
  #'<=, and #'>= are defined using #'<; so you only need to define #'< to get
  all of them.
• Even functions with no specializable (required) parameters are genericized, to
  make it easy to take advantage of method combinations and the MOP."
  :author "Greg Pfeil <greg@technomadic.org>"
  :licence "LLGPL"
  :pathname "src/"
  :components ((:file "package")
               (:file "utilities" :depends-on ("package"))
               (:file "evaluation-and-compilation"
                      :depends-on ("data-and-control-flow"))
               (:file "types-and-classes" :depends-on ("data-and-control-flow"))
               (:file "data-and-control-flow" :depends-on ("utilities"))
               (:file "iteration" :depends-on ("utilities"))
               (:file "objects" :depends-on ("data-and-control-flow"))
               (:file "structures" :depends-on ("data-and-control-flow"))
               (:file "conditions" :depends-on ("data-and-control-flow"))
               (:file "symbols" :depends-on ("data-and-control-flow"))
               (:file "packages" :depends-on ("data-and-control-flow"))
               (:file "numbers"
                      :depends-on ("evaluation-and-compilation"
                                   "data-and-control-flow"
                                   "objects"
                                   "conses"
                                   "sequences"))
               (:file "characters"
                      :depends-on ("evaluation-and-compilation"
                                   "data-and-control-flow"
                                   "objects"
                                   "conses"))
               (:file "conses"
                      :depends-on ("data-and-control-flow"
                                   "objects"
                                   "sequences"))
               (:file "arrays" :depends-on ("data-and-control-flow"))
               (:file "strings"
                      :depends-on ("evaluation-and-compilation"
                                   "data-and-control-flow"
                                   "sequences"))
               (:file "sequences"
                      :depends-on ("evaluation-and-compilation"
                                   "data-and-control-flow"
                                   "objects"))
               (:file "hash-tables" :depends-on ("utilities"))
               (:file "filenames" :depends-on ("utilities"))
               (:file "files" :depends-on ("utilities"))
               (:file "streams" :depends-on ("utilities"))
               (:file "printer" :depends-on ("utilities"))
               (:file "reader" :depends-on ("utilities"))
               (:file "system-construction" :depends-on ("utilities"))
               (:file "environment" :depends-on ("utilities"))))

;;; want to define this in such a way that it's easy to build the
;;; later pieces on the earlier

;;; EG, loom.objects and loom.symbols, etc. should be defined so they
;;; can be used by loom.numbers (without interning cl's number
;;; functions) to eliminate lengthy shadow lists.
