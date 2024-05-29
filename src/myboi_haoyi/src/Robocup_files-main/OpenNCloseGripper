#!/usr/bin/env python
#THIS WORK IN BOTH ROBOCUP AND MOVIT PANDA!!!
import rospy
import actionlib
from control_msgs.msg import GripperCommandAction, GripperCommandGoal

def gripper_client(width, effort):
    # Create an action client
    client = actionlib.SimpleActionClient('/franka_gripper/gripper_action', GripperCommandAction)
    client.wait_for_server()

    # Create and send the goal
    goal = GripperCommandGoal()
    goal.command.position = width  # The target width for the gripper
    goal.command.max_effort = effort  # The maximum effort the gripper should exert
    client.send_goal(goal)
    client.wait_for_result()

    return client.get_result()

if __name__ == '__main__':
    try:
        rospy.init_node('gripper_action_client')

        # Define the width and effort
        #max width is 0.04
        target_width = 0.04 # Change this to the desired gripper width (in meters)
        max_effort = 60  # Change this to the desired maximum effort (in Newtons)

        # Call the gripper client with the desired width and effort
        print("Setting gripper width to:", target_width)
        result = gripper_client(target_width, max_effort)
        print("Result:", result)

    except rospy.ROSInterruptException:
        print("Program interrupted before completion")
