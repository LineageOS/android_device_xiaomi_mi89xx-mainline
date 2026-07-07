#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

TARGET_DEVICE_PATH := device/xiaomi/mi89xx-mainline/mi8998

# Inherit options from mainline/qcom-common
TARGET_QCOM_SOC := msm8998
## TODO: Bringup the corresponding hardware and remove the following definitions
TARGET_AUDIO_HAL := default-aidl
TARGET_HAS_BATTERY := false
TARGET_SUPPORTS_SUSPEND := false
TARGET_USES_FRAMEBUFFER_DISPLAY := true
include device/mainline/qcom-common/optional/options.mk

# Inherit from parent
$(call inherit-product, device/xiaomi/mi89xx-mainline/device.mk)

# AAPT
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

# Dalvik heap
$(call inherit-product, frameworks/native/build/phone-xhdpi-4096-dalvik-heap.mk)

# Firmware
PRODUCT_COPY_FILES += \
    vendor/xiaomi/msm8998-common/proprietary/vendor/firmware/a540_gpmu.fw2:$(TARGET_COPY_OUT_ODM)/firmware/qcom/a540_gpmu.fw2 \
    vendor/xiaomi/msm8998-common/proprietary/vendor/firmware/a540_zap.elf:$(TARGET_COPY_OUT_ODM)/firmware/qcom/msm8998/xiaomi/a540_zap.mbn

PRODUCT_PACKAGES += \
    all_symlink_firmware_mi8998 \
    firmware_mi8998_ipa_fws.mbn

# Init
PRODUCT_PACKAGES += \
    fstab.mi8998 \
    fstab.mi8998.ramdisk \
    init.mi8998.rc \
    ueventd.mi8998.rc

PRODUCT_PACKAGES += \
    use_memfd.rc

$(call soong_config_set,mainline_common_libinit,set_properties_from,devicetree)

# Overlay
DEVICE_PACKAGE_OVERLAYS += \
    $(TARGET_DEVICE_PATH)/overlays/overlay

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(TARGET_DEVICE_PATH) \
    kernel/mainline/configs
