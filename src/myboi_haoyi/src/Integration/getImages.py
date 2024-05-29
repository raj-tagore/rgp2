# image_collector.py
import rospy
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError
import cv2
import numpy as np

def get_images():
    rospy.init_node('image_collector_node', anonymous=True, disable_signals=True)
    bridge = CvBridge()

    rgb_image_msg = rospy.wait_for_message("/camera/rgb/image_raw", Image)
    try:
        I_rgb = bridge.imgmsg_to_cv2(rgb_image_msg, "bgr8")
    except CvBridgeError as e:
        print(e)
        I_rgb = None

    depth_image_msg = rospy.wait_for_message("/camera/depth/image_raw", Image)
    try:
        I_depth = bridge.imgmsg_to_cv2(depth_image_msg, "passthrough")
    except CvBridgeError as e:
        print(e)
        I_depth = None

    return I_rgb, I_depth

