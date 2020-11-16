#!/bin/bash -e 

#
# Install docker engine and ambianic edge images
#

# Switch to the Raspberry OS image space and run the following script in it
on_chroot << EOF
# set bash flags: e - fail on unset vars, x - verbose, u - fail quick 
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
docker version
docker info
docker run hello-world

EOF

