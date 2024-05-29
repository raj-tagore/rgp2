; Auto-generated. Do not edit!


(cl:in-package moveit_task_constructor_msgs-msg)


;//! \htmlinclude TrajectoryExecutionInfo.msg.html

(cl:defclass <TrajectoryExecutionInfo> (roslisp-msg-protocol:ros-message)
  ((controller_names
    :reader controller_names
    :initarg :controller_names
    :type (cl:vector cl:string)
   :initform (cl:make-array 0 :element-type 'cl:string :initial-element "")))
)

(cl:defclass TrajectoryExecutionInfo (<TrajectoryExecutionInfo>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TrajectoryExecutionInfo>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TrajectoryExecutionInfo)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name moveit_task_constructor_msgs-msg:<TrajectoryExecutionInfo> is deprecated: use moveit_task_constructor_msgs-msg:TrajectoryExecutionInfo instead.")))

(cl:ensure-generic-function 'controller_names-val :lambda-list '(m))
(cl:defmethod controller_names-val ((m <TrajectoryExecutionInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_task_constructor_msgs-msg:controller_names-val is deprecated.  Use moveit_task_constructor_msgs-msg:controller_names instead.")
  (controller_names m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TrajectoryExecutionInfo>) ostream)
  "Serializes a message object of type '<TrajectoryExecutionInfo>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'controller_names))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((__ros_str_len (cl:length ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) ele))
   (cl:slot-value msg 'controller_names))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TrajectoryExecutionInfo>) istream)
  "Deserializes a message object of type '<TrajectoryExecutionInfo>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'controller_names) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'controller_names)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:aref vals i) __ros_str_idx) (cl:code-char (cl:read-byte istream))))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TrajectoryExecutionInfo>)))
  "Returns string type for a message object of type '<TrajectoryExecutionInfo>"
  "moveit_task_constructor_msgs/TrajectoryExecutionInfo")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TrajectoryExecutionInfo)))
  "Returns string type for a message object of type 'TrajectoryExecutionInfo"
  "moveit_task_constructor_msgs/TrajectoryExecutionInfo")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TrajectoryExecutionInfo>)))
  "Returns md5sum for a message object of type '<TrajectoryExecutionInfo>"
  "e1a83c75a8827f8b45cef6766d0a9ba3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TrajectoryExecutionInfo)))
  "Returns md5sum for a message object of type 'TrajectoryExecutionInfo"
  "e1a83c75a8827f8b45cef6766d0a9ba3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TrajectoryExecutionInfo>)))
  "Returns full string definition for message of type '<TrajectoryExecutionInfo>"
  (cl:format cl:nil "# List of controllers to use when executing the trajectory~%string[] controller_names~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TrajectoryExecutionInfo)))
  "Returns full string definition for message of type 'TrajectoryExecutionInfo"
  (cl:format cl:nil "# List of controllers to use when executing the trajectory~%string[] controller_names~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TrajectoryExecutionInfo>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'controller_names) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TrajectoryExecutionInfo>))
  "Converts a ROS message object to a list"
  (cl:list 'TrajectoryExecutionInfo
    (cl:cons ':controller_names (controller_names msg))
))
