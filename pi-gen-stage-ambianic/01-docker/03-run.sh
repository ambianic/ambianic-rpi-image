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

# clean install using ambianic quickstart scripts
echo "Installing in \$INSTALLDIR"
git clone -b "\$BRANCH" "https://github.com/ambianic/ambianic-quickstart.git" "\$INSTALLDIR"
sh "\$INSTALLDIR/scripts/setup.sh"

EOF
