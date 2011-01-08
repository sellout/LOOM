(defpackage loom
  (:documentation "This is an umbrella package that collects all the LOOM
                   modules so you can get the flexibility of the generic
                   functions without having to pick and choose the pieces you
                   want – IE, it gives you LOO without the M.")
  (:use))

(defpackage loom.utilities
  (:documentation "Some additional tools that make LOOM easier to use.")
  (:use #:cl)
  (:export #:use-with-cl))

(in-package #:loom.utilities)

(defun use-with-cl (&rest loom-packages)
  "This generates a :USE clause for DEFPACKAGE that uses the LOOM versions of
   the packages listed, and the CL versions of everything else. It is best used
   like:

       (defpackage foo
         #.(loom.utilities:use-with-cl :numbers :objects)
         (:use others)
         ...)"
  (let ((pkg-strings (mapcar #'string loom-packages)))
    (cons :use
          (mapcar (lambda (package)
                    (let ((name (package-name package)))
                      (if (member (subseq name 3) pkg-strings :test #'string=)
                          (concatenate 'string "LOOM." (subseq name 3))
                          name)))
                  (remove-if (lambda (package) (/= (mismatch "CL." package) 3))
                             (list-all-packages)
                             :key #'package-name)))))
