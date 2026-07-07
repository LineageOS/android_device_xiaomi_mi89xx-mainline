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
    androidboot.hardware=mi8998

# Kernel
BOARD_KERNEL_APPEND_DTBS := qcom/msm8998-xiaomi-*
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 4096
TARGET_KERNEL_SOURCE := kernel/mainline/msm8998-mainline

TARGET_KERNEL_CONFIG := msm8998_defconfig
TARGET_KERNEL_CONFIG_EXT := \
    kernel/mainline/configs/fragments/android-base-pre/common.config \
    kernel/mainline/configs/fragments/android-base-pre/arm64.config \
    kernel/configs/v/android-6.1/android-base.config \
    kernel/mainline/configs/fragments/android-base-conditional/CONFIG_ARM64-y.config \
    kernel/mainline/configs/fragments/common.config \
    kernel/mainline/configs/fragments/y/fbcon.config \
    kernel/mainline/configs/fragments/n/disable-clang-hardening-features.config \
    kernel/mainline/configs/fragments/n/faster-build-time.config

# Kernel modules
TARGET_AUTO_COLLECT_KERNEL_MODULE_DEPS := true

# OTA
TARGET_OTA_ASSERT_DEVICE := mi8998

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_CACHEIMAGE_PARTITION_SIZE := 402653184
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
BOARD_SYSTEMIMAGE_EXTFS_INODE_COUNT := -1
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 5368709120
BOARD_VENDORIMAGE_EXTFS_INODE_COUNT := -1
BOARD_VENDORIMAGE_PARTITION_SIZE := 872415232
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4

BOARD_USES_METADATA_PARTITION := true
TARGET_COPY_OUT_VENDOR := vendor

# Recovery
TARGET_RECOVERY_DENSITY := xxhdpi
TARGET_RECOVERY_FSTAB := $(TARGET_DEVICE_PATH)/fstab/fstab.mi8998
