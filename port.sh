#!/bin/bash

#Define rom source
source="/mnt/500/dev/samsung/superrs-kitchen_free/superr_m30s"

#define rom destination
dest="/mnt/500/dev/samsung/superrs-kitchen_free/superr_a51"

echo script to port rom for m30s from A515f!

#set this if you want to use custom boot.img
bootimgloc="/mnt/500/dev/samsung/superrs-kitchen_free"

# Remove encryption
sed -i 's/fileencryption=ice,//' $source/vendor/etc/fstab.exynos9611

# Copy Configs
cp $source/vendor/etc/fstab.exynos9611 $dest/vendor/etc/ 
cp $source/vendor/etc/init/init.exynos9611.usb.rc $dest/vendor/etc/init/
cp $source/vendor/etc/init/init.exynos9611.rc $dest/vendor/etc/init/
cp $source/vendor/etc/init/init.recovery.exynos9611.rc $dest/vendor/etc/init/

# Copy Wifi Firmware and configs
cp -Rf $source/vendor/etc/wifi $dest/vendor/etc/ 

# Copy entire firmware
cp -Rf $source/vendor/firmware $dest/vendor/

#Copy neccessary libs
cp $source/vendor/lib/hw/gralloc.exynos9611.so $dest/vendor/lib/hw/ 
cp $source/vendor/lib/hw/libGrallocWrapper.so $dest/vendor/lib/hw/
cp $source/vendor/lib/hw/hwcomposer.exynos9611.so $dest/vendor/lib/hw/
cp $source/vendor/lib/hw/memtrack.exynos9611.so $dest/vendor/lib/hw/

cp $bootimgloc/boot.img $dest/


echo Ported! Please zip it up and test it, if libs missing in logs it can be added in the libs section
