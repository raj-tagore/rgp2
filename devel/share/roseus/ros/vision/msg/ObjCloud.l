;; Auto-generated. Do not edit!


(when (boundp 'vision::ObjCloud)
  (if (not (find-package "VISION"))
    (make-package "VISION"))
  (shadow 'ObjCloud (find-package "VISION")))
(unless (find-package "VISION::OBJCLOUD")
  (make-package "VISION::OBJCLOUD"))

(in-package "ROS")
;;//! \htmlinclude ObjCloud.msg.html


(defclass vision::ObjCloud
  :super ros::object
  :slots (_name _size _points ))

(defmethod vision::ObjCloud
  (:init
   (&key
    ((:name __name) "")
    ((:size __size) (make-array 0 :initial-element 0 :element-type :integer))
    ((:points __points) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _name (string __name))
   (setq _size __size)
   (setq _points __points)
   self)
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:size
   (&optional __size)
   (if __size (setq _size __size)) _size)
  (:points
   (&optional __points)
   (if __points (setq _points __points)) _points)
  (:serialization-length
   ()
   (+
    ;; string _name
    4 (length _name)
    ;; int32[] _size
    (* 4    (length _size)) 4
    ;; float32[] _points
    (* 4    (length _points)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _name
       (write-long (length _name) s) (princ _name s)
     ;; int32[] _size
     (write-long (length _size) s)
     (dotimes (i (length _size))
       (write-long (elt _size i) s)
       )
     ;; float32[] _points
     (write-long (length _points) s)
     (dotimes (i (length _points))
       (sys::poke (elt _points i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int32[] _size
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _size (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _size i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;; float32[] _points
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _points (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _points i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(setf (get vision::ObjCloud :md5sum-) "48039639e73b60b58ebc7de8fa9cef21")
(setf (get vision::ObjCloud :datatype-) "vision/ObjCloud")
(setf (get vision::ObjCloud :definition-)
      "string name
int32[] size
float32[] points
")



(provide :vision/ObjCloud "48039639e73b60b58ebc7de8fa9cef21")


