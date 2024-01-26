# Building

setup build environment for Recovery
add device trees 


. build/envsetup.sh
lunch twrp_yume-eng && m -j$(nproc --all) recoveryimage
```

