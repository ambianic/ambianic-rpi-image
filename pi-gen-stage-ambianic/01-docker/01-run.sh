#!/bin/bash -e 

#
# Install docker engine and ambianic edge images
#

# make cpuinfo visible to docker within chroot
set +exu
echo "CPU Info: /proc/cpuinfo"
cat /proc/cpuinfo
# make cpuinfo visible to chroot processes
# mount -o bind /proc "${ROOTFS_DIR}/proc"

# Switch to the Raspberry OS image space and run the following script in it
on_chroot << EOF
# set bash flags: e - fail on unset vars, x - verbose, u - fail quick 
echo "Executing in chroot space: ${ROOTFS_DIR}"

echo "CPU Info: /proc/cpuinfo"
cat /proc/cpuinfo

set -exu 
INSTALLDIR="/opt/ambianic"
echo "\$INSTALLDIR"
mkdir -p "\$INSTALLDIR"
BRANCH=master

sudo true

if ! type "git" > /dev/null; then
    sudo apt update -q && sudo apt install git -y
fi

echo "Installing Ambianic.ai in \$INSTALLDIR"

# clean install
echo "Installing in \$INSTALLDIR"
# git clone -b "\$BRANCH" "https://github.com/ambianic/ambianic-quickstart.git" "\$INSTALLDIR"
# sh "\$INSTALLDIR/scripts/setup.sh"

# Install docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
# can't use systemctl in chroot
# sudo systemctl start docker
# start docker daemon
sudo apt install cgroupfs-mount
sudo cgroupfs-mount
sudo dockerd -H unix:///var/run/docker.sock

docker version
docker info
docker run hello-world

EOF

