The primary goal of LOOM is to provide Common Lisp standard functions as generic functions. This is useful, for example, to do things like extend mathematical operators to work on new classes.

The downside of this is the overhead of dispatch. To help mitigate this, LOOM is divided into multiple packages (one for each chapter in the spec) that can be used individually. Each package has two versions, one is prefixed with `cl.` and just passes through the CL symbols, and the other is prefixed with `loom.` and contains all the generic definitions.

With this partitioning, you can manually load any combination of CL and LOOM packages like so:

```common-lisp
(defpackage foo
  (:documentation "This package defines some methods on number functions.")
  (:use #:loom.numbers #:cl.conses #:cl.objects)
  ...)
```

However, most people don't care about selectively importing CL symbols – you mostly want to import all CL symbols and just override a few with LOOM symbols. LOOM offers a function to help with this:

```common-lisp
(defpackage bar
  #.(loom.utilities:use-with-cl :numbers :environment)
  (:use #:some-other-package)
  ...)
```

That form will `use` `loom.numbers` and `loom.environment` along with `cl.objects`, etc.

You can also `(use-package #:loom)`, but the overhead from that is probably way more than you want to deal with. `(in-package #:loom-user)` is the parallel to `cl-user`, for playing around with the system.

# Additional Symbols

To make it possible to define useful methods, we need to export a few new symbols in some cases. In `loom.numbers`, the symbols `binary-=`, `binary-<`, `binary-<=`, `binary-*`, `binary-+`, `unary--`, `binary--`, `unary-/`, `binary-/`, `binary-max`, `binary-min`, `binary-gcd`, and `binary-lcm` allow methods to be made on pairwise combinations of classes.

# Examples

The [math-extensions](https://github.com/sellout/math-extensions) library uses `loom.numbers` to add additional numerical classes (quaternions, intervals, etc.) to Common Lisp.
