#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

TARGET_DEVICE_PATH := device/xiaomi/mi89xx-mainline/mi89x7

# Inherit options from mainline/qcom-common
TARGET_HAS_IR := true
TARGET_QCOM_SOC_FAMILY := msm8937
## TODO: Bringup the corresponding hardware and remove the following definitions
TARGET_SUPPORTS_SUSPEND := false
include device/mainline/qcom-common/optional/options.mk

# Inherit from parent
$(call inherit-product, device/xiaomi/mi89xx-mainline/device.mk)

# Audio
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*.xml,$(TARGET_DEVICE_PATH)/audio/,$(TARGET_COPY_OUT_VENDOR)/etc/)

# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

# Dalvik heap
$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)

# Firmware
PRODUCT_PACKAGES += \
    all_symlink_firmware_mi89x7

# Init
PRODUCT_COPY_FILES += \
    $(TARGET_DEVICE_PATH)/fstab/fstab.mi89x7:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.mi89x7 \
    $(TARGET_DEVICE_PATH)/init/init.mi89x7.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.mi89x7.rc \
    $(TARGET_DEVICE_PATH)/init/ueventd.mi89x7.rc:$(TARGET_COPY_OUT_VENDOR)/etc/ueventd.mi89x7.rc

PRODUCT_PACKAGES += \
    zram.rc

# Input
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*.kl,$(TARGET_DEVICE_PATH)/input/,$(TARGET_COPY_OUT_ODM)/usr/keylayout/)

# Kernel
PRODUCT_COPY_FILES += \
    $(TARGET_DEVICE_PATH)/modprobe/modules.load.normal:$(TARGET_COPY_OUT_VENDOR)/etc/modules.load.normal

# Overlay
DEVICE_PACKAGE_OVERLAYS += \
    $(TARGET_DEVICE_PATH)/overlays/overlay

PRODUCT_PACKAGES += \
    AodDefaultOnOverlay

# Ramdisk
PRODUCT_COPY_FILES += \
    $(TARGET_DEVICE_PATH)/fstab/fstab.mi89x7:$(TARGET_COPY_OUT_RAMDISK)/fstab.mi89x7

# Recovery
PRODUCT_COPY_FILES += \
    $(TARGET_DEVICE_PATH)/init/init.recovery.mi89x7.rc:$(TARGET_COPY_OUT_RECOVERY)/root/init.recovery.mi89x7.rc

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(TARGET_DEVICE_PATH) \
    kernel/mainline/configs
