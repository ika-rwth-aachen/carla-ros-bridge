apt-get install --no-install-recommends-y \
    libpng16-16 \
    libtiff6 \
    libjpeg8 \
    build-essential \
    wget \
    git \
    libxerces-c-dev \
    python3-pip 

# Ensure libtiff5 compatibility for CARLA on Ubuntu 24.04
if ! ldconfig -p | grep -q "libtiff.so.5"; then
    command -v apt-get >/dev/null 2>&1 && apt-get update && apt-get install -y libtiff5 && ldconfig
    if ! ldconfig -p | grep -q "libtiff.so.5"; then
        if [ -f /usr/lib/x86_64-linux-gnu/libtiff.so.6 ] && [ ! -e /usr/lib/x86_64-linux-gnu/libtiff.so.5 ]; then
            ln -sf /usr/lib/x86_64-linux-gnu/libtiff.so.6 /usr/lib/x86_64-linux-gnu/libtiff.so.5
            ldconfig
        else
            echo "Unable to provide libtiff.so.5 compatibility" >&2
            exit 1
        fi
    fi
fi

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
