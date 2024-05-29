execute_process(COMMAND "/home/rajtagore/rgp2_ws/build/moveit_task_constructor_core/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/rajtagore/rgp2_ws/build/moveit_task_constructor_core/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
