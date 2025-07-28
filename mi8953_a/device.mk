#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

TARGET_DEVICE_PATH := device/xiaomi/mi89xx-mainline/mi8953_a

# Inherit options from mainline/qcom-common
## SoC
TARGET_QCOM_SOC_FAMILY := msm8953
## TODO: Bringup the corresponding hardware and remove the following definitions
TARGET_AUDIO_HAL := default-aidl
TARGET_SUPPORTS_SUSPEND := false
include device/mainline/qcom-common/optional/options.mk

# Inherit from parent
$(call inherit-product, device/xiaomi/mi89xx-mainline/device.mk)

# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

# Dalvik heap
$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)

# Firmware
PRODUCT_PACKAGES += \
    all_symlink_firmware_mi89x7

$(foreach device,markw mido vince ysl rosy onclite,\
    $(foreach file,a506_zap.b00 a506_zap.b01 a506_zap.b02 a506_zap.mdt,\
        $(eval _src := vendor/xiaomi/$(device)/proprietary/vendor/firmware/$(file))\
        $(eval _dst := $(TARGET_COPY_OUT_ODM)/firmware/qcom/msm8953/xiaomi/$(device)/$(file))\
        $(eval $(if $(wildcard $(_src)),PRODUCT_COPY_FILES += $(_src):$(_dst),$(warning $(_src) not found)))))

# Init
PRODUCT_COPY_FILES += \
    $(TARGET_DEVICE_PATH)/fstab/fstab.mi8953_a:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.mi8953_a \
    $(TARGET_DEVICE_PATH)/init/init.mi8953_a.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.mi8953_a.rc

ifneq ($(MI8953_USE_ANDROID_COMMON_KERNEL),true)
PRODUCT_PACKAGES += \
    use_memfd.rc \
    zram.rc
endif

# Ramdisk
PRODUCT_COPY_FILES += \
    $(TARGET_DEVICE_PATH)/fstab/fstab.mi8953_a:$(TARGET_COPY_OUT_RAMDISK)/fstab.mi8953_a

# Recovery
PRODUCT_COPY_FILES += \
    $(TARGET_DEVICE_PATH)/init/init.recovery.mi8953_a.rc:$(TARGET_COPY_OUT_RECOVERY)/root/init.recovery.mi8953_a.rc

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(TARGET_DEVICE_PATH) \
    kernel/mainline/configs
