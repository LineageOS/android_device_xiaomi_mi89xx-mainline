#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

TARGET_DEVICE_PATH := device/xiaomi/mi89xx-mainline/mi89x7

# Inherit options from mainline/qcom-common
## SoC
TARGET_QCOM_SOC_FAMILY := msm8937
## TODO: Bringup the corresponding hardware and remove the following definitions
TARGET_GRAPHICS ?= swiftshader
TARGET_SUPPORTS_SUSPEND := false
include device/mainline/qcom-common/optional/options.mk

# Inherit from parent
## A/B
AB_OTA_UPDATER := false
$(call inherit-product, device/xiaomi/mi89xx-mainline/device.mk)

# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

# Dalvik heap
$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)

# Init
PRODUCT_COPY_FILES += \
    $(TARGET_DEVICE_PATH)/fstab/fstab.mi89x7:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.mi89x7 \
    $(TARGET_DEVICE_PATH)/init/init.mi89x7.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.mi89x7.rc

PRODUCT_PACKAGES += \
    kernel_mainline_configs_init_pristine-mainline-support

# Ramdisk
PRODUCT_COPY_FILES += \
    $(TARGET_DEVICE_PATH)/fstab/fstab.mi89x7:$(TARGET_COPY_OUT_RAMDISK)/fstab.mi89x7

# Recovery
PRODUCT_COPY_FILES += \
    $(TARGET_DEVICE_PATH)/init/init.recovery.mi89x7.rc:$(TARGET_COPY_OUT_RECOVERY)/root/init.recovery.mi89x7.rc

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    kernel/mainline/configs
