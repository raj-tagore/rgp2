; Auto-generated. Do not edit!


(cl:in-package vision-msg)


;//! \htmlinclude ObjPose.msg.html

(cl:defclass <ObjPose> (roslisp-msg-protocol:ros-message)
  ((name
    :reader name
    :initarg :name
    :type cl:string
    :initform "")
   (center
    :reader center
    :initarg :center
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (axis
    :reader axis
    :initarg :axis
    :type cl:string
    :initform ""))
)

(cl:defclass ObjPose (<ObjPose>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ObjPose>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ObjPose)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name vision-msg:<ObjPose> is deprecated: use vision-msg:ObjPose instead.")))

(cl:ensure-generic-function 'name-val :lambda-list '(m))
(cl:defmethod name-val ((m <ObjPose>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vision-msg:name-val is deprecated.  Use vision-msg:name instead.")
  (name m))

(cl:ensure-generic-function 'center-val :lambda-list '(m))
(cl:defmethod center-val ((m <ObjPose>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vision-msg:center-val is deprecated.  Use vision-msg:center instead.")
  (center m))

(cl:ensure-generic-function 'axis-val :lambda-list '(m))
(cl:defmethod axis-val ((m <ObjPose>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vision-msg:axis-val is deprecated.  Use vision-msg:axis instead.")
  (axis m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ObjPose>) ostream)
  "Serializes a message object of type '<ObjPose>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'name))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'center))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'center))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'axis))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'axis))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ObjPose>) istream)
  "Deserializes a message object of type '<ObjPose>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'center) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'center)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'axis) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'axis) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ObjPose>)))
  "Returns string type for a message object of type '<ObjPose>"
  "vision/ObjPose")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ObjPose)))
  "Returns string type for a message object of type 'ObjPose"
  "vision/ObjPose")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ObjPose>)))
  "Returns md5sum for a message object of type '<ObjPose>"
  "72e29f00dd64422822163c74c4f43cc0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ObjPose)))
  "Returns md5sum for a message object of type 'ObjPose"
  "72e29f00dd64422822163c74c4f43cc0")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ObjPose>)))
  "Returns full string definition for message of type '<ObjPose>"
  (cl:format cl:nil "string name~%float32[] center~%string axis~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ObjPose)))
  "Returns full string definition for message of type 'ObjPose"
  (cl:format cl:nil "string name~%float32[] center~%string axis~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ObjPose>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'name))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'center) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4 (cl:length (cl:slot-value msg 'axis))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ObjPose>))
  "Converts a ROS message object to a list"
  (cl:list 'ObjPose
    (cl:cons ':name (name msg))
    (cl:cons ':center (center msg))
    (cl:cons ':axis (axis msg))
))
