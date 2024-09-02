#!/bin/bash

#export NGC_CONTAINER_IMAGE_PATH="nvcr.io/nvidia/clara-holoscan/holoscan:v2.3.0-dgpu"
export NGC_CONTAINER_IMAGE_PATH="holoscan-custom"

xhost +local:docker

docker run -it --rm --net host \
  --runtime=nvidia \
  --ipc=host --cap-add=CAP_SYS_PTRACE --ulimit memlock=-1 --ulimit stack=67108864 \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v /data/develop/holoscan:/workspace \
  -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY \
  --user 1000:1000 -v /etc/passwd:/etc/passwd:ro -v /etc/group:/etc/group:ro \
  ${NGC_CONTAINER_IMAGE_PATH}

