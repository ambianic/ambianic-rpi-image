#!/bin/bash -e 

#
# Install docker engine and ambianic edge images
#

# Switch to the Raspberry OS image space and run the following script in it
on_chroot << EOF
# set bash flags: e - fail on unset vars, x - verbose, u - fail quick 
set -exu

echo "Executing in chroot space: ${ROOTFS_DIR}"

# set the user name that will have access priviledge to docker
FIRST_USER_NAME="${FIRST_USER_NAME}"

INSTALLDIR="/opt/ambianic"
echo "\$INSTALLDIR"
mkdir -p "\$INSTALLDIR"
BRANCH=master
sudo true
if ! type "git" > /dev/null; then
    sudo apt update -q && sudo apt install git -y
fi
echo "Installing Ambianic.ai in \$INSTALLDIR"
# clean install using ambianic quickstart scripts
echo "Installing in \$INSTALLDIR"
git clone -b "\$BRANCH" "https://github.com/ambianic/ambianic-quickstart.git" "\$INSTALLDIR"
sh "\$INSTALLDIR/scripts/setup.sh"

# grant ambianic user access to data files
# create data dir if it doesn't exist yet
mkdir -p "\$INSTALLDIR/data"
# set user owner and permission settings on data file
install -d -m 0755 -o "\$FIRST_USER_NAME" "\$INSTALLDIR/data"

EOF

