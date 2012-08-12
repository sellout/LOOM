(loom.internals:defpackage strings
  (:use #:cl.evaluation-and-compilation #:cl.data-and-control-flow #:cl.sequences
        #:loom.internals)
  (:export #:string
           #:base-string
           #:simple-string
           #:simple-base-string
           #:simple-string-p
           #:char #:schar
           #:string
           #:string-upcase #:string-downcase #:string-capitalize #:nstring-upcase #:nstring-downcase #:nstring-capitalize
           #:string-trim #:string-left-trim #:string-right-trim
           #:string= #:string/= #:string< #:string> #:string<= #:string>= #:string-equal #:string-not-equal #:string-lessp #:string-greaterp #:string-not-greaterp #:string-not-lessp
           #:stringp
           #:make-string)
  (:import-from #:cl
                #:string
                #:base-string
                #:simple-string
                #:simple-base-string))

(cl:in-package #:loom.strings)

(make-generic simple-string-p (object))

(make-generic char (string index))
(make-generic schar (string index))
;; (make-generic (setf char) (new-character string index))
;; (make-generic (setf schar) (new-character string index))

;; (make-generic string (x))

(make-generic string-upcase (string &key start end))
(make-generic string-downcase (string &key start end))
(make-generic string-capitalize (string &key start end))
(make-generic nstring-upcase (string &key start end)
              (:method (string &rest args &key start end)
                (declare (ignore start end))
                (apply #'string-upcase string args))
              (:method ((string string) &rest args &key start end)
                (declare (ignore start end))
                (apply #'cl:nstring-upcase string args)))
(make-generic nstring-downcase (string &key start end)
              (:method (string &rest args &key start end)
                (declare (ignore start end))
                (apply #'string-downcase string args))
              (:method ((string string) &rest args &key start end)
                (declare (ignore start end))
                (apply #'cl:nstring-downcase string args)))
(make-generic nstring-capitalize (string &key start end)
              (:method (string &rest args &key start end)
                (declare (ignore start end))
                (apply #'string-capitalize string args))
              (:method ((string string) &rest args &key start end)
                (declare (ignore start end))
                (apply #'cl:nstring-capitalize string args)))

(make-generic string-trim (character-bag string)
              (:method (character-bag string)
                (string-left-trim character-bag
                                  (string-right-trim character-bag string)))
              (:method ((character-bag sequence) (string string))
                (cl:string-trim character-bag string)))
(make-generic string-left-trim (character-bag string))
(make-generic string-right-trim (character-bag string))

(make-generic string= (string1 string2 &key start1 end1 start2 end2)
              (:method (string1 string2 &rest args &key start1 end1 start2 end2)
                (declare (ignore start1 end1 start2 end2))
                (not (apply #'string/= string1 string2 args)))
              (:method ((string1 string) (string2 string)
                        &rest args &key start1 end1 start2 end2)
                (declare (ignore start1 end1 start2 end2))
                (apply #'cl:string= string1 string2 args)))
(make-generic string/= (string1 string2 &key start1 end1 start2 end2))
(make-generic string< (string1 string2 &key start1 end1 start2 end2))
(make-generic string> (string1 string2 &key start1 end1 start2 end2)
              (:method (string1 string2 &key start1 end1 start2 end2)
                (apply #'string<
                       string2 string1
                       :start2 start2 :end2 end2 :start1 start1 :end1 end1))
              (:method ((string1 string) (string2 string)
                        &rest args &key start1 end1 start2 end2)
                (declare (ignore start1 end1 start2 end2))
                (apply #'cl:string> string1 string2 args)))
;;; FIXME: missing <= and >=
(make-generic string-equal (string1 string2 &key start1 end1 start2 end2)
              (:method (string1 string2 &rest args &key start1 end1 start2 end2)
                (declare (ignore start1 end1 start2 end2))
                (not (apply #'string-not-equal string1 string2 args)))
              (:method ((string1 string) (string2 string)
                        &rest args &key start1 end1 start2 end2)
                (declare (ignore start1 end1 start2 end2))
                (apply #'cl:string-equal string1 string2 args)))
(make-generic string-not-equal (string1 string2 &key start1 end1 start2 end2))
(make-generic string-lessp (string1 string2 &key start1 end1 start2 end2))
(make-generic string-greaterp (string1 string2 &key start1 end1 start2 end2)
              (:method (string1 string2 &key start1 end1 start2 end2)
                (apply #'string-lessp
                       string2 string1
                       :start2 start2 :end2 end2 :start1 start1 :end1 end1))
              (:method ((string1 string) (string2 string)
                        &rest args &key start1 end1 start2 end2)
                (declare (ignore start1 end1 start2 end2))
                (apply #'cl:string-greaterp string1 string2 args)))
;;; FIXME: missing -NOT-GREATERP and -NOT-LESSP

(make-generic stringp (object))

(make-generic make-string (size &key initial-element element-type))
