#!/bin/bash -e 

#
# Install docker engine and ambianic edge images
#

# Switch to the Raspberry OS image space and run the following script in it
on_chroot << EOF

INSTALLDIR=/opt/ambianic
BRANCH=master
TMPDIR=$(dirname $(mktemp tmp.XXXXXXXXXX -ut))

sudo true

if ! type "git" > /dev/null; then
    sudo apt update -q && sudo apt install git -y
fi

echo "Installing Ambianic.ai in $INSTALLDIR"

# clean install
echo "Installing in $INSTALLDIR"
git clone -b $BRANCH https://github.com/ambianic/ambianic-quickstart.git $TMPDIR/ambianic
sudo mv $TMPDIR/ambianic $INSTALLDIR
sh $INSTALLDIR/scripts/setup.sh

EOF

