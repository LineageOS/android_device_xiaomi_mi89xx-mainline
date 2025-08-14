#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from parent
include device/xiaomi/mi89xx-mainline/BoardConfig.mk

# A/B
AB_OTA_UPDATER := false

# Boot parameters
BOARD_KERNEL_CMDLINE += \
    androidboot.hardware=tiare

# Kernel
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_SOURCE := kernel/xiaomi/mi89x7-mainline

TARGET_DTB_LIST_WILDCARD := \
    qcom/msm8917-xiaomi-* \
    qcom/msm8937-xiaomi-* \
    qcom/msm8940-xiaomi-*

TARGET_KERNEL_CONFIG_EXT := \
    $(DEVICE_PATH)/mi89x7/kconfigs/config-postmarketos-qcom-msm89x7.aarch64 \
    kernel/mainline/configs/fragments/y/arm64/gki_pre.config \
    kernel/mainline/configs/fragments/y/arm64/gki.config \
    kernel/mainline/configs/fragments/y/arm64/gki_post.config \
    kernel/mainline/configs/fragments/y/common.config \
    kernel/mainline/configs/fragments/y/fbcon.config \
    kernel/mainline/configs/fragments/n/disable-clang-hardening-features.config \
    kernel/mainline/configs/fragments/n/faster-build-time.config

# Kernel modules
BOARD_RECOVERY_RAMDISK_KERNEL_MODULES_LOAD := \
    $(strip $(shell cat $(DEVICE_PATH)/mi89x7/modprobe/modules.load.basic)) \
    $(strip $(shell cat $(DEVICE_PATH)/mi89x7/modprobe/modules.load.drm)) \
    $(strip $(shell cat $(DEVICE_PATH)/mi89x7/modprobe/modules.load.power_supply)) \
    $(strip $(shell cat $(DEVICE_PATH)/mi89x7/modprobe/modules.load.touchscreen))
BOARD_VENDOR_KERNEL_MODULES_LOAD := \
    $(BOARD_RECOVERY_RAMDISK_KERNEL_MODULES_LOAD)
RECOVERY_KERNEL_MODULES := \
    $(strip $(shell cat $(DEVICE_PATH)/mi89x7/modprobe/modules.include_dep.drm)) \
    $(BOARD_RECOVERY_RAMDISK_KERNEL_MODULES_LOAD)
SYSTEM_KERNEL_MODULES := \
    $(strip $(shell cat $(DEVICE_PATH)/mi89x7/modprobe/modules.include.system))

# OTA
TARGET_OTA_ASSERT_DEVICE := tiare,tiare_mainline

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

# Recovery
TARGET_RECOVERY_DENSITY := xhdpi
TARGET_RECOVERY_FSTAB := $(TARGET_DEVICE_PATH)/fstab/fstab.tiare
