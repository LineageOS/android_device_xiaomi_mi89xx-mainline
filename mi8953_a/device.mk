#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

TARGET_DEVICE_PATH := device/xiaomi/mi89xx-mainline/mi8953_a

# Inherit options from mainline/qcom-common
TARGET_HAS_IR := true
TARGET_QCOM_SOC_FAMILY := msm8953
## TODO: Bringup the corresponding hardware and remove the following definitions
TARGET_SUPPORTS_SUSPEND := false
include device/mainline/qcom-common/optional/options.mk

# Inherit from parent
MI8953_USE_ANDROID_COMMON_KERNEL := true
$(call inherit-product, device/xiaomi/mi89xx-mainline/device.mk)

# Audio
PRODUCT_PACKAGES += \
    audio.mi8953_a.xml \
    audio.xiaomi-mido.xml \
    audio.xiaomi-vince.xml

# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

# Dalvik heap
$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)

# Firmware
PRODUCT_PACKAGES += \
    all_symlink_firmware_mi8953_a

$(foreach device,markw mido vince ysl rosy onclite,\
    $(foreach file,a506_zap.b00 a506_zap.b01 a506_zap.b02 a506_zap.mdt,\
        $(eval _src := vendor/xiaomi/msm8953-common/proprietary/vendor/firmware/$(file))\
        $(eval _dst := $(TARGET_COPY_OUT_ODM)/firmware/qcom/msm8953/xiaomi/$(device)/$(file))\
        $(eval $(if $(wildcard $(_src)),PRODUCT_COPY_FILES += $(_src):$(_dst),$(warning $(_src) not found)))))

# Init
PRODUCT_PACKAGES += \
    fstab.mi8953_a \
    fstab.mi8953_a.ramdisk \
    init.mi8953_a.rc \
    ueventd.mi8953_a.rc

ifneq ($(MI8953_USE_ANDROID_COMMON_KERNEL),true)
PRODUCT_PACKAGES += \
    zram.rc
endif

# Kernel
ifneq ($(MI8953_USE_ANDROID_COMMON_KERNEL),true)
PRODUCT_PACKAGES += \
    modules.load.normal
else
PRODUCT_PACKAGES += \
    modules.load.vendor
endif

# Overlay
DEVICE_PACKAGE_OVERLAYS += \
    $(TARGET_DEVICE_PATH)/overlays/overlay

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(TARGET_DEVICE_PATH) \
    kernel/mainline/configs
