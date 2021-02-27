#!/bin/bash

#helper script to quickly setup a new build directory
#only use it in the root

#pull sources from git and make work dir
git clone -b dunfell git://git.yoctoproject.org/poky.git
git clone -b dunfell git://git.openembedded.org/meta-openembedded
git clone -b dunfell git://git.yoctoproject.org/meta-raspberrypi
git clone -b dunfell git://git.yoctoproject.org/meta-security
git clone -b master https://github.com/pGlase/meta-pascal.git
. poky/oe-init-build-env rpi-build
#sourcing cds to $(pwd)/rpi-build!

#copy default conf and setup of this pc
cd ..
mkdir -p rpi-build/conf
cp $(pwd)/config/bblayers.conf $(pwd)/rpi-build/conf
sed -i 's?<YOCTO_PATH>?'`pwd`'?' $(pwd)/rpi-build/conf/bblayers.conf
cp $(pwd)/config/local.conf $(pwd)/rpi-build/conf
cd rpi-build
