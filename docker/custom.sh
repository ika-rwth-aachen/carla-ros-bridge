export DOCKER_ROS_FILES_PATH=/docker-ros/additional-files

# Check if user provided CARLA PythonAPI. If not, exit
mkdir -p /opt/carla
if [ -d "$DOCKER_ROS_FILES_PATH/artifacts/PythonAPI" ]; then
    mv $DOCKER_ROS_FILES_PATH/artifacts/PythonAPI /opt/carla/PythonAPI
else
    echo "CARLA PythonAPI not found in $DOCKER_ROS_FILES_PATH/artifacts/PythonAPI ...Exiting"
    exit 1
fi

# Install the CARLA wheel that matches the current Python minor version
pyver=$(python3 -c "import sys; print(f'{sys.version_info.major}{sys.version_info.minor}')")
wheel=$(echo /opt/carla/PythonAPI/carla/dist/*${pyver}*.whl)
pip install --no-cache-dir "$wheel" --break-system-packages

# Create a script to append necessary paths to PYTHONPATH and make .bashrc source it
echo "export PYTHONPATH=\$PYTHONPATH:/opt/carla/PythonAPI/carla/agents" >> /opt/carla/setup.bash
echo "export PYTHONPATH=\$PYTHONPATH:/opt/carla/PythonAPI/carla" >> /opt/carla/setup.bash
echo "source /opt/carla/setup.bash" >> /root/.bashrc
