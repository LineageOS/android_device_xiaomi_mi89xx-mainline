#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/xiaomi/mi89xx-mainline

# Inherit from mainline/qcom-common
$(call inherit-product, device/mainline/qcom-common/mainline_qcom-common.mk)

# AAPT
ifeq ($(PRODUCT_IS_ATV),true)
PRODUCT_AAPT_PREF_CONFIG := tvdpi
endif

# Bootanimation
TARGET_BOOTANIMATION_HALF_RES := true

# HIDL
PRODUCT_PACKAGES += \
    vndservicemanager

# Init
PRODUCT_PACKAGES += \
    init.mi89xx.rc \
    init.recovery.mi89xx.rc \
    ueventd.mi89xx.rc

PRODUCT_PACKAGES += \
    zram.rc

# Kernel
PRODUCT_OTA_ENFORCE_VINTF_KERNEL_REQUIREMENTS := false

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(DEVICE_PATH)/overlays/overlay

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml

# Set device properties
PRODUCT_PACKAGES += \
    set_device_prop \
    set_device_prop.recovery

# Scoped Storage
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Sensors
PRODUCT_PACKAGES += \
    android.hardware.sensor.accelerometer.prebuilt.xml \
    android.hardware.sensor.compass.prebuilt.xml \
    android.hardware.sensor.gyroscope.prebuilt.xml \
    android.hardware.sensor.light.prebuilt.xml \
    android.hardware.sensor.proximity.prebuilt.xml

# Shipping API level
PRODUCT_SHIPPING_API_LEVEL := 33

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(DEVICE_PATH)
