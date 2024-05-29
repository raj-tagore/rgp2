#!/bin/bash

# Function to kill all background processes when the script exits
cleanup() {
    echo "Cleaning up..."
    kill $(jobs -p)
    exit
}

# Trap SIGINT (Ctrl+C) and SIGTERM; call cleanup function
trap cleanup SIGINT SIGTERM EXIT

# Start the robot launch in the background
roslaunch arm_gazebo arm_panda.launch world:=$(rospack find arm_gazebo)/worlds/arm_empty.world x:=-0.10 y:=0 z:=0.615 &
PID_ROBOT_LAUNCH=$!

# Delay to allow the robot launch to initialize
sleep 15

# Start moveit in the background
roslaunch panda_moveit_config demo.launch load_robot_description:=false moveit_controller_manager:=simple use_rviz:=true &
PID_MOVEIT_LAUNCH=$!

# Delay to allow moveit to initialize
sleep 5

# Run the scripts in the background
(roscd arm_gazebo/scripts && python gazebo_objects.py -a ../config/ARM0.txt) &
PID_SCRIPTS=$!

# Wait indefinitely until a signal is caught
wait
