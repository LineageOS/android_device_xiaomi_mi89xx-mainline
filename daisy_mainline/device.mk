#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

TARGET_DEVICE_PATH := device/xiaomi/mi89xx-mainline/daisy_mainline

# Inherit options from mainline/qcom-common
## A/B
AB_OTA_UPDATER := true
## SoC
TARGET_QCOM_SOC := msm8953
## TODO: Bringup the corresponding hardware and remove the following definitions
TARGET_SUPPORTS_SUSPEND := false
include device/mainline/qcom-common/optional/options.mk

# Inherit from parent
$(call inherit-product, device/xiaomi/mi89xx-mainline/device.mk)

# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

# Dalvik heap - TODO
$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)

# Init
PRODUCT_COPY_FILES += \
    $(TARGET_DEVICE_PATH)/fstab/fstab.daisy:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.daisy \
    $(TARGET_DEVICE_PATH)/init/init.daisy.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.daisy.rc

PRODUCT_PACKAGES += \
    kernel_mainline_configs_init_pristine-mainline-support

# Ramdisk
PRODUCT_COPY_FILES += \
    $(TARGET_DEVICE_PATH)/fstab/fstab.daisy:$(TARGET_COPY_OUT_RECOVERY)/root/first_stage_ramdisk/fstab.daisy

# Recovery
PRODUCT_COPY_FILES += \
    $(TARGET_DEVICE_PATH)/init/init.recovery.daisy.rc:$(TARGET_COPY_OUT_RECOVERY)/root/init.recovery.daisy.rc

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    kernel/mainline/configs
