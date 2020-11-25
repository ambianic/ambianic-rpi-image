#!/bin/bash -e 

#
# Enable picam access for docker and ambianic user
#

# Switch to the Raspberry OS image space and run the following script in it
on_chroot << EOF
# set bash flags: e - fail on unset vars, x - verbose, u - fail quick 
set -exu
# grant all users accesss to video group
# See more here: https://www.losant.com/blog/how-to-access-the-raspberry-pi-camera-in-docker
sudo install -m 644 -o "$FIRST_USER_NAME" -g "$FIRST_USER_NAME" "files/99-camera.rules" "/etc/udev/rules.d/99-camera.rules"
EOF

