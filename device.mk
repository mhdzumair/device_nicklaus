LOCAL_PATH := device/motorola/nicklaus

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal xhdpi xxhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# Recovery allowed devices
TARGET_OTA_ASSERT_DEVICE := nicklaus,e4plus

# Lights
PRODUCT_PACKAGES += \
    lights.mt6737m

PRODUCT_PACKAGES += \
    fingerprint.default

# Power
PRODUCT_PACKAGES += \
    power.mt6737m

# MTK stuff
BOARD_USES_MTK_HARDWARE := true

# Disable adb security
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	ro.mount.fs=EXT4 \
	ro.adb.secure=0 \
	ro.secure=0 \
	ro.allow.mock.location=0 \
	ro.debuggable=1 \
	persist.service.acm.enable=0 \
	ro.config.low_ram=false

ADDITIONAL_DEFAULT_PROPERTIES += ro.adb.secure=0
ADDITIONAL_DEFAULT_PROPERTIES += ro.secure=0
ADDITIONAL_DEFAULT_PROPERTIES += persist.service.adb.enable=1

# Audio
PRODUCT_COPY_FILES += \
$(call find-copy-subdir-files,*,${LOCAL_PATH}/configs/audio,system/vendor/etc)

# Bluetooth
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,${LOCAL_PATH}/configs/bluetooth,system/etc/bluetooth)

# Media
PRODUCT_COPY_FILES += \
		$(LOCAL_PATH)/configs/media/media_codecs.xml:system/etc/media_codecs.xml \
		$(LOCAL_PATH)/configs/media/media_codecs_performance.xml:system/etc/media_codecs_performance.xml \
		$(LOCAL_PATH)/configs/media/media_profiles.xml:system/etc/media_profiles.xml \
		$(LOCAL_PATH)/configs/media/mtk_omx_core.cfg:system/vendor/etc/mtk_omx_core.cfg

# Keyboard layout
PRODUCT_COPY_FILES += \
		$(call find-copy-subdir-files,*,${LOCAL_PATH}/configs/keylayout,system/usr/keylayout) \
		$(call find-copy-subdir-files,*,${LOCAL_PATH}/configs/idc,system/usr/idc)

# Telephony
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,${LOCAL_PATH}/configs/telephony,system/vendor/etc)

# Misc
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,${LOCAL_PATH}/configs/misc,system/vendor/etc) \
    $(LOCAL_PATH)/configs/misc/clatd.conf:system/etc/clatd.conf

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/radvd/radvd.conf:system/vendor/etc/radvd/radvd.conf

PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,${LOCAL_PATH}/configs/wide-dhcpv6,system/vendor/etc/wide-dhcpv6)

# Motorola Camera permissions
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/com.motorola.camera.xml:system/etc/permissions/com.motorola.camera.xml \
    $(LOCAL_PATH)/configs/com.motorola.motosignature.xml:system/etc/permissions/com.motorola.motosignature.xml \
    $(LOCAL_PATH)/configs/com.motorola.cameraone.xml:system/etc/permissions/com.motorola.cameraone.xml

# Ramdisk
PRODUCT_COPY_FILES += \
		$(LOCAL_PATH)/rootdir/factory_init.connectivity.rc:root/factory_init.project.connectivity.rc \
    $(LOCAL_PATH)/rootdir/factory_init.project.rc:root/factory_init.project.rc \
		$(LOCAL_PATH)/rootdir/factory_init.rc:root/factory_init.rc \
		$(LOCAL_PATH)/rootdir/factory_init.usb.rc:root/factory_init.usb.rc \
    $(LOCAL_PATH)/rootdir/fstab.mt6735:root/fstab.mt6735 \
		$(LOCAL_PATH)/rootdir/init.connectivity.rc:root/init.connectivity.rc \
		$(LOCAL_PATH)/rootdir/init.microtrust.rc:root/init.microtrust.rc \
    $(LOCAL_PATH)/rootdir/init.modem.rc:root/init.modem.rc \
    $(LOCAL_PATH)/rootdir/init.mt6735.rc:root/init.mt6735.rc \
		$(LOCAL_PATH)/rootdir/init.mt6735.usb.rc:root/init.mt6735.usb.rc \
		$(LOCAL_PATH)/rootdir/init.project.rc:root/init.project.rc \
		$(LOCAL_PATH)/rootdir/init.volte.rc:root/init.volte.rc \
    $(LOCAL_PATH)/rootdir/ueventd.mt6735.rc:root/ueventd.mt6735.rc

# TWRP
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/etc/twrp.fstab:recovery/root/etc/twrp.fstab

# Thermal
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/thermal/.ht120.mtc:system/vendor/etc/.tp/.ht120.mtc \
    $(LOCAL_PATH)/configs/thermal/thermal.conf:system/vendor/etc/.tp/thermal.conf \
    $(LOCAL_PATH)/configs/thermal/thermal.off.conf:system/vendor/etc/.tp/thermal.off.conf \
    $(LOCAL_PATH)/configs/thermal/.thermal_policy_00:system/vendor/etc/.tp/.thermal_policy_00

# Fingerprint
PRODUCT_PACKAGES += \
    fingerprintd

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:system/etc/permissions/android.hardware.fingerprint.xml

# Dalvik/HWUI
$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)

# Common stuff
$(call inherit-product, vendor/mad/config/common.mk)

# Vendor
$(call inherit-product, vendor/motorola/nicklaus/nicklaus-vendor.mk)
