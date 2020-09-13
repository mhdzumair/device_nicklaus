# mt6737m platform boardconfig
LOCAL_PATH := device/motorola/nicklaus

include vendor/mad/config/board.mk

# Platform
ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_BOARD_PLATFORM := mt6737m
TARGET_NO_BOOTLOADER := true
TARGET_NO_FACTORYIMAGE := true

# CPU
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a53

#Bootloader
TARGET_BOOTLOADER_BOARD_NAME := mt6737m

# Kernel
BOARD_KERNEL_IMAGE_NAME := zImage-dtb
TARGET_KERNEL_SOURCE := kernel/motorola/nicklaus
BOARD_KERNEL_BASE := 0x40000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_RAMDISK_OFFSET := 0x04000000
BOARD_TAGS_OFFSET := 0x0e000000
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,32N2 androidboot.selinux=permissive
BOARD_MKBOOTIMG_ARGS := --kernel_offset $(BOARD_KERNEL_OFFSET) --ramdisk_offset $(BOARD_RAMDISK_OFFSET) --tags_offset $(BOARD_TAGS_OFFSET)
TARGET_KERNEL_ARCH := arm
TARGET_KERNEL_ARCH_MTK_PLATFORM=mt6735
TARGET_KERNEL_CONFIG := nicklaus_defconfig
MTK_APPENDED_DTB_SUPPORT := yes
TARGET_KMODULES := true

#toolchain
TARGET_KERNEL_CROSS_COMPILE_PREFIX := arm-eabi-
KERNEL_TOOLCHAIN := $(ANDROID_BUILD_TOP)/prebuilts/gcc/linux-x86/arm/gcc-linaro-7.5/bin

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3221225472
BOARD_USERDATAIMAGE_PARTITION_SIZE := 11543248896
BOARD_CACHEIMAGE_PARTITION_SIZE := 419430400
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_FLASH_BLOCK_SIZE := 131072

BOARD_HAS_LARGE_FILESYSTEM := true
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Include needed symbols
TARGET_INCLUDE_LIBMTK_SYMBOLS := true
include vendor/mad/config/symbols.mk

#audio
TARGET_HAS_PRE_N_AUDIO := true
TARGET_CPU_MEMCPY_OPT_DISABLE := true
BOARD_USES_MTK_AUDIO := true

# Flags
BOARD_GLOBAL_CFLAGS += -DNO_SECURE_DISCARD
BOARD_GLOBAL_CFLAGS += -DDISABLE_HW_ID_MATCH_CHECK

# Display
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720
MTK_HWC_SUPPORT := yes
MTK_HWC_VERSION := 1.4.1
MTK_GPU_VERSION := mali midgard r12p1
OVERRIDE_RS_DRIVER := libRSDriver_mtk.so
PRESENT_TIME_OFFSET_FROM_VSYNC_NS := 0

# Fix video autoscaling on old OMX decoders
TARGET_OMX_LEGACY_RESCALING := true

# GPS
BOARD_GPS_LIBRARIES :=true
BOARD_CONNECTIVITY_MODULE := MT6630
BOARD_MEDIATEK_USES_GPS := true

# Enable Minikin text layout engine (will be the default soon)
USE_MINIKIN := true

# Charger
BOARD_CHARGER_SHOW_PERCENTAGE := true

# Fonts
EXTENDED_FONT_FOOTPRINT := true

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(LOCAL_PATH)/bluetooth

# LightHAL
TARGET_PROVIDES_LIBLIGHT := true

# Recovery
BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/rootdir/recovery.fstab
# TWRP-specific
ifeq ($(RECOVERY_VARIANT), twrp)
DEVICE_RESOLUTION := 720x1280
DEVICE_SCREEN_WIDTH := 720
DEVICE_SCREEN_HEIGHT := 1280
RECOVERY_SDCARD_ON_DATA := true
TW_INTERNAL_STORAGE_PATH := "/data/media"
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
TW_EXTERNAL_STORAGE_PATH := "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"
TW_DEFAULT_EXTERNAL_STORAGE := true
endif

TARGET_SYSTEM_PROP := $(LOCAL_PATH)/system.prop
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.zygote=zygote32

# SELinux
BOARD_SEPOLICY_DIRS += $(LOCAL_PATH)/sepolicy

# Seccomp filter
BOARD_SECCOMP_POLICY := $(LOCAL_PATH)/seccomp

#includ header patch
TARGET_SPECIFIC_HEADER_PATH := $(LOCAL_PATH)/include

# Add ril stuff
BOARD_RIL_CLASS := ../../../$(LOCAL_PATH)/ril
