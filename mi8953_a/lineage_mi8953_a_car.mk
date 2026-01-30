#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, device/lineage/car/lineage_car_vendor.mk)
$(call inherit-product, device/lineage/car/lineage_phone_car.mk)
$(call inherit-product, vendor/lineage/config/common_car.mk)

# Inherit from device
PRODUCT_IS_AUTOMOTIVE := true
$(call inherit-product, device/xiaomi/mi89xx-mainline/mi8953_a/device.mk)

PRODUCT_NAME := lineage_mi8953_a_car
PRODUCT_DEVICE := mi8953_a
PRODUCT_BRAND := Xiaomi
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_MODEL := MSM8953 Car
