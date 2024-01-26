#
# Copyright (C) 2024 The Android Open Source Project
# Copyright (C) 2024 SebaUbuntu's TWRP device tree generator
# Copyright (C) 2019-Present A-Team Digital Solutions
#

LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),yume)
include $(call all-subdir-makefiles,$(LOCAL_PATH))
endif
