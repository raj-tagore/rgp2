#!/usr/bin/env python

import rospy
from sensor_msgs.msg import PointCloud2
import sensor_msgs.point_cloud2 as pc2
import open3d as o3d
import numpy as np

def pointcloud2_to_array(msg):
    # Convert PointCloud2 to array
    point_list = []
    for point in pc2.read_points(msg, skip_nans=True, field_names=("x", "y", "z")):
        point_list.append(point)
    return np.array(point_list)

def visualize_point_cloud(points):
    # Convert numpy array to Open3D point cloud
    pcd = o3d.geometry.PointCloud()
    pcd.points = o3d.utility.Vector3dVector(points)
    
    # Visualize the point cloud
    o3d.visualization.draw_geometries([pcd])

def point_cloud_callback(msg):
    # Convert the ROS PointCloud2 message to a numpy array
    points = pointcloud2_to_array(msg)
    
    # Visualize the point cloud
    visualize_point_cloud(points)
    #print(points.shape)

if __name__ == '__main__':
    rospy.init_node('pointcloud_visualizer', anonymous=True)
    rospy.Subscriber("/camera/depth/points", PointCloud2, point_cloud_callback)
    rospy.spin()
