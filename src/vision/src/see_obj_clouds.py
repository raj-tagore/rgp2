#!/usr/bin/env python

import rospy
from sensor_msgs.msg import PointCloud2
import numpy as np
import sensor_msgs.point_cloud2 as pc2
from vision.msg import ObjCloud
import open3d as o3d

def create_plots():
    
    global obj_list
    
    # Placeholder code
    for i in range(len(obj_list)):
        name, points = obj_list[i]
        points = points.reshape(-1, 3)
        pcd = o3d.geometry.PointCloud()
        pcd.points = o3d.utility.Vector3dVector(points)
        o3d.visualization.draw_geometries([pcd], window_name=name, width=800, height=600)
        
        # Save point cloud to file
        filename = f"{name}.ply"
        o3d.io.write_point_cloud(filename, pcd)

        
    
def process_point_cloud(msg):
    
    global obj_list
    name = msg.name
    size = msg.size
    
    # print(np.array(msg.points).reshape(size).shape)
    
    obj_list.append([name, np.array(msg.points).reshape(size)])
    
    
    if len(obj_list) >= 10:
        
        create_plots()
        rospy.signal_shutdown("All objects have been visualized once.")   
    
    
    
    
if __name__ == '__main__':
    rospy.init_node('see_point_clouds', anonymous=True)
    
    obj_list = []
    
    rospy.Subscriber("/rgp2/obj_clouds", ObjCloud, process_point_cloud)
    rospy.spin()