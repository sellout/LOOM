(loom.internals:defpackage arrays
  (:use #:cl.data-and-control-flow
        #:loom.internals #:loom.arrays-numbers-resolution)
  (:export #:array
           #:simple-array
           #:vector
           #:simple-vector
           #:bit-vector
           #:simple-bit-vector
           #:make-array
           #:adjust-array
           #:adjustable-array-p
           #:aref
           #:array-dimension
           #:array-dimensions
           #:array-element-type
           #:array-has-fill-pointer-p
           #:array-displacement
           #:array-in-bounds-p
           #:array-rank
           #:array-row-major-index
           #:array-total-size
           #:arrayp
           #:fill-pointer
           #:row-major-aref
           #:upgraded-array-element-type
           #:array-dimension-limit
           #:array-rank-limit
           #:array-total-size-limit
           #:simple-vector-p
           #:svref
           #:vector-pop
           #:vector-push #:vector-push-extend
           #:vectorp
           #:bit #:sbit
           #:bit-and #:bit-andc1 #:bit-andc2 #:biteqv #:bit-ior #:bit-nand #:bit-nor #:bit-not #:bit-orc1 #:bit-orc2 #:bit-xor
           #:bit-vector-p
           #:simple-bit-vector-p)
  (:import-from #:cl
                #:array
                #:simple-array
                #:vector
                #:simple-vector
                #:bit-vector
                #:simple-bit-vector
                #:array-dimension-limit
                #:array-rank-limit
                #:array-total-size-limit))

(cl:in-package #:loom.arrays)

(make-generic make-array
              (dimensions
               &key element-type initial-element initial-contents adjustable
                    fill-pointer displaced-to displaced-index-offset))

(make-generic adjust-array
              (array new-dimensions
               &key element-type initial-element initial-contents fill-pointer
                    displaced-to displaced-index-offset))

(make-generic adjustable-array-p (array))

(make-generic aref (array &rest subscripts))
;; (make-generic (setf aref) (new-element array &rest subscripts))

(make-generic array-dimension (array axis-number))

(make-generic array-dimensions (array))

(make-generic array-element-type (array))

(make-generic array-has-fill-pointer-p (array))

(make-generic array-displacement (array))

(make-generic array-in-bounds-p (array &rest subscripts))

(make-generic array-rank (array))

(make-generic array-row-major-index (array &rest subscripts))

(make-generic array-total-size (array))

(make-generic arrayp (object))

(make-generic fill-pointer (vector))
;; (make-generic (setf fill-pointer) (new-fill-pointer vector))

(make-generic row-major-aref (array index))
;; (make-generic (setf row-major-aref) (new-element array index))

(make-generic upgraded-array-element-type (typespec &optional environment))

(make-generic simple-vector-p (object))

(make-generic svref (simple-vector index))
;; (make-generic (setf svref) (new-element simple-vector index))

;;(make-generic vector (&rest objects))

(make-generic vector-pop (vector))

(make-generic vector-push (new-element vector))
(make-generic vector-push-extend (new-element vector &optional extension))

(make-generic vectorp (object))

(make-generic bit (bit-array &rest subscripts))
(make-generic sbit (bit-array &rest subscripts))
;; (make-generic (setf bit) (new-bit bit-array &rest subscripts))
;; (make-generic (setf sbit) (new-bit bit-array &rest subscripts))

(make-generic bit-and (bit-array1 bit-array2 &optional opt-arg))
(make-generic bit-andc1 (bit-array1 bit-array2 &optional opt-arg))
(make-generic bit-andc2 (bit-array1 bit-array2 &optional opt-arg))
(make-generic bit-eqv (bit-array1 bit-array2 &optional opt-arg))
(make-generic bit-ior (bit-array1 bit-array2 &optional opt-arg))
(make-generic bit-nand (bit-array1 bit-array2 &optional opt-arg))
(make-generic bit-nor (bit-array1 bit-array2 &optional opt-arg))
(make-generic bit-orc1 (bit-array1 bit-array2 &optional opt-arg))
(make-generic bit-orc2 (bit-array1 bit-array2 &optional opt-arg))
(make-generic bit-xor (bit-array1 bit-array2 &optional opt-arg))
(make-generic bit-not (bit-array &optional opt-arg))

(make-generic bit-vector-p (object))

(make-generic simple-bit-vector-p (object))
