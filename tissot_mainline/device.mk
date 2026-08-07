#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

TARGET_DEVICE_PATH := device/xiaomi/mi89xx-mainline/tissot_mainline

# Inherit options from mainline/qcom-common
AB_OTA_UPDATER := true
TARGET_HAS_IR := true
TARGET_QCOM_SOC := msm8953
TARGET_SENSORS_HAL := iio
## TODO: Bringup the corresponding hardware and remove the following definitions
TARGET_SUPPORTS_SUSPEND := false
include device/mainline/qcom-common/optional/options.mk

# Inherit from parent
$(call inherit-product, device/xiaomi/mi89xx-mainline/device.mk)

# A/B
AB_OTA_POSTINSTALL_CONFIG += \
    FILESYSTEM_TYPE_system=ext4

# AAPT
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Audio
PRODUCT_PACKAGES += \
    audio.tissot_mainline.xml \
    audio.xiaomi-daisy.xml

# Bluetooth
PRODUCT_VENDOR_PROPERTIES += bluetooth.le.disable_apcf_extended_features=0

# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

# Dalvik heap
$(call inherit-product, frameworks/native/build/phone-xhdpi-4096-dalvik-heap.mk)

# Firmware
PRODUCT_COPY_FILES += \
    vendor/xiaomi/msm8953-common/proprietary/vendor/firmware/a506_zap.b00:$(TARGET_COPY_OUT_ODM)/firmware/qcom/msm8953/xiaomi/tissot/a506_zap.b00 \
    vendor/xiaomi/msm8953-common/proprietary/vendor/firmware/a506_zap.b01:$(TARGET_COPY_OUT_ODM)/firmware/qcom/msm8953/xiaomi/tissot/a506_zap.b01 \
    vendor/xiaomi/msm8953-common/proprietary/vendor/firmware/a506_zap.b02:$(TARGET_COPY_OUT_ODM)/firmware/qcom/msm8953/xiaomi/tissot/a506_zap.b02 \
    vendor/xiaomi/msm8953-common/proprietary/vendor/firmware/a506_zap.mdt:$(TARGET_COPY_OUT_ODM)/firmware/qcom/msm8953/xiaomi/tissot/a506_zap.mdt

PRODUCT_PACKAGES += \
    all_symlink_firmware_tissot

# Init
PRODUCT_PACKAGES += \
    fstab.tissot \
    fstab.tissot.ramdisk \
    init.tissot.rc \
    init.mi8953_a.rc \
    ueventd.tissot.rc \
    ueventd.mi8953_a.rc

PRODUCT_PACKAGES += \
    use_memfd.rc

$(call soong_config_set,mainline_common_libinit,set_properties_from,devicetree)

# Input
PRODUCT_PACKAGES += \
    ts_vkeys.kl

TARGET_TOUCHSCREEN_HAS_VIRTUAL_KEYS := true

# Kernel
PRODUCT_PACKAGES += \
    modules.load.normal

# Overlay
DEVICE_PACKAGE_OVERLAYS += \
    $(TARGET_DEVICE_PATH)/../mi8953_a/overlays/overlay

# Properties
PRODUCT_VENDOR_PROPERTIES += \
    vendor.remoteproc.4080000_remoteproc.ignore=1

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(TARGET_DEVICE_PATH) \
    device/xiaomi/mi89xx-mainline/mi8953_a \
    kernel/mainline/configs
