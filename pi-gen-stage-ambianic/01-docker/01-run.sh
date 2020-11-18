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

set -x
# set -eu
INSTALLDIR="/opt/ambianic"
echo "\$INSTALLDIR"
mkdir -p "\$INSTALLDIR"
BRANCH=master

sudo true

if ! type "git" > /dev/null; then
    sudo apt update -q && sudo apt install git -y
fi

echo "Installing Ambianic.ai in \$INSTALLDIR"

# Tweaks to enable docker to run within [github action > chroot > qemu] sandbox
# cgroups fix for docker
sudo apt install cgroupfs-mount
sudo cgroupfs-mount
# iptables fix for docker
# sudo iptables -V
sudo iptables-legacy -V
sudo update-alternatives --set iptables /usr/sbin/iptables-legacy
sudo update-alternatives --set ip6tables /usr/sbin/ip6tables-legacy
# sudo update-alternatives --set arptables /usr/sbin/arptables-legacy
# sudo update-alternatives --set ebtables /usr/sbin/ebtables-legacy
sudo iptables-legacy -V
sudo iptables -V

# clean install using ambianic quickstart scripts
echo "Installing in \$INSTALLDIR"
# git clone -b "\$BRANCH" "https://github.com/ambianic/ambianic-quickstart.git" "\$INSTALLDIR"
# sh "\$INSTALLDIR/scripts/setup.sh"

# Install docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
# echo "\$USER"
# enable current user to run docker
# sudo usermod -aG docker "\${USER}"
# enable docker on boot
sudo systemctl enable docker

# can't use systemctl in chroot
# sudo systemctl start docker
# start docker daemon
# sudo dockerd -H unix:///var/run/docker.sock
# Unable to run docker in github action > chroot > qemu environment 
# docker version
# docker info
#docker run hello-world
 
EOF

