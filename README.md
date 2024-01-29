# Communication Actor: *carla-ros-bridge*

<p align="left">
  <img src="https://img.shields.io/github/v/release/carla-compose/carla-ros-bridge"/>
  <img src="https://img.shields.io/github/license/carla-compose/carla-ros-bridge"/>
  <a href="https://github.com/carla-compose/carla-ros-bridge/actions/workflows/docker.yml">
  <img src="https://github.com/carla-compose/carla-ros-bridge/actions/workflows/docker.yml/badge.svg"/></a>
  <img src="https://img.shields.io/badge/ROS 2-humble-blueviolet"/>
  <img src="https://img.shields.io/badge/Python-3.10-blueviolet"/>
  <img src="https://img.shields.io/github/stars/carla-compose/carla-ros-bridge?style=social"/>
</p>

> [!IMPORTANT]
> This repository is a minimal fork of the official [ros-bridge](https://github.com/carla-simulator/ros-bridge)! All modifications to the original repository are documented in [FEATURES.md](./FEATURES.md).

> [!TIP]
> We recommend to use the *carla-ros-bridge* as **communication actor** in our open, modular and scalable simulation framework <a href="https://github.com/ika-rwth-aachen/carlos">**CARLOS**. <img src="https://img.shields.io/github/stars/ika-rwth-aachen/carlos?style=social"/></a> 
>
> Here, it is the component that facilitates the powerful combination of CARLA and ROS. The component retrieves data from the simulation to publish it over ROS topics while simultaneously listening on different topics for requested actions, which are translated to commands to be executed in CARLA. It does this by using both the ROS communication standard DDS, as well as RPC via the CARLA Python API, in tandem, effectively bridging the two. Here, [docker-ros](https://github.com/ika-rwth-aachen/docker-ros) enables a continual building of container images with recent versions of ROS, Python, and Ubuntu. 

> [!TIP]
> Please also have look to the ROS specific [README](./docker/README.md) giving detailed insights about available ROS nodes, topics and services but also useful information about the containerization.

> [!NOTE]
> We set up a Continous Integration (CI) pipeline as [GitHub action](./github/workflows/docker.yml) to continously build Docker images for the `carla-ros-bridge`, publicly available on [Docker Hub](https://hub.docker.com/r/rwthika/carla-ros-bridge).

---
---
## Original README

[![Actions Status](https://github.com/carla-simulator/ros-bridge/workflows/CI/badge.svg)](https://github.com/carla-simulator/ros-bridge)
[![Documentation](https://readthedocs.org/projects/carla/badge/?version=latest)](http://carla.readthedocs.io)
[![GitHub](https://img.shields.io/github/license/carla-simulator/ros-bridge)](https://github.com/carla-simulator/ros-bridge/blob/master/LICENSE)
[![GitHub release (latest by date)](https://img.shields.io/github/v/release/carla-simulator/ros-bridge)](https://github.com/carla-simulator/ros-bridge/releases/latest)

 This ROS package is a bridge that enables two-way communication between ROS and CARLA. The information from the CARLA server is translated to ROS topics. In the same way, the messages sent between nodes in ROS get translated to commands to be applied in CARLA.

![rviz setup](./docs/images/ad_demo.png "AD Demo")

**This version requires CARLA 0.9.13**

## Features

- Provide Sensor Data (Lidar, Semantic lidar, Cameras (depth, segmentation, rgb, dvs), GNSS, Radar, IMU)
- Provide Object Data (Transforms (via [tf](http://wiki.ros.org/tf)), Traffic light status, Visualization markers, Collision, Lane invasion)
- Control AD Agents (Steer/Throttle/Brake)
- Control CARLA (Play/pause simulation, Set simulation parameters)

## Getting started and documentation

Installation instructions and further documentation of the ROS bridge and additional packages are found [__here__](https://carla.readthedocs.io/projects/ros-bridge/en/latest/).
