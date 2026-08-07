#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from parent
include device/xiaomi/mi89xx-mainline/BoardConfig.mk

# A/B
AB_OTA_PARTITIONS := \
    boot \
    system

# Boot parameters
BOARD_KERNEL_CMDLINE += \
    androidboot.hardware=tissot

# Display
TARGET_SCREEN_DENSITY := 400

# Kernel
TARGET_DTB_LIST_WILDCARD := qcom/msm8953-xiaomi-tissot

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
    $(strip $(shell cat $(TARGET_DEVICE_PATH)/modprobe/mainline/modules.load.panel)) \
    $(strip $(shell cat $(DEVICE_PATH)/mi8953_a/modprobe/mainline/modules.load.basic)) \
    $(strip $(shell cat $(DEVICE_PATH)/mi8953_a/modprobe/mainline/modules.load.drm)) \
    $(strip $(shell cat $(DEVICE_PATH)/mi8953_a/modprobe/mainline/modules.load.touchscreen))
BOARD_VENDOR_KERNEL_MODULES_LOAD := \
    $(BOARD_RECOVERY_RAMDISK_KERNEL_MODULES_LOAD)
RECOVERY_KERNEL_MODULES := \
    $(BOARD_RECOVERY_RAMDISK_KERNEL_MODULES_LOAD)
TARGET_AUTO_COLLECT_KERNEL_MODULE_DEPS := true

# OTA
TARGET_OTA_ASSERT_DEVICE := tissot_mainline

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_SYSTEMIMAGE_EXTFS_INODE_COUNT := -1
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3221225472

BOARD_USES_METADATA_PARTITION := true

# Recovery
BOARD_USES_RECOVERY_AS_BOOT := true
TARGET_NO_RECOVERY := true
TARGET_RECOVERY_FSTAB := $(TARGET_DEVICE_PATH)/fstab/fstab.tissot
