#!/bin/bash

APP_NAME="OrangeFox - XT2315" 

# Print Rom Name To Terminal
echo -ne "\033]0;$APP_NAME\007"

## OFRP
#############################
export USE_CCACHE=1
. build/envsetup.sh
m clean
lunch twrp_yume-eng
echo ""
echo "Adding Magisk From Device Tree Prebuilt Folder"
cp -r device/motorola/yume/prebuilt/Magisk.zip vendor/recovery/FoxFiles/Magisk.zip
sleep 5
echo ""
mka adbd recoveryimage
echo ""
echo " Recovery Should Be Built"
echo ""
mv $OUT/OrangeFox-*.img ~/Desktop/OrangeFox_12.1-Stylus_5G_2023-XT2315.img
mv $OUT/OrangeFox-*.zip ~/Desktop/OrangeFox_12.1-Stylus_5G_2023-XT2315.zip
m clean
read
#############################
#############################

