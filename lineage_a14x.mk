# Copyright (C) 2026 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0

# Inherit from those products
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from a14x device
$(call inherit-product, device/samsung/a14x/device.mk)

# Inherit some common Lineage stuff
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

PRODUCT_NAME := lineage_a14x
PRODUCT_DEVICE := a14x
PRODUCT_MANUFACTURER := samsung
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SM-A146M

PRODUCT_GMS_CLIENTID_BASE := android-samsung-ss

BUILD_FINGERPRINT := samsung/a14xub/a14x:15/AP3A.240905.015.A2/A146MUBSDDZE1:user/release-keys
