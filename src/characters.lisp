(loom.internals:defpackage characters
  (:use #:evaluation-and-compilation #:data-and-control-flow #:objects #:conses
        #:loom.internals)
  (:export #:character
           #:base-char
           #:standard-char
           #:extended-char
           #:char= #:char/= #:char< #:char> #:char<= #:char>= #:char-equal #:char-not-equal #:char-lessp #:char-greaterp #:char-not-greaterp #:char-not-lessp
           #:characterp
           #:alpha-char-p
           #:alphanumericp
           #:digit-char
           #:digit-char-p
           #:graphic-char-p
           #:standard-char-p
           #:char-upcase #:char-downcase
           #:upper-case-p #:lower-case-p #:both-case-p
           #:char-code
           #:char-int
           #:code-char
           #:char-code-limit
           #:char-name
           #:name-char)
  (:export #:binary-char= #:binary-char/= #:binary-char< #:binary-char> #:binary-char<= #:binary-char>= #:binary-char-equal #:binary-char-not-equal #:binary-char-lessp #:binary-char-greaterp #:binary-char-not-greaterp #:binary-char-not-lessp)
  (:import-from #:cl
                ;;#:character
                #:base-char
                #:standard-char
                #:extended-char
                #:char-code-limit))

(cl:in-package #:characters)

(define-generic-nary char= (left right)
  (every (lambda (character) (binary-char= left character)) right))

(define-generic-nary char/= (left right)
  (some (lambda (character) (binary-char/= left character)) right))
(defmethod binary-char/= (left right)
  (not (binary-char= left right)))

(define-generic-nary char< (left right characters+)
  (every #'binary-char< characters+ (cdr characters+)))

(define-generic-nary char> (left right characters+)
  (every #'binary-char> characters+ (cdr characters+)))
(defmethod binary-char> (left right)
  (binary-char< right left))

(define-generic-nary char<= (left right characters+)
  (every #'binary-char<= characters+ (cdr characters+)))
(defmethod binary-char<= (left right)
  (not (binary-char< right left)))

(define-generic-nary char>= (left right characters+)
  (every #'binary-char>= characters+ (cdr characters+)))
(defmethod binary-char>= (left right)
  (not (binary-char< left right)))

(define-generic-nary char-equal (left right)
  (every (lambda (character) (binary-char-equal left character)) right))

(define-generic-nary char-not-equal (left right)
  (some (lambda (character) (binary-char-not-equal left character)) right))
(defmethod binary-char-not-equal (left right)
  (not (binary-char-equal left right)))

(define-generic-nary char-lessp (left right characters+)
  (every #'binary-char-lessp characters+ (cdr characters+)))

(define-generic-nary char-greaterp (left right characters+)
  (every #'binary-char-greaterp characters+ (cdr characters+)))
(defmethod binary-char-greaterp (left right)
  (binary-char-lessp right left))

(define-generic-nary char-not-greaterp (left right characters+)
  (every #'binary-char-not-greaterp characters+ (cdr characters+)))
(defmethod binary-char-not-greaterp (left right)
  (not (binary-char-lessp right left)))

(define-generic-nary char-not-lessp (left right characters+)
  (every #'binary-char-not-lessp characters+ (cdr characters+)))
(defmethod binary-char-not-lessp (left right)
  (not (binary-char-lessp left right)))

(make-generic character (character))

(make-generic characterp (object))

(make-generic alpha-char-p (character))

(make-generic alphanumericp (character))

(make-generic digit-char (weight &optional radix))

(make-generic digit-char-p (char &optional radix))

(make-generic graphic-char-p (char))

(make-generic standard-char-p (character))

(make-generic char-upcase (character))
(make-generic char-downcase (character))

(make-generic upper-case-p (character))
(make-generic lower-case-p (character))
(make-generic both-case-p (character)
              (:method (character)
                (or (upper-case-p character) (lower-case-p character))))

(make-generic char-code (character))

(make-generic char-int (character))

(make-generic code-char (code))

(make-generic char-name (character))

(make-generic name-char (name))
