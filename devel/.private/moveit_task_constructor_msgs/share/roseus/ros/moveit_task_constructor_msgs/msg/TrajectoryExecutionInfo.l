;; Auto-generated. Do not edit!


(when (boundp 'moveit_task_constructor_msgs::TrajectoryExecutionInfo)
  (if (not (find-package "MOVEIT_TASK_CONSTRUCTOR_MSGS"))
    (make-package "MOVEIT_TASK_CONSTRUCTOR_MSGS"))
  (shadow 'TrajectoryExecutionInfo (find-package "MOVEIT_TASK_CONSTRUCTOR_MSGS")))
(unless (find-package "MOVEIT_TASK_CONSTRUCTOR_MSGS::TRAJECTORYEXECUTIONINFO")
  (make-package "MOVEIT_TASK_CONSTRUCTOR_MSGS::TRAJECTORYEXECUTIONINFO"))

(in-package "ROS")
;;//! \htmlinclude TrajectoryExecutionInfo.msg.html


(defclass moveit_task_constructor_msgs::TrajectoryExecutionInfo
  :super ros::object
  :slots (_controller_names ))

(defmethod moveit_task_constructor_msgs::TrajectoryExecutionInfo
  (:init
   (&key
    ((:controller_names __controller_names) (let (r) (dotimes (i 0) (push "" r)) r))
    )
   (send-super :init)
   (setq _controller_names __controller_names)
   self)
  (:controller_names
   (&optional __controller_names)
   (if __controller_names (setq _controller_names __controller_names)) _controller_names)
  (:serialization-length
   ()
   (+
    ;; string[] _controller_names
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _controller_names)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string[] _controller_names
     (write-long (length _controller_names) s)
     (dolist (elem _controller_names)
       (write-long (length elem) s) (princ elem s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string[] _controller_names
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _controller_names (make-list n))
     (dotimes (i n)
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setf (elt _controller_names i) (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
     ))
   ;;
   self)
  )

(setf (get moveit_task_constructor_msgs::TrajectoryExecutionInfo :md5sum-) "e1a83c75a8827f8b45cef6766d0a9ba3")
(setf (get moveit_task_constructor_msgs::TrajectoryExecutionInfo :datatype-) "moveit_task_constructor_msgs/TrajectoryExecutionInfo")
(setf (get moveit_task_constructor_msgs::TrajectoryExecutionInfo :definition-)
      "# List of controllers to use when executing the trajectory
string[] controller_names

")



(provide :moveit_task_constructor_msgs/TrajectoryExecutionInfo "e1a83c75a8827f8b45cef6766d0a9ba3")


