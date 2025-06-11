docker build --network host -t ros_piper/local:latest .
docker run -it --rm --network host ros_piper/local:latest