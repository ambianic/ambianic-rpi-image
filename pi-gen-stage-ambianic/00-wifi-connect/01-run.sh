#!/bin/bash -e 

#
# Install balena-io/wifi-connect
#

install -m 644 files/wifi-connect.service "${ROOTFS_DIR}/etc/systemd/system/"
install -m 644 files/wifi-connect-startup "${ROOTFS_DIR}/usr/local/sbin/"

# get latest wifi-connect raspbian-install.sh
# pushd files
# curl -O -L https://github.com/balena-io/wifi-connect/raw/master/scripts/raspbian-install.sh
# chmod +x raspbian-install.sh
# popd

install -m 644 files/raspbian-install.sh "${ROOTFS_DIR}/"
install -m 755 files/log-iface-events.sh "${ROOTFS_DIR}/etc/NetworkManager/dispatcher.d/"

on_chroot << EOF
set -x 
chmod u+x /raspbian-install.sh
sudo /raspbian-install.sh -y
rm -rf /raspbian-install.sh
chmod +x /usr/local/sbin/wifi-connect-startup
systemctl daemon-reload
systemctl enable wifi-connect
systemctl enable NetworkManager
systemctl disable dhcpcd
EOF
