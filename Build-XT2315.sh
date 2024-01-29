#!/bin/bash

APP_NAME="TWRP - XT2315" 

# Print Rom Name To Terminal
echo -ne "\033]0;$APP_NAME\007"

## SHRP
#############################
export USE_CCACHE=1
. build/envsetup.sh
m clean
lunch twrp_yume-eng
mka adbd recoveryimage
echo
echo " Recovery Should Be Built"
echo ""
mv $OUT/recovery.img ~/Desktop/TWRP-12.1-Stylus_5G_2023-XT2315.img
m clean
read
#############################
#############################

