(loom.internals:defpackage hash-tables
  (:use #:cl)
  (:export #:hash-table
           #:make-hash-table
           #:hash-table-p
           #:hash-table-count
           #:hash-table-rehash-size
           #:hash-table-rehash-threshold
           #:hash-table-size
           #:hash-table-test
           #:gethash
           #:remhash
           #:maphash
           #:with-hash-table-iterator
           #:clrhash
           #:sxhash))
