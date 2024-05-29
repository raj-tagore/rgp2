#!/bin/bash

# Start the robot launch in a new terminal
xterm -hold -e "bash -c 'roslaunch arm_gazebo arm_panda.launch world:=$(rospack find arm_gazebo)/worlds/arm_empty.world x:=-0.10 y:=0 z:=0.615'" &

# Delay to allow the previous command to initialize if necessary
sleep 15

# Start moveit in a new terminal
xterm -hold -e "bash -c 'roslaunch panda_moveit_config demo.launch load_robot_description:=false moveit_controller_manager:=simple use_rviz:=true'" &

# Delay to allow the previous command to initialize if necessary
sleep 5

# Run the scripts in another new terminal
xterm -hold -e "bash -c 'cd ~/arm_gazebo/scripts; python gazebo_objects.py -a ../config/ARM0.txt'" &

echo "Commands have been launched in separate terminals."
