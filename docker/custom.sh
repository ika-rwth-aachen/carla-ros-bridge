export DOCKER_ROS_FILES_PATH=/docker-ros/additional-files
# Install ROS version dependent apt packages
if [ "$ROS_DISTRO" = "noetic" ]; then
  ADDITIONAL_PACKAGES="ros-$ROS_DISTRO-rviz
  ros-$ROS_DISTRO-opencv-apps
  ros-$ROS_DISTRO-rospy
  ros-$ROS_DISTRO-rospy-message-converter
  ros-$ROS_DISTRO-pcl-ros
  python3-catkin-tools
  python3-catkin-pkg
  python3-catkin-pkg-modules"
else
  ADDITIONAL_PACKAGES="ros-$ROS_DISTRO-rviz2"
fi
apt-get install --no-install-recommends -y $ADDITIONAL_PACKAGES
# Check if user provided CARLA PythonAPI. If not, exit
mkdir -p /opt/carla
if [ -d "$DOCKER_ROS_FILES_PATH/artifacts/PythonAPI" ]; then
    mv $DOCKER_ROS_FILES_PATH/artifacts/PythonAPI /opt/carla/PythonAPI
else
    echo "CARLA PythonAPI not found in $DOCKER_ROS_FILES_PATH/artifacts/PythonAPI ...Exiting"
    exit 1
fi
# Create a script to append necessary paths to PYTHONPATH and make .bashrc source it
echo "export PYTHONPATH=\$PYTHONPATH:/opt/carla/PythonAPI/carla/dist/$(ls /opt/carla/PythonAPI/carla/dist | grep py$PYTHON_VERSION_SHORT.)" >> /opt/carla/setup.bash
echo "export PYTHONPATH=\$PYTHONPATH:/opt/carla/PythonAPI/carla" >> /opt/carla/setup.bash
echo "source /opt/carla/setup.bash" >> /root/.bashrc
