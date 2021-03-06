#|
  This file is a part of Caveman package.
  URL: http://github.com/fukamachi/caveman
  Copyright (c) 2011 Eitarow Fukamachi <e.arrows@gmail.com>

  Caveman is freely distributable under the LLGPL License.
|#

(in-package :cl-user)
(defpackage caveman-test-asd
  (:use :cl :asdf))
(in-package :caveman-test-asd)

(defsystem caveman-test
  :depends-on (:caveman
               :cl-test-more
               :cl-fad
               :drakma
               :usocket)
  :components ((:module "v1/t"
                :serial t
                :components
                ((:test-file "init")
                 (:test-file "caveman")
                 (:test-file "final"))))
  :defsystem-depends-on (:cl-test-more)
  :perform (test-op :after (op c)
                    (funcall (intern #. (string :run-test-system) :cl-test-more)
                             c)))
