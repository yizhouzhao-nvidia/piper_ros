FROM osrf/ros:humble-desktop-full
# install ros package

RUN apt-get update && apt-get install -y \
      ethtool \
      can-utils \
      net-tools \
      iproute2 \
      python3-pip \
      python3-rosdep \
      python3-colcon-common-extensions \
      # ros-${ROS_DISTRO}-demo-nodes-cpp \
      # ros-${ROS_DISTRO}-demo-nodes-py \
      ros-${ROS_DISTRO}-ros2-control \
      ros-${ROS_DISTRO}-ros2-controllers \
      ros-${ROS_DISTRO}-controller-manager \
      ros-${ROS_DISTRO}-joint-state-publisher-gui \
      ros-${ROS_DISTRO}-robot-state-publisher \
      ros-${ROS_DISTRO}-xacro 
    
RUN rm -rf /var/lib/apt/lists/* && \
    which ifconfig || echo "ifconfig not found" && \
    dpkg -l | grep net-tools

# Install Python dependencies
# RUN pip3 install --no-cache-dir python-can scipy piper_sdk

# Source ROS in all bash shells
SHELL ["/bin/bash", "-c"]
RUN echo "source /opt/ros/${ROS_DISTRO}/setup.bash" >> ~/.bashrc

# install pip3 files
RUN pip3 install piper_sdk python-can scipy

# # Download uv installer
# RUN apt-get update && apt-get install -y --no-install-recommends curl ca-certificates && \
#     rm -rf /var/lib/apt/lists/*

# ADD https://astral.sh/uv/install.sh /uv-installer.sh

# # Run the installer then remove it
# RUN sh /uv-installer.sh && rm /uv-installer.sh

# # Ensure the installed binary is on the `PATH`
# ENV PATH="/root/.local/bin/:$PATH"

# install moveit
RUN apt-get update && apt-get install -y \
    ros-${ROS_DISTRO}-moveit* \
    ros-${ROS_DISTRO}-control* \
    ros-${ROS_DISTRO}-joint-trajectory-controller \
    ros-${ROS_DISTRO}-joint-state-* \
    ros-${ROS_DISTRO}-gripper-controllers \
    ros-${ROS_DISTRO}-trajectory-msgs 