#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from parent
include device/xiaomi/mi89xx-mainline/BoardConfig.mk

# Boot parameters
BOARD_KERNEL_CMDLINE += \
    androidboot.hardware=daisy

# Display
TARGET_SCREEN_DENSITY := 420

# Kernel
TARGET_DTB_LIST_WILDCARD := qcom/msm8953-xiaomi-daisy

TARGET_KERNEL_CONFIG_EXT := \
    $(DEVICE_PATH)/mi8953_a/kconfigs/config-postmarketos-qcom-msm8953.aarch64 \
    $(DEVICE_PATH)/mi8953_a/kconfigs/basic.config \
    kernel/mainline/configs/fragments/android-base-pre/common.config \
    kernel/mainline/configs/fragments/android-base-pre/arm64.config \
    kernel/configs/b/android-6.12/android-base.config \
    kernel/mainline/configs/fragments/android-base-conditional/CONFIG_ARM64-y.config \
    kernel/mainline/configs/fragments/common.config \
    kernel/mainline/configs/fragments/y/fbcon.config \
    kernel/mainline/configs/fragments/n/disable-clang-hardening-features.config \
    kernel/mainline/configs/fragments/n/faster-build-time.config
TARGET_KERNEL_SOURCE := kernel/mainline/msm8953-mainline

# Kernel modules
BOARD_RECOVERY_RAMDISK_KERNEL_MODULES_LOAD := \
    $(strip $(shell cat $(DEVICE_PATH)/mi8953_a/modprobe/mainline/modules.load.basic)) \
    $(strip $(shell cat $(DEVICE_PATH)/mi8953_a/modprobe/mainline/modules.load.drm)) \
    $(strip $(shell cat $(DEVICE_PATH)/mi8953_a/modprobe/mainline/modules.load.panel.daisy)) \
    $(strip $(shell cat $(DEVICE_PATH)/mi8953_a/modprobe/mainline/modules.load.touchscreen))
BOARD_VENDOR_KERNEL_MODULES_LOAD := \
    $(BOARD_RECOVERY_RAMDISK_KERNEL_MODULES_LOAD)
RECOVERY_KERNEL_MODULES := \
    $(BOARD_RECOVERY_RAMDISK_KERNEL_MODULES_LOAD)
TARGET_AUTO_COLLECT_KERNEL_MODULE_DEPS := true

# OTA
TARGET_OTA_ASSERT_DEVICE := daisy_mainline

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_SYSTEMIMAGE_EXTFS_INODE_COUNT := -1
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2684354560
BOARD_VENDORIMAGE_EXTFS_INODE_COUNT := -1
BOARD_VENDORIMAGE_PARTITION_SIZE := 805306368
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4

BOARD_USES_METADATA_PARTITION := true
TARGET_COPY_OUT_VENDOR := vendor

# Recovery
BOARD_USES_RECOVERY_AS_BOOT := true
TARGET_NO_RECOVERY := true
TARGET_RECOVERY_FSTAB := $(TARGET_DEVICE_PATH)/fstab/fstab.daisy
