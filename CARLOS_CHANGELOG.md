## Latest : v0.9.16

## v0.9.16 – Update to CARLA 0.9.16

### Major changes

*   Update to CARLA 0.9.16 (synchronize internal `CARLA_VERSION`)
*   Switch default Docker base image to ROS 2 Jazzy in CI builds

### Minor changes

*   Pin PythonAPI artifact download to CARLA v0.9.16 for reproducible builds
*   Bump `actions/checkout` to v5
*   Upgrade Docker pipeline to `ika-rwth-aachen/docker-ros@v1.8.1`
*   Small CI and workflow cleanups related to the version update

## v0.9.15 – Initial Release

### Major changes

*   Created GitHub workflow to automatically build Docker images using [docker-ros](https://github.com/ika-rwth-aachen/docker-ros) (supports ROS 2 Humble distribution)
*   Update to [CARLA 0.9.15](https://carla.org/2023/11/10/release-0.9.15/)
*   Update to Ubuntu 22.04 and Python 3.10 including corresponding pip versions

### Minor changes

*   Small fixes related to version updates
*   Move original Docker related content to `docker_original_folder/`
