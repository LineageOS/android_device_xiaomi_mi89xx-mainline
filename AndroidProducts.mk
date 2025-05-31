#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

PRODUCT_MAKEFILES := \
    lineage_mi8916:$(LOCAL_DIR)/mi8916/lineage_mi8916.mk \
    lineage_mi8953_a:$(LOCAL_DIR)/mi8953_a/lineage_mi8953_a.mk \
    lineage_mi89x7:$(LOCAL_DIR)/mi89x7/lineage_mi89x7.mk

$(foreach build_type, user userdebug eng, \
    $(eval COMMON_LUNCH_CHOICES += lineage_mi8916-$(build_type)) \
    $(eval COMMON_LUNCH_CHOICES += lineage_mi8953_a-$(build_type)) \
    $(eval COMMON_LUNCH_CHOICES += lineage_mi89x7-$(build_type)))
