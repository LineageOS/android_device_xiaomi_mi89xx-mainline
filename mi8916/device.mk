#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

TARGET_DEVICE_PATH := device/xiaomi/mi89xx-mainline/mi8916

# Inherit options from mainline/qcom-common
TARGET_QCOM_SOC_FAMILY := msm8916
## TODO: Bringup the corresponding hardware and remove the following definitions
TARGET_AUDIO_HAL := default-aidl
TARGET_SUPPORTS_SUSPEND := false
include device/mainline/qcom-common/optional/options.mk

# Inherit from parent
## A/B
AB_OTA_UPDATER := false
$(call inherit-product, device/xiaomi/mi89xx-mainline/device.mk)

# Boot animation
TARGET_BOOTANIMATION_HALF_RES := true
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

# Dalvik heap
$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)

# Init
PRODUCT_COPY_FILES += \
    $(TARGET_DEVICE_PATH)/fstab/fstab.mi8916:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.mi8916 \
    $(TARGET_DEVICE_PATH)/init/init.mi8916.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.mi8916.rc

PRODUCT_PACKAGES += \
    use_memfd.rc \
    zram.rc

# Partitions
PRODUCT_USE_DYNAMIC_PARTITION_SIZE := true

# Ramdisk
PRODUCT_COPY_FILES += \
    $(TARGET_DEVICE_PATH)/fstab/fstab.mi8916:$(TARGET_COPY_OUT_RAMDISK)/fstab.mi8916

# Recovery
PRODUCT_COPY_FILES += \
    $(TARGET_DEVICE_PATH)/init/init.recovery.mi8916.rc:$(TARGET_COPY_OUT_RECOVERY)/root/init.recovery.mi8916.rc

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    kernel/mainline/configs
