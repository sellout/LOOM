(loom.internals:defpackage conses
  (:use #:cl.data-and-control-flow #:cl.objects #:cl.sequences #:loom.internals)
  (:export #:list
           #:null
           #:cons
           #:atom
           #:cons
           #:consp
           #:rplaca #:rplacd
           #:car #:cdr #:caar #:cadr #:cdar #:cddr
           #:caaar #:caadr #:cadar #:caddr #:cdaar #:cdadr #:cddar #:cdddr
           #:caaaar #:caaadr #:caadar #:caaddr #:cadaar #:cadadr #:caddar #:cadddr
           #:cdaaar #:cdaadr #:cdadar #:cdaddr #:cddaar #:cddadr #:cdddar #:cddddr
           #:copy-tree
           #:sublis #:nsublis
           #:subst #:subst-if #:subst-if-not #:nsubst #:nsubst-if #:nsubst-if-not
           #:tree-equal
           #:copy-list
           #:list #:list*
           #:list-length
           #:listp
           #:make-list
           #:push
           #:pop
           #:first #:second #:third #:fourth #:fifth
           #:sixth #:seventh #:eighth #:ninth #:tenth
           #:nth
           #:endp
           #:null
           #:nconc
           #:append
           #:revappend #:nreconc
           #:butlast #:nbutlast
           #:last
           #:ldiff #:tailp
           #:nthcdr
           #:rest
           #:member #:member-if #:member-if-not
           #:mapc #:mapcar #:mapcan #:mapl #:maplist #:mapcon
           #:acons
           #:assoc #:assoc-if #:assoc-if-not
           #:copy-alist
           #:pairlis
           #:rassoc #:rassoc-if #:rassoc-if-not
           #:get-properties
           #:getf
           #:remf
           #:intersection #:nintersection
           #:adjoin
           #:pushnew
           #:set-difference #:nset-difference
           #:set-exclusive-or #:nset-exclusive-or
           #:subsetp
           #:union #:nunion)
  (:import-from #:cl
                #:list #:null #:cons #:atom #:list* #:push #:pop
                #:nconc #:append
                #:mapc #:mapcar #:mapcan #:mapl #:maplist #:mapcon
                #:remf #:pushnew))

(cl:in-package #:loom.conses)

;; FIXME: can't shadow the function without shadowing the class
;; (make-generic cons (object-1 object-2))

(make-generic consp (object))

;; FIXME: can't shadow the function without shadowing the class
;; (make-generic atom (object))

(make-generic rplaca (cons object))
(make-generic rplacd (cons object))

(make-generic car (x))
(make-generic cdr (x))
(make-generic caar (x))
(make-generic cadr (x))
(make-generic cdar (x))
(make-generic cddr (x))
(make-generic caaar (x))
(make-generic caadr (x))
(make-generic cadar (x))
(make-generic caddr (x))
(make-generic cdaar (x))
(make-generic cdadr (x))
(make-generic cddar (x))
(make-generic cdddr (x))
(make-generic caaaar (x))
(make-generic caaadr (x))
(make-generic caadar (x))
(make-generic caaddr (x))
(make-generic cadaar (x))
(make-generic cadadr (x))
(make-generic caddar (x))
(make-generic cadddr (x))
(make-generic cdaaar (x))
(make-generic cdaadr (x))
(make-generic cdadar (x))
(make-generic cdaddr (x))
(make-generic cddaar (x))
(make-generic cddadr (x))
(make-generic cdddar (x))
(make-generic cddddr (x))
#| FIXME: need a better way to replace SETF functions (or are they already fine?)
(make-generic (setf car) (new-object x))
(make-generic (setf cdr) (new-object x))
(make-generic (setf caar) (new-object x))
(make-generic (setf cadr) (new-object x))
(make-generic (setf cdar) (new-object x))
(make-generic (setf cddr) (new-object x))
(make-generic (setf caaar) (new-object x))
(make-generic (setf caadr) (new-object x))
(make-generic (setf cadar) (new-object x))
(make-generic (setf caddr) (new-object x))
(make-generic (setf cdaar) (new-object x))
(make-generic (setf cdadr) (new-object x))
(make-generic (setf cddar) (new-object x))
(make-generic (setf cdddr) (new-object x))
(make-generic (setf caaaar) (new-object x))
(make-generic (setf caaadr) (new-object x))
(make-generic (setf caadar) (new-object x))
(make-generic (setf caaddr) (new-object x))
(make-generic (setf cadaar) (new-object x))
(make-generic (setf cadadr) (new-object x))
(make-generic (setf caddar) (new-object x))
(make-generic (setf cadddr) (new-object x))
(make-generic (setf cdaaar) (new-object x))
(make-generic (setf cdaadr) (new-object x))
(make-generic (setf cdadar) (new-object x))
(make-generic (setf cdaddr) (new-object x))
(make-generic (setf cddaar) (new-object x))
(make-generic (setf cddadr) (new-object x))
(make-generic (setf cdddar) (new-object x))
(make-generic (setf cddddr) (new-object x))
;; |#

(make-generic copy-tree (tree))

(make-generic sublis (alist tree &key key test test-not))
(make-generic nsublis (alist tree &key key test test-not)
  (:method (alist tree &rest args)
    (apply #'sublis alist tree args))
  (:method ((alist list) (tree list) &rest args)
    (apply #'cl:nsublis alist tree args)))

(make-generic subst (new old tree &key key test test-not))
(make-generic subst-if (new predicate tree &key key))
(make-generic subst-if-not (new predicate tree &key key))
(make-generic nsubst (new old tree &key key test test-not)
  (:method (new old tree &rest args)
    (apply #'subst new old tree args))
  (:method (new old (tree list) &rest args)
    (apply #'cl:nsubst new old tree args)))
(make-generic nsubst-if (new predicate tree &key key)
  (:method (new predicate tree &rest args)
    (apply #'subst-if new predicate tree args))
  (:method (new predicate (tree list) &rest args)
    (apply #'cl:nsubst-if new predicate tree args)))
(make-generic nsubst-if-not (new predicate tree &key key)
  (:method (new predicate tree &rest args)
    (apply #'subst-if-not new predicate tree args))
  (:method (new predicate (tree list) &rest args)
    (apply #'cl:nsubst-if-not new predicate tree args)))

(make-generic tree-equal (tree-1 tree-2 &key test test-not))

(make-generic copy-list (list))

(make-generic list-length (list))

(make-generic listp (object))

(make-generic make-list (size &key initial-element))

(make-generic first (list))
(make-generic second (list))
(make-generic third (list))
(make-generic fourth (list))
(make-generic fifth (list))
(make-generic sixth (list))
(make-generic seventh (list))
(make-generic eighth (list))
(make-generic ninth (list))
(make-generic tenth (list))
#| FIXME: need a better way to replace SETF functions (or are they already fine?)
(make-generic (setf first) (new-object list))
(make-generic (setf second) (new-object list))
(make-generic (setf third) (new-object list))
(make-generic (setf fourth) (new-object list))
(make-generic (setf fifth) (new-object list))
(make-generic (setf sixth) (new-object list))
(make-generic (setf seventh) (new-object list))
(make-generic (setf eighth) (new-object list))
(make-generic (setf ninth) (new-object list))
(make-generic (setf tenth) (new-object list))
;; |#

(make-generic nth (n list))
;; (make-generic (setf nth) (new-object n list))

(make-generic endp (list))

;; FIXME: can't shadow the function without shadowing the class
;; (make-generic null (object))

(make-generic revappend (list tail)
  (:method (list tail)
    (nconc (reverse list) tail))
  (:method ((list list) tail)
    (cl:revappend list tail)))
(make-generic nreconc (list tail)
  (:method (list tail)
    (nconc (nreverse list) tail))
  (:method ((list list) tail)
    (cl:nreconc list tail)))

(make-generic butlast (list &optional n))
(make-generic nbutlast (list &optional n)
  (:method (list &optional (n 1))
    (apply #'butlast list n))
  (:method ((list list) &optional (n 1))
    (apply #'cl:nbutlast list n)))

(make-generic last (list &optional n))

(make-generic ldiff (list object))
(make-generic tailp (object list))

(make-generic nthcdr (n list))

(make-generic rest (list))
;; (make-generic (setf rest) (new-tail list))

(make-generic member (item list &key key test test-not))
(make-generic member-if (predicate list &key key))
(make-generic member-if-not (predicate list &key key))

(make-generic acons (key datum alist))

(make-generic assoc (item list &key key test test-not))
(make-generic assoc-if (predicate list &key key))
(make-generic assoc-if-not (predicate list &key key))

(make-generic copy-alist (alist))

(make-generic pairlis (keys data &optional alist))

(make-generic rassoc (item list &key key test test-not))
(make-generic rassoc-if (predicate list &key key))
(make-generic rassoc-if-not (predicate list &key key))

(make-generic get-properties (plist indicator-list))

(make-generic getf (plist indicator &optional default))
;; (make-generic (setf getf) (new-value plist indicator &optional default))

(make-generic intersection (list-1 list-2 &key key test test-not))
(make-generic nintersection (list-1 list-2 &key key test test-not)
  (:method (list-1 list-2 &rest args)
    (apply #'intersection list-1 list-2 args))
  (:method ((list-1 list) (list-2 list) &rest args)
    (apply #'cl:nintersection list-1 list-2 args)))

(make-generic adjoin (item list &key key test test-not))

(make-generic set-difference (list-1 list-2 &key key test test-not))
(make-generic nset-difference (list-1 list-2 &key key test test-not)
  (:method (list-1 list-2 &rest args)
    (apply #'set-difference list-1 list-2 args))
  (:method ((list-1 list) (list-2 list) &rest args)
    (apply #'cl:nset-difference list-1 list-2 args)))

(make-generic set-exclusive-or (list-1 list-2 &key key test test-not))
(make-generic nset-exclusive-or (list-1 list-2 &key key test test-not)
  (:method (list-1 list-2 &rest args)
    (apply #'set-exclusive-or list-1 list-2 args))
  (:method ((list-1 list) (list-2 list) &rest args)
    (apply #'cl:nset-exclusive-or list-1 list-2 args)))

(make-generic subsetp (list-1 list-2 &key key test test-not)
  (:method (list-1 list-2 &rest args)
    (null (apply #'set-difference
                 list-1
                 (apply #'intersection list-1 list-2 args)
                 args)))
  (:method ((list-1 list) (list-2 list) &rest args)
    (apply #'cl:subsetp list-1 list-2 args)))

(make-generic union (list-1 list-2 &key key test test-not))
(make-generic nunion (list-1 list-2 &key key test test-not)
  (:method (list-1 list-2 &rest args)
    (apply #'union list-1 list-2 args))
  (:method ((list-1 list) (list-2 list) &rest args)
    (apply #'cl:nunion list-1 list-2 args)))
