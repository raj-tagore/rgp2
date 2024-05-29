import cv2
import numpy as np



# 读取深度图像
I_depth = cv2.imread('depthimg_0315.png', cv2.IMREAD_UNCHANGED)
width, height = 640, 480
I_depth = cv2.resize(I_depth, (width, height), interpolation=cv2.INTER_CUBIC)

# 相机内参
fx = 554.3827128226441  # 焦距x
fy = 554.3827128226441  # 焦距y
cx = 320.5  # 光心x
cy = 240.5  # 光心y
K = np.array([[fx, 0, cx],
              [0, fy, cy],
              [0, 0, 1]])  # 内参矩阵



#new_get_trasformation.transform = lookup_transform(tf_buffer, 'panda_link0', 'camera_depth_link')
RT = np.array([[-2.20616080e-04, - 9.99900282e-01 , 1.41201265e-02,  3.55672214e-01],
 [-9.99999816e-01,  2.28579656e-04 , 5.62376162e-04, - 4.79183502e-06],
[-5.65547656e-04, - 1.41199998e-02, - 9.99900148e-01, 5.91122840e-01],
[0.00000000e+00 , 0.00000000e+00,  0.00000000e+00,  1.00000000e+00]])

RT=np.array( [[-0.00851408 ,-0.99760961 , 0.06857528  ,0.43926995],
 [-0.9261049 ,  0.03373307  ,0.37575497 ,-0.23644773],
 [-0.37717002 ,-0.06030869 ,-0.92417836 , 0.5960467 ],
 [ 0.     ,     0.     ,     0.        ,  1.        ]])


# 像素坐标(u, v)和深度值
u = 216
v = 84

# 如果深度图像是单通道的，直接获取深度值
depth_value = I_depth[v, u,1]

# 如果深度图像有多个通道，确保从正确的通道获取深度值
# depth_value = I_depth[v, u, channel_index]  # 你需要替换 channel_index 为正确的通道索引

# 将深度像素值转换为浮点数
depth_value = depth_value.astype(float)


# 深度缩放因子
#depth_scale = 0.0027  # 假设1像素值对应0.001米

depth_scale_factor1=0.0036
depth_scale_factor2=0.1339
Z =  (depth_value * depth_scale_factor1)+depth_scale_factor2
# 将像素值转换为实际深度



# 将像素坐标(u, v)转换为齐次相机坐标系下的坐标(X, Y, Z, 1)
X = (u - cx) * Z / fx
Y = (v - cy) * Z / fy
point_camera_homogeneous = np.array([X, Y, Z, 1])

# 使用4x4的外参矩阵将相机坐标系下的点转换到世界坐标系下
point_world_homogeneous = RT @ point_camera_homogeneous

# 齐次坐标转换为笛卡尔坐标
point_world = point_world_homogeneous[:3] / point_world_homogeneous[3]

print("（{0},{1}）in world frame (X_w, Y_w, Z_w): {2}".format(u, v, point_world))

#!/usr/bin/env python
#THIS WORK IN ROBOCUP!!!
import rospy
from geometry_msgs.msg import PoseStamped
import tf


def euler_to_quaternion(roll, pitch, yaw):
    # Convert Euler angles (roll, pitch, yaw) to a quaternion
    quaternion = tf.transformations.quaternion_from_euler(roll, pitch, yaw)
    return quaternion


def publish_pose(x, y, z, roll, pitch, yaw):
    # Initialize the ROS node
    rospy.init_node('gripper_pose_publisher', anonymous=True)

    # Create a publisher on the specified topic
    pub = rospy.Publisher('/cartesian_impedance_example_controller/equilibrium_pose', PoseStamped, queue_size=10)

    # Wait until the publisher is connected to subscribers
    rospy.sleep(1)

    # Create the PoseStamped message
    pose_msg = PoseStamped()
    pose_msg.header.stamp = rospy.Time.now()
    pose_msg.header.frame_id = 'panda_link0'

    # Set the position of the gripper
    pose_msg.pose.position.x = x
    pose_msg.pose.position.y = y
    pose_msg.pose.position.z = z

    # Convert Euler angles to quaternion for orientation
    q = euler_to_quaternion(roll, pitch, yaw)
    pose_msg.pose.orientation.x = q[0]
    pose_msg.pose.orientation.y = q[1]
    pose_msg.pose.orientation.z = q[2]
    pose_msg.pose.orientation.w = q[3]

    # Publish the pose
    pub.publish(pose_msg)
    rospy.loginfo("Published gripper pose with Euler angles.")


if __name__ == '__main__':
    # Pose parameters - position
    x = point_world[0]  #0.32     #0.4
    y = point_world[1]     #0.52
    z = point_world[2]  #-0.1

    # Pose parameters - orientation in Euler angles (radians)
    roll = -3.14#-3.14#-3.48#-2.8#-3.1415
    pitch = -0.01 #-0.01 # 90 degrees=1.5708 180 degrees=3.1415
    yaw = 0       #0

    publish_pose(x, y, z, roll, pitch, yaw)
