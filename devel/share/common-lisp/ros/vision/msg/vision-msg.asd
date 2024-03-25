
(cl:in-package :asdf)

(defsystem "vision-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "ObjCloud" :depends-on ("_package_ObjCloud"))
    (:file "_package_ObjCloud" :depends-on ("_package"))
  ))