#!/bin/bash -e

#
# Install docker-compose
#

# set fail quick, verbose output
set -exu

# install docker-compose
sudo apt install -y libffi-dev libssl-dev  python3 python3-pip
sudo pip3 install docker-compose


# Setup docker-compose as a boot service 
install -m 644 files/docker-compose-app.service "${ROOTFS_DIR}/etc/systemd/system/docker-compose-app.service"

# Install default docker-compose config
install -m 644 files/docker-compose.yaml "${ROOTFS_DIR}/opt/ambianic/docker-compose.yaml"



# enable docker compose on boot
systemctl enable docker-compose-app
