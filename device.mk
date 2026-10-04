# Copyright (C) 2026 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0

# Galaxy A14 5G Exynos (SM-A146M / SM-A146B) — codename a14x

PRODUCT_DEVICE := a14x
PRODUCT_NAME := lineage_a14x
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SM-A146M
PRODUCT_MANUFACTURER := samsung

# Shipping API (vendor is VNDK 33 / first_api 33)
PRODUCT_SHIPPING_API_LEVEL := 33

# A/B — this device is A-only dynamic partitions
AB_OTA_UPDATER := false

# Dynamic partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true
# Stock gatekeeper service: TEEGRIS only accepts Samsung's own client binary, and the
# fingerprint TA verifies enrollment auth tokens against the TEE gatekeeper
PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0-impl

# Stock KeyMint was built against Android 13: IRemotelyProvisionedComponent V2 lived in
# keymint-V2-ndk (AOSP now ships it in rkp-V2-ndk), and its ASN.1 templates need that BoringSSL
PRODUCT_PACKAGES += \
    android.hardware.security.rkp-V2-ndk.vendor \
    libcrypto-v33

# AOSP builds of generic HAL services whose stock prebuilts clash with AOSP module names
# ponytail: memtrack uses the AOSP example (reports no GPU memory); memtrack-service.exynos
# lives in the hardware/samsung_slsi-linaro/graphics namespace, which clashes with vendor prebuilts.
PRODUCT_PACKAGES += \
    android.hardware.audio.service \
    android.hardware.audio@7.0-impl \
    android.hardware.audio.effect@7.0-impl \
    android.hardware.bluetooth.audio-impl \
    android.hardware.drm-service.clearkey \
    android.hardware.graphics.composer@2.4-service \
    android.hardware.memtrack-service.example \
    android.hardware.sensors@2.0-service.multihal \
    hostapd \
    WifiOverlayA14x \
    libsec-ril \
    libsecc2_shim \
    libsensorndkbridge_shim \
    sehradio \
    vndservicemanager \
    wpa_supplicant

# IMS (VoLTE): Samsung's IMS stack is One UI-only, so use the open-source PhhIms
# (packages/apps/PhhIms, github.com/krazey/ims)
PRODUCT_PACKAGES += \
    Iwlan \
    PhhIms \
    QualifiedNetworksService

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml \
    frameworks/native/data/etc/android.hardware.telephony.ims.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.ims.xml \
    $(LOCAL_PATH)/configs/permissions/privapp-permissions-me.phh.ims.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-me.phh.ims.xml

# Fstab & Vendor Boot Ramdisk
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/fstab.s5e8535:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.s5e8535 \
    $(LOCAL_PATH)/rootdir/etc/fstab.s5e8535:$(TARGET_COPY_OUT_VENDOR_RAMDISK)/first_stage_ramdisk/fstab.s5e8535 \
    $(LOCAL_PATH)/rootdir/etc/fstab.s5e8535:$(TARGET_COPY_OUT_VENDOR_RAMDISK)/fstab.s5e8535 \
    $(LOCAL_PATH)/rootdir/etc/fstab.s5e8535:$(TARGET_COPY_OUT_RECOVERY)/root/first_stage_ramdisk/fstab.s5e8535

# Touchscreen firmware for vendor ramdisk (early boot display/touch)
PRODUCT_COPY_FILES += \
    vendor/samsung/a14x/proprietary/vendor/firmware/ili7807_a14x.bin:$(TARGET_COPY_OUT_VENDOR_RAMDISK)/vendor/firmware/ili7807_a14x.bin \
    vendor/samsung/a14x/proprietary/vendor/firmware/td4160_a13x_boe.bin:$(TARGET_COPY_OUT_VENDOR_RAMDISK)/vendor/firmware/td4160_a13x_boe.bin \
    vendor/samsung/a14x/proprietary/vendor/firmware/nt36672_a14x_tianma.bin:$(TARGET_COPY_OUT_VENDOR_RAMDISK)/vendor/firmware/nt36672_a14x_tianma.bin \
    vendor/samsung/a14x/proprietary/vendor/firmware/nt36672_a14x_tianma_mp.bin:$(TARGET_COPY_OUT_VENDOR_RAMDISK)/vendor/firmware/nt36672_a14x_tianma_mp.bin \
    vendor/samsung/a14x/proprietary/vendor/firmware/nt36672_a14x_2ndbr_tianma.bin:$(TARGET_COPY_OUT_VENDOR_RAMDISK)/vendor/firmware/nt36672_a14x_2ndbr_tianma.bin \
    vendor/samsung/a14x/proprietary/vendor/firmware/nt36672_a14x_2ndbr_tianma_mp.bin:$(TARGET_COPY_OUT_VENDOR_RAMDISK)/vendor/firmware/nt36672_a14x_2ndbr_tianma_mp.bin

# Ensure vendor ramdisk is non-empty
$(call inherit-product, $(SRC_TARGET_DIR)/product/ramdisk_stub.mk)

# Init (optional until stock RC files are extracted)
ifneq ($(wildcard $(LOCAL_PATH)/rootdir/etc/init.s5e8535.rc),)
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/init.s5e8535.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.s5e8535.rc
endif
ifneq ($(wildcard $(LOCAL_PATH)/rootdir/etc/ueventd.s5e8535.rc),)
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/ueventd.s5e8535.rc:$(TARGET_COPY_OUT_VENDOR)/etc/ueventd.rc
endif

# Characteristics
PRODUCT_CHARACTERISTICS := nosdcard

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Overlay placeholders
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay
PRODUCT_ENFORCE_RRO_TARGETS := *

# Inherit proprietary blobs when extracted
$(call inherit-product-if-exists, vendor/samsung/a14x/a14x-vendor.mk)

# MindTheGapps (optional): git clone -b baklava https://gitlab.com/MindTheGapps/vendor_gapps vendor/gapps
# crDroid's LatinIME already defines libjni_latinimegoogle, so drop MindTheGapps' copy:
#   perl -0pi -e 's/cc_prebuilt_library_shared \{\n    name: "libjni_latinimegoogle".*?\n\}\n\n?//s' vendor/gapps/arm64/Android.bp
#   sed -i -e 's/Phonesky \\/Phonesky/' -e '/libjni_latinimegoogle/d' vendor/gapps/arm64/arm64-vendor.mk
$(call inherit-product-if-exists, vendor/gapps/arm64/arm64-vendor.mk)
