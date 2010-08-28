(defpackage loom
  (:use #:evaluation-and-compilation
        #:data-and-control-flow
        #:iteration
        #:objects
        #:structures
        #:symbols
        #:numbers
        #:characters
        #:conses
        #:arrays
        #:strings
        #:sequences
        #:hash-tables
        #:filenames
        #:files
        #:streams
        #:system-construction)
  (:export ;; evaluation and compilation
           #:lambda
           #:compile
           #:eval
           #:eval-when
           #:load-time-value
           #:quote
           #:compiler-macro-function
           #:define-compiler-macro
           #:defmacro
           #:macro-function
           #:macroexpand #:macroexpand-1
           #:define-symbol-macro
           #:symbol-macrolet
           #:*macroexpand-hook*
           #:proclaim
           #:declaim
           #:declare
           #:ignore #:ignorable
           #:dynamic-extent
           #:type
           #:inline #:not-inline
           #:ftype
           #:declaration
           #:optimize
           #:special
           #:locally
           #:the
           #:special-operator-p
           #:constantp
           ;; data and control flow
           #:apply
           #:defun #:fdefinition #:fboundp #:fmakunbound
           #:flet #:labels #:macrolet
           #:funcall
           #:function
           #:function-lambda-expression
           #:functionp #:compiled-function-p
           #:call-arguments-list
           #:lambda-list-keywords
           #:lambda-parameters-limit
           #:defconstant
           #:defparameter #:defvar
           #:destructuring-bind
           #:let #:let*
           #:progv
           #:setq
           #:psetq
           #:block
           #:catch
           #:go
           #:return-from
           #:return
           #:tagbody
           #:throw
           #:unwind-protect
           #:nil
           #:not
           #:t
           #:eq #:eql #:equal #:equalp
           #:identity
           #:complement
           #:constantly
           #:every #:some #:notevery #:notany
           #:and
           #:cond
           #:if
           #:or
           #:when #:unless
           #:case #:ccase #:ecase
           #:typecase #:ctypecase #:etypecase
           #:multiple-value-bind
           #:multiple-value-call
           #:multiple-value-list
           #:multiple-value-prog1
           #:multiple-value-setq
           #:values
           #:values-list
           #:multiple-values-limit
           #:nth-value
           #:prog #:prog*
           #:prog1 #:prog2
           #:progn
           #:define-macro-modify
           #:defsetf
           #:define-setf-expander
           #:get-setf-expansion
           #:setf #:psetf
           #:shiftf
           #:rotatef
           #:control-error
           #:program-error
           #:undefined-function
           #:&optional
           #:&key
           #:&rest
           #:&body
           #:&aux
           #:&environment
           #:&allow-other-keys
           ;; iteration
           #:do #:do*
           #:dotimes
           #:dolist
           #:loop
           #:loop-finish
           ;; objects
           #:function-keywords
           #:ensure-generic-function
           #:allocate-instance
           #:reinitialize-instance
           #:shared-initialize
           #:update-instance-for-different-class
           #:update-instance-for-redefined-class
           #:change-class
           #:slot-boundp
           #:slot-exists-p
           #:slot-makunbound
           #:slot-missing
           #:slot-unbound
           #:slot-value
           #:method-qualifiers
           #:no-applicable-method
           #:no-next-method
           #:remove-method
           #:make-instance
           #:make-instance-obsolete
           #:make-load-form
           #:make-load-form-saving-slots
           #:with-accessors
           #:with-slots
           #:defclass
           #:defgeneric
           #:defmethod
           #:find-class
           #:next-method-p
           #:call-method #:make-method
           #:call-next-method
           #:compute-applicable-methods
           #:define-method-combination
           #:find-method
           #:add-method
           #:initialize-instance
           #:class-name
           #:class-of
           #:unbound-slot
           #:unbound-slot-instance
           ;; structures
           #:defstruct
           #:copy-structure
           ;; symbols
           #:symbol
           #:keyword
           #:symbolp
           #:keywordp
           #:make-symbol
           #:copy-symbol
           #:gensym
           #:*gensym-counter*
           #:gentemp
           #:symbol-function
           #:symbol-name
           #:symbol-package
           #:symbol-plist
           #:symbol-value
           #:get
           #:remprop
           #:boundp
           #:makunbound
           #:set
           #:unbound-variable
           ;; numbers
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
           #:= #:/= #:< #:> #:<= #:>=
           #:max #:min
           #:minusp #:plusp
           #:zerop
           #:floor #:ffloor #:ceiling #:fceiling #:truncate #:ftruncate #:round #:fround
           #:sin #:cos #:tan
           #:asin #:acos #:atan
           #:pi
           #:sinh #:cosh #:tanh #:asinh #:acosh #:atanh
           #:* #:+ #:- #:/
           #:1+ #:1-
           #:abs
           #:evenp #:oddp
           #:exp #:expt
           #:gcd
           #:lcm
           #:log
           #:mod #:rem
           #:signum
           #:sqrt #:isqrt
           #:cis
           #:conjugate
           #:sqrt
           ;; characters
           #:character
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
           #:name-char
           ;; conses
           #:list
           #:null
           #:cons
           #:atom
           #:cons
           #:consp
           #:rplaca #:rplacd
           #:car #:cdr #:caar #:cadr #:cdar #:cddr #:caaar #:caadr #:cadar #:caddr #:cdaar #:cdadr #:cddar #:cdddr #:caaaar #:caaadr #:caadar #:caaddr #:cadaar #:cadadr #:caddar #:cadddr #:cdaaar #:cdaadr #:cdadar #:cdaddr #:cddaar #:cddadr #:cdddar #:cddddr
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
           #:first #:second #:third #:fourth #:fifth #:sixth #:seventh #:eighth #:ninth #:tenth
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
           #:union #:nunion
           ;; arrays
           #:array
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
           #:simple-bit-vector-p
           ;; strings
           #:string
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
           #:make-string
           ;; sequences
           #:sequence
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
           #:substitute #:substitute-if #:substitute-if-not #:nsubstitute #:nsubstitute-if #:nsubstitute-if-not
           #:concatenate
           #:merge
           #:remove #:remove-if #:remove-if-not #:delete #:delete-if #:delete-if-not
           #:remove-duplicates #:delete-duplicates
           ;; hash-tables
           #:hash-table
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
           #:sxhash
           ;; filenames
           #:pathname
           #:logical-pathname
           #:make-pathname
           #:pathnamep
           #:pathname-host #:pathname-device #:pathname-directory #:pathname-name #:pathname-type #:pathname-version
           #:load-logical-pathname-translations
           #:logical-pathname-translations
           #:logical-pathname
           #:*default-pathname-defaults*
           #:namestring #:file-namestring #:directory-namestring #:host-namestring #:enough-namestring
           #:parse-namestring
           #:wile-pathname-p
           #:pathname-match-p
           #:translate-logical-pathname
           #:translate-pathname
           #:merge-pathnames
           ;; files
           #:directory
           #:probe-file
           #:ensure-directories-exist
           #:truename
           #:file-author
           #:file-write-date
           #:rename-file
           #:delete-file
           #:file-error
           #:file-error-pathname
           ;; streams
           #:stream
           #:broadcast-stream
           #:concatenated-stream
           #:echo-stream
           #:file-stream
           #:string-stream
           #:synonym-stream
           #:two-way-stream
           #:input-stream-p #:output-stream-p
           #:interactive-stream-p
           #:open-stream-p
           #:stream-element-type
           #:streamp
           #:read-byte
           #:write-byte
           #:peek-char
           #:read-char
           #:read-char-no-hang
           #:terpri #:fresh-line
           #:unread-char
           #:write-char
           #:read-line
           #:write-string #:write-line
           #:read-sequence
           #:write-sequence
           #:file-length
           #:file-position
           #:file-string-length
           #:open
           #:stream-external-format
           #:with-open-file
           #:close
           #:with-open-stream
           #:listen
           #:clear-input
           #:finish-output #:force-output #:clear-output
           #:y-or-n-p #:yes-or-no-p
           #:make-synonym-stream
           #:synonym-stream-symbol
           #:broadcast-stream-streams
           #:make-broadcast-stream
           #:make-two-way-stream
           #:two-way-stream-input-stream #:two-way-stream-output-stream
           #:echo-stream-input-stream #:echo-stream-output-stream
           #:make-echo-stream
           #:concatenated-stream-streams
           #:make-concatenated-streams
           #:get-output-stream-string
           #:make-string-input-stream
           #:make-string-output-stream
           #:with-input-from-string
           #:with-output-to-string
           #:*debug-io* #:*error-output* #:*query-io* #:*standard-input* #:*standard-output* #:*trace-output*
           #:*terminal-io*
           #:stream-error
           #:stream-error-stream
           #:end-of-file
           ;; system construction
           #:compile-file
           #:compile-file-pathname
           #:load
           #:with-compilation-unit
           #:*features*
           #:*compile-file-pathname* #:*compile-file-truename*
           #:*load-pathname* #:*load-truename*
           #:*compile-print #:*compile-verbose*
           #:*load-print* #:*load-verbose*
           #:*modules*
           #:provide #:require))