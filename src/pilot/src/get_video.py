#!/usr/bin/env python

import rospy
from sensor_msgs.msg import Image
import cv2
from cv_bridge import CvBridge

def image_callback(msg):
    bridge = CvBridge()
    cv_image = bridge.imgmsg_to_cv2(msg, desired_encoding='bgr8')
    cv2.imshow("Video Feed", cv_image)
    cv2.waitKey(1)

def main():
    rospy.init_node('video_subscriber_node')
    rospy.Subscriber("camera/rgb/image_raw", Image, image_callback)
    rospy.spin()

if __name__ == '__main__':
    main()