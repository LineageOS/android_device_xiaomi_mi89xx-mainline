#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

TARGET_DEVICE_PATH := device/xiaomi/mi89xx-mainline/mi8953_a

# Inherit options from mainline/qcom-common
## SoC
TARGET_QCOM_SOC_FAMILY := msm8953
## TODO: Bringup the corresponding hardware and remove the following definitions
TARGET_SUPPORTS_SUSPEND := false
include device/mainline/qcom-common/optional/options.mk

# Inherit from parent
## A/B
AB_OTA_UPDATER := false
$(call inherit-product, device/xiaomi/mi89xx-mainline/device.mk)

# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

# Dalvik heap
$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)

# Init
PRODUCT_COPY_FILES += \
    $(TARGET_DEVICE_PATH)/fstab/fstab.mi8953_a:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.mi8953_a \
    $(TARGET_DEVICE_PATH)/init/init.mi8953_a.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.mi8953_a.rc

ifneq ($(MI8953_USE_ANDROID_COMMON_KERNEL),true)
PRODUCT_PACKAGES += \
    kernel_mainline_configs_init_pristine-mainline-support
endif

# Ramdisk
PRODUCT_COPY_FILES += \
    $(TARGET_DEVICE_PATH)/fstab/fstab.mi8953_a:$(TARGET_COPY_OUT_RAMDISK)/fstab.mi8953_a

# Recovery
PRODUCT_COPY_FILES += \
    $(TARGET_DEVICE_PATH)/init/init.recovery.mi8953_a.rc:$(TARGET_COPY_OUT_RECOVERY)/root/init.recovery.mi8953_a.rc

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    kernel/mainline/configs
