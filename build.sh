#!/bin/bash

#helper script to quickly setup a new build directory
#only use it in the root

#pull sources from git and make work dir
git clone -b zeus git://git.yoctoproject.org/poky.git
git clone -b zeus git://git.openembedded.org/meta-openembedded
git clone -b zeus https://github.com/agherzan/meta-raspberrypi.git
. poky/oe-init-build-env rpi-build

#copy default conf and setup of this pc
mkdir -p $(pwd)/rpi-build/conf
cp config/bblayers.conf rpi-build/conf
sed -i 's?<YOCTO_PATH>?'`pwd`'?' rpi-build/conf/bblayers.conf
cp config/local.conf rpi-build/conf

