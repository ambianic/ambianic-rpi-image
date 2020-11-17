#!/bin/bash -e

#
# Start docker to verify install
#

# set verbose output
set +x

on_chroot << EOF

# set verbose output
set +x

# start docker daemon
sudo dockerd -H unix:///var/run/docker.sock
# Unable to run docker in github action > chroot > qemu environment 
docker version
docker info
docker run hello-world

EOF
