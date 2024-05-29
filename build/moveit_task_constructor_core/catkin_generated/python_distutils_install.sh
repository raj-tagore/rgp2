#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/rajtagore/rgp2_ws/src/moveit_task_constructor/core"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/rajtagore/rgp2_ws/install/lib/python3/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/rajtagore/rgp2_ws/install/lib/python3/dist-packages:/home/rajtagore/rgp2_ws/build/moveit_task_constructor_core/lib/python3/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/rajtagore/rgp2_ws/build/moveit_task_constructor_core" \
    "/usr/bin/python3" \
    "/home/rajtagore/rgp2_ws/src/moveit_task_constructor/core/setup.py" \
    egg_info --egg-base /home/rajtagore/rgp2_ws/build/moveit_task_constructor_core \
    build --build-base "/home/rajtagore/rgp2_ws/build/moveit_task_constructor_core" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/home/rajtagore/rgp2_ws/install" --install-scripts="/home/rajtagore/rgp2_ws/install/bin"