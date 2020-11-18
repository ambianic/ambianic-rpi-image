#!/bin/bash -e

#
# Start docker to verify install
#

set +exu

on_chroot << EOF
# set bash flags: e - fail on unset vars, x - verbose, u - fail quick 
set +exu

echo "Executing in chroot space: ${ROOTFS_DIR}"

INSTALLDIR="/opt/ambianic"
echo "\$INSTALLDIR"
mkdir -p "\$INSTALLDIR"
BRANCH=rpi-image

sudo true

if ! type "git" > /dev/null; then
    sudo apt update -q && sudo apt install git -y
fi

echo "Installing Ambianic.ai in \$INSTALLDIR"

# Tweaks to enable docker to run within [github action > chroot > qemu] sandbox
# cgroups fix for docker
# sudo apt install cgroupfs-mount
# sudo cgroupfs-mount
# iptables fix for docker
# sudo iptables -V
# sudo iptables-legacy -V
# sudo update-alternatives --set iptables /usr/sbin/iptables-legacy
# sudo update-alternatives --set ip6tables /usr/sbin/ip6tables-legacy
# sudo update-alternatives --set arptables /usr/sbin/arptables-legacy
# sudo update-alternatives --set ebtables /usr/sbin/ebtables-legacy
# sudo iptables-legacy -V
# sudo iptables -V
# sudo modprobe ip_tables
# sudo echo 'ip_tables' >> /etc/modules


# clean install using ambianic quickstart scripts
echo "Installing in \$INSTALLDIR"
git clone -b "\$BRANCH" "https://github.com/ambianic/ambianic-quickstart.git" "\$INSTALLDIR"
sh "\$INSTALLDIR/scripts/setup.sh"



# start docker daemon
# sudo dockerd -H unix:///var/run/docker.sock
# Unable to run docker in github action > chroot > qemu environment 
# docker version
# docker info
# docker run hello-world

EOF
