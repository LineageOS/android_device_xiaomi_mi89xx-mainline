#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from parent
include device/xiaomi/mi89xx/BoardConfig.mk

# Boot parameters
BOARD_KERNEL_CMDLINE += \
    androidboot.hardware=mi8953_a

# Kernel
TARGET_KERNEL_SOURCE := kernel/xiaomi/mi8953

BOARD_KERNEL_APPEND_DTBS := \
    qcom/msm8953-xiaomi-*.dtb \
    qcom/sdm450-xiaomi-*.dtb \
    qcom/sdm632-xiaomi-*.dtb

TARGET_KERNEL_CONFIG_EXT := \
    $(TARGET_DEVICE_PATH)/kconfigs/config-postmarketos-qcom-msm8953.aarch64 \
    kernel/mainline/configs/fragments/y/arm64/gki_pre.config \
    kernel/mainline/configs/fragments/y/arm64/gki.config \
    kernel/mainline/configs/fragments/y/arm64/gki_post.config \
    kernel/mainline/configs/fragments/y/common.config \
    kernel/mainline/configs/fragments/y/fbcon.config \
    kernel/mainline/configs/fragments/n/disable-clang-hardening-features.config \
    kernel/mainline/configs/fragments/n/faster-build-time.config

# Kernel modules
BOARD_VENDOR_KERNEL_MODULES_LOAD := \
    $(strip $(shell cat $(TARGET_DEVICE_PATH)/modprobe/modules.load.*))
BOARD_RECOVERY_RAMDISK_KERNEL_MODULES_LOAD := \
    $(strip $(shell cat $(TARGET_DEVICE_PATH)/modprobe/modules.load.basic)) \
    $(strip $(shell cat $(TARGET_DEVICE_PATH)/modprobe/modules.load.drm)) \
    $(strip $(shell cat $(TARGET_DEVICE_PATH)/modprobe/modules.load.panel.*)) \
    $(strip $(shell cat $(TARGET_DEVICE_PATH)/modprobe/modules.load.touchscreen))
RECOVERY_KERNEL_MODULES := \
    $(strip $(shell cat $(TARGET_DEVICE_PATH)/modprobe/modules.include_dep.basic)) \
    $(strip $(shell cat $(TARGET_DEVICE_PATH)/modprobe/modules.include_dep.drm)) \
    $(strip $(shell cat $(TARGET_DEVICE_PATH)/modprobe/modules.load.basic)) \
    $(strip $(shell cat $(TARGET_DEVICE_PATH)/modprobe/modules.load.drm)) \
    $(strip $(shell cat $(TARGET_DEVICE_PATH)/modprobe/modules.load.panel.*)) \
    $(strip $(shell cat $(TARGET_DEVICE_PATH)/modprobe/modules.load.touchscreen))

# OTA
TARGET_OTA_ASSERT_DEVICE := mi8953_a

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_CACHEIMAGE_PARTITION_SIZE := 268435456
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
BOARD_SYSTEMIMAGE_EXTFS_INODE_COUNT := -1
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3221225472
BOARD_VENDORIMAGE_EXTFS_INODE_COUNT := -1
BOARD_VENDORIMAGE_PARTITION_SIZE := 536870912
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4

TARGET_COPY_OUT_VENDOR := vendor

# Properties
TARGET_VENDOR_PROP += $(TARGET_DEVICE_PATH)/properties/vendor.prop

# Recovery
TARGET_RECOVERY_DENSITY := xxhdpi
TARGET_RECOVERY_FSTAB := $(TARGET_DEVICE_PATH)/fstab/fstab.mi8953_a
