#!/usr/bin/env python

import rospy
from sensor_msgs.msg import Image
from sensor_msgs.msg import PointCloud2
import sensor_msgs.point_cloud2 as pc2
from std_msgs.msg import Float32MultiArray
import numpy as np


class World:
    def __init__(self):
        self.image = None
        self.depth = None
        self.tfx = None
        inx = [554.3827128226441, 0.0, 320.5, 0.0, 554.3827128226441, 240.5, 0.0, 0.0, 1.0]
        self.inx = np.array(inx).reshape(3, 3)
        
    def get_tfx(self, msg):
        inv_tfx = msg.reshape(4, 4)
        self.tfx = np.linalg.inv(inv_tfx)
        
    def get_image(self, msg):
        self.image = msg
        
    def get_depth(self, msg):
        depth_points = []
        
        
    def 
    
if __name__ == '__main__':
    
    world = World()
    
    rospy.init_node('rgp2_build_world')
    T_sub = rospy.Subscriber('rgp2/camera_transform', Float32MultiArray, world.get_tfx)
    C_sub = rospy.Subscriber('camera/rgb/image_raw', Image, world.get_image)
    D_sub = rospy.Subscriber('camera/depth/points', PointCloud2, world.get_depth)
    
    rospy.spin()
    
        