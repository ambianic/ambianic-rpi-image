#!/bin/bash -e

#
# Install default config files on target image
#

# Setup docker-compose config for boot service 
install -m 644 files/docker-compose-app.service "${ROOTFS_DIR}/etc/systemd/system/docker-compose-app.service"

# enable docker compose on boot
systemctl enable docker-compose-app
