(loom.internals:defpackage packages
  (:use #:data-and-control-flow #:loom.internals)
  (:export #:package
           #:export
           #:find-symbol
           #:find-package
           #:find-all-symbols
           #:import
           #:list-all-packages
           #:rename-package
           #:shadow
           #:shadowing-import
           #:delete-package
           #:make-package
           #:with-package-iterator
           #:unexport
           #:unintern
           #:in-package
           #:unuse-package
           #:use-package
           #:defpackage
           #:do-symbols #:do-external-symbols #:do-all-symbols
           #:intern
           #:package-name
           #:package-nicknames
           #:package-shadowing-symbols
           #:package-use-list
           #:package-used-by-list
           #:packagep
           #:*package*
           #:package-error
           #:package-error-package)
  (:import-from #:cl
                #:package
                #:list-all-packages
                #:with-package-iterator
                #:in-package
                #:do-symbols #:do-external-symbols #:do-all-symbols
                #:*package*
                #:package-error)
  (:shadowing-import-from #:cl #:defpackage))

(cl:in-package #:packages)

(make-generic export (symbols &optional package))
(make-generic find-symbol (string &optional package))
(make-generic find-package (name))
(make-generic find-all-symbols (string))
(make-generic import (symbols))
(make-generic rename-package (package new-name &optional new-nicknames))
(make-generic shadow (symbol-names &optional package))
(make-generic shadowing-import (symbols &optional package))
(make-generic delete-package (package))
(make-generic make-package (package-name &key nicknames use))
(make-generic unexport (symbols &optional package))
(make-generic unintern (symbol &optional package))
(make-generic unuse-package (packages-to-unuse &optional package))
(make-generic use-package (packages-to-use &optional package))
(make-generic intern (string &optional package))
(make-generic package-name (package))
(make-generic package-nicknames (package))
(make-generic package-shadowing-symbols (package))
(make-generic package-use-list (package))
(make-generic package-used-by-list (package))
(make-generic packagep (object))
(make-generic package-error-package (condition))
