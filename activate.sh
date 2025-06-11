#!/bin/bash
docker rm -f ros_piper/local:latest
# Get the absolute path of the current directory
DIR=$(pwd)

# Run the ROS Humble container
docker run -it --rm \
    --network host \
    --privileged \
    -v $DIR:$DIR \
    -v /dev:/dev \
    --cap-add=NET_ADMIN \
    --cap-add=SYS_RAWIO \
    ros_piper/local:latest \
    bash -c "chmod +x $DIR/can_activate.sh && cd $DIR && bash"