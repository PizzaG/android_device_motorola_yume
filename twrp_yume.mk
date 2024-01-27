#
# Copyright (C) 2024 The Android Open Source Project
# Copyright (C) 2024 SebaUbuntu's TWRP Device Tree Generator
# Copyright (C) 2019-Present A-Team Digital Solutions
# Copyright (C) 2024 sosRR
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

# Inherit some common TWRP/OFox stuff.
$(call inherit-product, vendor/twrp/config/common.mk)

# Inherit from genevn device
$(call inherit-product, device/motorola/yume/device.mk)

PRODUCT_DEVICE := yume
PRODUCT_NAME := twrp_yume
PRODUCT_BRAND := Moto_G
PRODUCT_MODEL := XT2315
PRODUCT_MANUFACTURER := Motorola
PRODUCT_RELEASE_NAME := Moto G Stylus 5G 2023

PRODUCT_GMS_CLIENTID_BASE := android-motorola

PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_PRODUCT=genevn \
    PRIVATE_BUILD_DESC="genevn-user 12 T1TGN33.60-114 7117f-b6786 release-keys"

BUILD_FINGERPRINT := motorola/genevn/genevn:12/T1TGN33.60-114/7117f-b6786:user/release-keys

