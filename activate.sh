#!/bin/bash
IMAGE_NAME=ros_piper_desktop/local:latest
docker rm -f $IMAGE_NAME
# Get the absolute path of the current directory
DIR=$(pwd)

# Run the ROS Humble container
xhost + && \
docker run -it --rm \
    --network host \
    --privileged \
    -v $DIR:$DIR \
    -v /dev:/dev \
    --cap-add=NET_ADMIN \
    --cap-add=SYS_RAWIO \
    --env="DISPLAY=$DISPLAY" \
    --env="QT_X11_NO_MITSHM=1" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    $IMAGE_NAME \
    bash -c "chmod +x $DIR/can_activate.sh && cd $DIR && bash"
    # bash -c "source /opt/ros/humble/setup.bash && source $DIR/install/setup.bash && chmod +x $DIR/can_activate.sh && cd $DIR && bash"