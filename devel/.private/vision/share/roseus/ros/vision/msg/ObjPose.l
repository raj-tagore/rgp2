;; Auto-generated. Do not edit!


(when (boundp 'vision::ObjPose)
  (if (not (find-package "VISION"))
    (make-package "VISION"))
  (shadow 'ObjPose (find-package "VISION")))
(unless (find-package "VISION::OBJPOSE")
  (make-package "VISION::OBJPOSE"))

(in-package "ROS")
;;//! \htmlinclude ObjPose.msg.html


(defclass vision::ObjPose
  :super ros::object
  :slots (_name _center _axis ))

(defmethod vision::ObjPose
  (:init
   (&key
    ((:name __name) "")
    ((:center __center) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:axis __axis) "")
    )
   (send-super :init)
   (setq _name (string __name))
   (setq _center __center)
   (setq _axis (string __axis))
   self)
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:center
   (&optional __center)
   (if __center (setq _center __center)) _center)
  (:axis
   (&optional __axis)
   (if __axis (setq _axis __axis)) _axis)
  (:serialization-length
   ()
   (+
    ;; string _name
    4 (length _name)
    ;; float32[] _center
    (* 4    (length _center)) 4
    ;; string _axis
    4 (length _axis)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _name
       (write-long (length _name) s) (princ _name s)
     ;; float32[] _center
     (write-long (length _center) s)
     (dotimes (i (length _center))
       (sys::poke (elt _center i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; string _axis
       (write-long (length _axis) s) (princ _axis s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float32[] _center
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _center (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _center i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; string _axis
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _axis (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get vision::ObjPose :md5sum-) "72e29f00dd64422822163c74c4f43cc0")
(setf (get vision::ObjPose :datatype-) "vision/ObjPose")
(setf (get vision::ObjPose :definition-)
      "string name
float32[] center
string axis
")



(provide :vision/ObjPose "72e29f00dd64422822163c74c4f43cc0")


