(loom.internals:defpackage numbers
  (:use #:evaluation-and-compilation #:data-and-control-flow
        #:objects #:conses #:sequences #:loom.internals)
  (:export #:number
           #:complex
           #:real
           #:float
           #:short-float #:single-float #:double-float #:long-float
           #:rational
           #:ratio
           #:integer
           #:signed-byte
           #:unsigned-byte
           #:mod
           #:bit
           #:fixnum
           #:bignum
           #:= #:/= #:< #:> #:<= #:>=
           #:max #:min
           #:minusp #:plusp
           #:zerop
           #:floor #:ffloor #:ceiling #:fceiling #:truncate #:ftruncate #:round #:fround
           #:sin #:cos #:tan
           #:asin #:acos #:atan
           #:pi
           #:sinh #:cosh #:tanh #:asinh #:acosh #:atanh
           #:*
           #:+
           #:-
           #:/
           #:1+ #:1-
           #:abs
           #:evenp #:oddp
           #:exp #:expt
           #:gcd
           #:incf #:decf
           #:lcm
           #:log
           #:mod #:rem
           #:signum
           #:sqrt #:isqrt
           #:random-state
           #:make-random-state
           #:random
           #:random-state-p
           #:*random-state*
           #:numberp
           #:cis
           #:complexp
           #:conjugate
           #:phase
           #:realpart #:imagpart
           #:upgraded-complex-part-type
           #:realp
           #:numerator #:denominator
           #:rational #:rationalize
           #:rationalp
           #:ash
           #:integer-length
           #:integer-p
           #:parse-integer
           #:boole
           #:boole-1 #:boole-2 #:boole-and #:boole-andc1 #:boole-andc2
           #:boole-c1 #:boole-c2 #:boole-clr #:boole-eqv #:boole-ior
           #:boole-nand #:boole-nor #:boole-orc1 #:boole-orc2 #:boole-set #:boole-xor
           #:logand #:logandc1 #:logandc2 #:logeqv #:logior #:lognand #:lognor #:lognot
           #:logorc1 #:logorc2 :logxor)
  (:import-from #:cl
                #:number
                #:complex
                #:real
                #:float
                #:short-float #:single-float #:double-float #:long-float
                #:rational
                #:ratio
                #:integer
                #:signed-byte
                #:unsigned-byte
                #:mod
                #:bit
                #:fixnum
                #:bignum
                #:incf #:decf
                #:random-state
                #:boole-1 #:boole-2 #:boole-and #:boole-andc1 #:boole-andc2
                #:boole-c1 #:boole-c2 #:boole-clr #:boole-eqv #:boole-ior
                #:boole-nand #:boole-nor #:boole-orc1 #:boole-orc2 #:boole-set
                #:boole-xor))

(in-package #:numbers)

;;; Comparison

(define-generic-nary = (left right)
  (every (lambda (number) (binary-= left number))
         right))

(defun /= (&rest numbers)
  (not (apply #'= numbers)))

;;; Ordering

(define-generic-nary < (left right))

(defun > (&rest numbers)
  (apply #'< (reverse numbers)))

(define-generic-nary <= (left right))

(defun >= (&rest numbers)
  (apply #'<= (reverse numbers)))

(define-generic-nary max (left right reals))
(define-generic-nary min (left right reals))

;;; Trigonometry

(make-generic sin (radians))
(make-generic cos (radians))
(make-generic tan (radians))
(make-generic asin (number))
(make-generic acos (number))
;; (make-generic atan (number))
(make-generic sinh (number))
(make-generic cosh (number))
(make-generic tanh (number))
(make-generic asinh (number))
(make-generic acosh (number))
(make-generic atanh (number))

;;; Arithmetic

(define-generic-nary * (multiplicand multiplier values)
  (case (length values)
    (0 1)
    (1 (car values))
    (otherwise (reduce #'binary-* values))))

(define-generic-nary + (addend augend values)
  (case (length values)
    (0 0)
    (1 (car values))
    (otherwise (reduce #'binary-+ values))))

(defgeneric unary-- (number)
  (:documentation "negation")
  (:method (number)
    (cl:- number)))

(define-generic-nary - (minuend subtrahend)
  (if (> (length subtrahend) 0)
      (reduce #'binary-- (cons minuend subtrahend))
      (unary-- minuend)))

(defgeneric unary-/ (number)
  (:documentation "reciprocal")
  (:method (number)
    (cl:/ number)))

(define-generic-nary / (dividend divisor)
  (if (> (length divisor) 0)
      (reduce #'binary-/ (cons dividend divisor))
      (unary-/ dividend)))

(make-generic 1+ (number))
(make-generic 1- (number))

(make-generic abs (value))

(make-generic evenp (integer))
(make-generic oddp (integer))

(make-generic exp (power))
(make-generic expt (base power))

(define-generic-nary gcd (left right integers))

(make-generic sqrt (value))

(make-generic conjugate (number))

(make-generic phase (number))

(make-generic realpart (number))
(make-generic imagpart (number))
