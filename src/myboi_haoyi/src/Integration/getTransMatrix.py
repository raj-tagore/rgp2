import rospy
import tf2_ros
import tf2_py as tf2
import numpy as np
from scipy.spatial.transform import Rotation as R


def lookup_transform(tf_buffer, target_frame, source_frame):
    try:
        trans = tf_buffer.lookup_transform(target_frame, source_frame, rospy.Time(0), rospy.Duration(1.0))
        return trans
    except (tf2.LookupException, tf2.ConnectivityException, tf2.ExtrapolationException) as ex:
        rospy.logwarn(ex)
        return None


def transform_to_matrix(transform):
    if transform is None:
        return None

    translation = transform.transform.translation
    rotation = transform.transform.rotation

    # Convert quaternion to rotation matrix
    r = R.from_quat([rotation.x, rotation.y, rotation.z, rotation.w])
    rotation_matrix = r.as_matrix()

    # Translation vector
    translation_vector = np.array([translation.x, translation.y, translation.z])

    # Construct the 4x4 transformation matrix
    transform_matrix = np.eye(4)
    transform_matrix[:3, :3] = rotation_matrix
    transform_matrix[:3, 3] = translation_vector

    return transform_matrix


def get_transformation_matrix(target_frame, source_frame):
    # Only initialize a new ROS node if one hasn't already been initialized
    if not rospy.core.is_initialized():
        rospy.init_node('tf_listener', anonymous=True)

    tf_buffer = tf2_ros.Buffer()
    listener = tf2_ros.TransformListener(tf_buffer)

    transform = lookup_transform(tf_buffer, target_frame, source_frame)
    return transform_to_matrix(transform)