(loom.internals:defpackage sequences
  (:use #:evaluation-and-compilation #:data-and-control-flow #:objects
        #:loom.internals)
  (:export #:sequence
           #:copy-seq
           #:elt
           #:fill
           #:make-sequence
           #:subseq
           #:map
           #:map-into
           #:reduce
           #:count #:count-if #:count-if-not
           #:length
           #:reverse #:nreverse
           #:sort #:stable-sort
           #:find #:find-if #:find-if-not
           #:position #:position-if #:position-if-not
           #:search
           #:mismatch
           #:replaces
           #:substitute #:substitute-if #:substitute-if-not
           #:nsubstitute #:nsubstitute-if #:nsubstitute-if-not
           #:concatenate
           #:merge
           #:remove #:remove-if #:remove-if-not
           #:delete #:delete-if #:delete-if-not
           #:remove-duplicates #:delete-duplicates)
  (:import-from #:cl #:sequence))

(in-package #:sequences)

(make-generic copy-seq (sequence))

(make-generic elt (sequence index))

(make-generic fill (sequence item &key start end))

(make-generic make-sequence (result-type size &key initial-element))

(make-generic subseq (sequence start &optional end))

(make-generic map (result-type function &rest sequences))

(make-generic map-into (result-sequence function &rest sequences))

(make-generic reduce
              (function sequence &key key from-end start end initial-value))

(make-generic count (item sequence &key from-end start end key test test-not))
(make-generic count-if (item sequence &key from-end start end key))
(make-generic count-if-not (item sequence &key from-end start end key))

(make-generic length (sequence))

(make-generic reverse (sequence))
(make-generic nreverse (sequence))

(make-generic sort (sequence predicate &key key))
(make-generic stable-sort (sequence predicate &key key))

(make-generic find (item sequence &key from-end test test-not start end key))
(make-generic find-if (item sequence &key from-end start end key))
(make-generic find-if-not (item sequence &key from-end start end key))

(make-generic position
              (item sequence &key from-end test test-not start end key))
(make-generic position-if (item sequence &key from-end start end key))
(make-generic position-if-not (item sequence &key from-end start end key))

(make-generic search
              (sequence-1 sequence-2
               &key from-end test test-not key start1 start2 end1 end2))

(make-generic mismatch
              (sequence-1 sequence-2
               &key from-end test test-not key start1 start2 end1 end2))

(make-generic replace (sequence-1 sequence-2 &key start1 start2 end1 end2))

(make-generic substitute
              (newitem olditem sequence
               &key from-end test test-not start end count key))
(make-generic substitute-if
              (newitem predicate sequence &key from-end start end count key))
(make-generic substitute-if-not
              (newitem predicate sequence &key from-end start end count key))
(make-generic nsubstitute
              (newitem olditem sequence
               &key from-end test test-not start end count key))
(make-generic nsubstitute-if
              (newitem olditem predicate &key from-end start end count key))
(make-generic nsubstitute-if-not
              (newitem predicate sequence &key from-end start end count key))

;;; FIXME: include documentation
(defgeneric binary-concatenate (result-type sequence-1 sequence-2)
  (:method (result-type sequence-1 sequence-2)
    (cl:concatenate result-type sequence-1 sequence-2)))
(defun concatenate (result-type &rest sequences)
  (reduce (lambda (sequence-1 sequence-2)
            (binary-concatenate result-type sequence-1 sequence-2))
          sequences))

(make-generic merge (result-type sequence-1 sequence-2 predicate &key key))

(make-generic remove
              (item sequence &key from-end test test-not start end count key))
(make-generic remove-if (test sequence &key from-end start end count key))
(make-generic remove-if-not (test sequence &key from-end start end count key))
(make-generic delete
              (item sequence &key from-end test test-not start end count key))
(make-generic delete-if (test sequence &key from-end start end count key))
(make-generic delete-if-not (test sequence &key from-end start end count key))

(make-generic remove-duplicates
              (sequence &key from-end test test-not start end key))
(make-generic delete-duplicates
              (sequence &key from-end test test-not start end key))
