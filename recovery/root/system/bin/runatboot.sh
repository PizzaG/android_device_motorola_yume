#!/system/bin/sh

#
# Copyright (C) 2024 The Android Open Source Project
# Copyright (C) 2024 SebaUbuntu's TWRP Device Tree Generator
# Copyright (C) 2019-Present A-Team Digital Solutions
# Copyright (C) 2024 sosRR
#

mount /vendor_dlkm
mount /vendor
modprobe -d /vendor_dlkm/lib/modules /vendor_dlkm/lib/modules/nova_0flash_mmi.ko
modprobe -d /vendor_dlkm/lib/modules /vendor_dlkm/lib/modules/ili9882_mmi.ko
sleep 1
if [ $(cat /sys/class/touchscreen/primary/productinfo) == "NT36672C" ]
then
echo 1 > /sys/class/touchscreen/primary/forcereflash
echo novatek_ts-csot-NT36672C-2302240D-605b-genevn.bin > /sys/class/touchscreen/primary/doreflash
echo "Reflashing firmware..."
echo 0 > /sys/class/touchscreen/primary/forcereflash
fi

is_fastboot=$(getprop init.svc.fastbootd)
if [ "$is_fastboot" != "running" ]; then
        mount /vendor_dlkm
        insmod /vendor_dlkm/lib/modules/leds_aw99703.ko
        insmod /vendor_dlkm/lib/modules/leds-qpnp-flash-v2.ko
        insmod /vendor_dlkm/lib/modules/ili9882_mmi.ko
        insmod /vendor_dlkm/lib/modules/msm_drm.ko
        insmod /vendor_dlkm/lib/modules/mmi_annotate.ko
        insmod /vendor_dlkm/lib/modules/mmi_info.ko
        insmod /vendor_dlkm/lib/modules/mmi_relay.ko
        insmod /vendor_dlkm/lib/modules/mmi_charger.ko
        insmod /vendor_dlkm/lib/modules/mmi_sys_temp.ko
        insmod /vendor_dlkm/lib/modules/moto_f_mass_storage.ko
        insmod /vendor_dlkm/lib/modules/sensors_class.ko
        insmod /vendor_dlkm/lib/modules/touchscreen_mmi.ko
        insmod /vendor_dlkm/lib/modules/stmicro_mmi.ko
        insmod /vendor_dlkm/lib/modules/goodix_brl_mmi.ko
        insmod /vendor_dlkm/lib/modules/sx937x_sar.ko
        insmod /vendor_dlkm/lib/modules/bm_adsp_ulog.ko
        insmod /vendor_dlkm/lib/modules/qti_glink_charger.ko
        insmod /vendor_dlkm/lib/modules/qpnp_adaptive_charge.ko
        insmod /vendor_dlkm/lib/modules/q6_pdr_dlkm.ko
        insmod /vendor_dlkm/lib/modules/q6_notifier_dlkm.ko
        insmod /vendor_dlkm/lib/modules/snd_event_dlkm.ko
        insmod /vendor_dlkm/lib/modules/gpr_dlkm.ko
        insmod /vendor_dlkm/lib/modules/spf_core_dlkm.ko
        insmod /vendor_dlkm/lib/modules/adsp_loader_dlkm.ko
fi

mkdir /firmware
SLOT=$(getprop ro.boot.slot_suffix)
mount /dev/block/bootdevice/by-name/modem$SLOT /firmware -O ro
echo "1" > /proc/sys/kernel/firmware_config/force_sysfs_fallback
echo "1" > /sys/kernel/boot_adsp/boot

sleep 5

# A-Team Custom Patches
mount -o rw /system_root
mount -o rw /system_ext
mount -o rw /product
mount -o rw /vendor

exit 0
