#
# Copyright (C) 2020 The Android Open Source Project
# Copyright (C) 2020 The TWRP Open Source Project
# Copyright (C) 2020 SebaUbuntu's TWRP device tree generator
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

DEVICE_PATH := device/xiaomi/lancelot

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-2a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a75

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-2a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a55

TARGET_BOARD_SUFFIX := _64
TARGET_USES_64_BIT_BINDER := true

# Bootloader
TARGET_NO_BOOTLOADER := true
TARGET_USES_UEFI := true

# Assert
TARGET_OTA_ASSERT_DEVICE := lancelot,galahad

# AVB
BOARD_AVB_ENABLE := true
BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA4096
BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := 1
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1

#MIUI 12.xx A11 DECRYPTION
BOARD_AVB_RECOVERY_ADD_HASH_FOOTER_ARGS += \
    --prop com.android.build.boot.os_version:$(PLATFORM_VERSION) \
    --prop com.android.build.boot.security_patch:$(PLATFORM_SECURITY_PATCH)

# File systems
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_COPY_OUT_VENDOR := vendor
RECOVERY_SDCARD_ON_DATA := true
TW_INCLUDE_NTFS_3G := true

# Dynamic Partitions
BOARD_SUPER_PARTITION_SIZE := 7327449088
BOARD_SUPER_PARTITION_GROUPS := main
BOARD_MAIN_SIZE  := 7327449088
BOARD_MAIN_PARTITION_LIST  := product system vendor

# Partitions
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_CACHEIMAGE_PARTITION_SIZE := 452984832
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_USERDATAIMAGE_PARTITION_SIZE := 114601984000
BOARD_SYSTEMIMAGE_PARTITION_RESERVED_SIZE := 220270592
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_PARTITION_RESERVED_SIZE := 220270592
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4

# Kernel
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/Image.gz
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2 androidboot.selinux=permissive
BOARD_KERNEL_IMAGE_NAME := Image.gz
BOARD_KERNEL_BASE := 0x40078000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_DTB_OFFSET := 0x0bc08000
BOARD_RAMDISK_OFFSET := 0x07c08000
BOARD_KERNEL_TAGS_OFFSET := 0x0bc08000

# Image
BOARD_PREBUILT_DTBIMAGE_DIR := $(DEVICE_PATH)/prebuilt/dtb
BOARD_BOOTIMG_HEADER_VERSION := 2
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilt/dtbo.img
BOARD_INCLUDE_RECOVERY_DTBO := true
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)
BOARD_MKBOOTIMG_ARGS += --dtb_offset $(BOARD_DTB_OFFSET)
BOARD_FLASH_BLOCK_SIZE := 131072

# Platform
TARGET_BOARD_PLATFORM := mt6768
TARGET_BOOTLOADER_BOARD_NAME := mt6768

# Hack: prevent anti rollback
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := 2099-12-31
PLATFORM_VERSION := 16.1.0

# Crypto
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_CRYPTO_FBE := true
TW_INCLUDE_FBE_METADATA_DECRYPT := true
BOARD_USES_METADATA_PARTITION := true

# TWRP Configuration
TW_BRIGHTNESS_PATH := "/sys/devices/platform/leds-mt65xx/leds/lcd-backlight/brightness"
TW_MAX_BRIGHTNESS := 2047
TW_DEFAULT_BRIGHTNESS := 1200
TW_THEME := portrait_hdpi
TW_EXTRA_LANGUAGES := true
TW_SCREEN_BLANK_ON_BOOT := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_USE_TOOLBOX := true
TW_EXCLUDE_DEFAULT_USB_INIT := true
#TW_Y_OFFSET := 80
#TW_H_OFFSET := -80
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true 
TARGET_USES_MKE2FS := true
TW_EXCLUDE_TWRPAPP := true
TW_SKIP_COMPATIBILITY_CHECK := true
TW_INCLUDE_REPACKTOOLS := true
#TW_NO_SCREEN_TIMEOUT := true
TW_INCLUDE_FB2PNG := true
TW_INCLUDE_RESETPROP := true

# System as root
BOARD_SUPPRESS_SECURE_ERASE := true

# Selinux
BOARD_SEPOLICY_VERS := 29.0.3
SEPOLICY_IGNORE_NEVERALLOWS := true
SELINUX_IGNORE_NEVERALLOWS := true


# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery/root/system/etc/recovery.fstab
LZMA_RAMDISK_TARGETS := recovery
LZMA_COMPRESSION := -9


#SHRP Specific Stuff

SHRP_PATH := device/xiaomi/lancelot
SHRP_MAINTAINER := @shas45558
SHRP_DEVICE_CODE := lancelot
SHRP_REC_TYPE := Treble
SHRP_DEVICE_TYPE := A_only
SHRP_NOTCH := true
SHRP_EDL_MODE := 0
SHRP_EXTERNAL := /UFS_SD
SHRP_INTERNAL := /sdcard
SHRP_OTG := /usb_otg
SHRP_FLASH := 1
SHRP_CUSTOM_FLASHLIGHT := true
SHRP_FONP_1 := /sys/class/leds/flashlight/brightness
SHRP_FLASH_MAX_BRIGHTNESS := 200
SHRP_STATUSBAR_RIGHT_PADDING := 40
SHRP_STATUSBAR_LEFT_PADDING := 40
SHRP_REC := /dev/block/by-name/recovery
INC_IN_REC_MAGISK := true
#SHRP_DARK := true
#SHRP_LITE := true
#SHRP_NOTCH := true
SHRP_EXPRESS := true
SHRP_EXPRESS_USE_DATA := true
#SHRP_OFFICIAL := true
INC_IN_REC_ADDON_1 := true
INC_IN_REC_ADDON_2 := true
INC_IN_REC_ADDON_3 := true
INC_IN_REC_ADDON_4 := true

#SHRP Addons

SHRP_EXTERNAL_ADDON_PATH := "device/xiaomi/lancelot/addon/"
SHRP_EXTERNAL_ADDON_1_NAME := "SELinux Permissiver"
SHRP_EXTERNAL_ADDON_1_INFO := "Makes SELinux Permissive"
SHRP_EXTERNAL_ADDON_1_FILENAME := "permissiver.zip"
SHRP_EXTERNAL_ADDON_1_BTN_TEXT := "Flash"
SHRP_EXTERNAL_ADDON_1_SUCCESSFUL_TEXT := "Flashed Successfully"
SHRP_INC_IN_REC_EXTERNAL_ADDON_1 := true
SHRP_EXTERNAL_ADDON_2_NAME := "SELinux Enforcer"
SHRP_EXTERNAL_ADDON_2_INFO := "Reverts Back to Enforcing SELinux"
SHRP_EXTERNAL_ADDON_2_FILENAME := "enforcer.zip"
SHRP_EXTERNAL_ADDON_2_BTN_TEXT := "Flash"
SHRP_EXTERNAL_ADDON_2_SUCCESSFUL_TEXT := "Flashed Successfully"
SHRP_INC_IN_REC_EXTERNAL_ADDON_2 := true
SHRP_EXTERNAL_ADDON_3_NAME := "[MIUI] Disable Replace SHRP"
SHRP_EXTERNAL_ADDON_3_INFO := "Flash in MIUI To Stop MIUI Recovery From Replacing"
SHRP_EXTERNAL_ADDON_3_FILENAME := "disable-replace-shrp.zip"
SHRP_EXTERNAL_ADDON_3_BTN_TEXT := "Flash"
SHRP_EXTERNAL_ADDON_3_SUCCESSFUL_TEXT := "Installed"
SHRP_INC_IN_REC_EXTERNAL_ADDON_3 := true
SHRP_EXTERNAL_ADDON_4_NAME := "System RW Support"
SHRP_EXTERNAL_ADDON_4_INFO := "Make System to read anf write able"
SHRP_EXTERNAL_ADDON_4_FILENAME := "systemrw.zip"
SHRP_EXTERNAL_ADDON_4_BTN_TEXT := "Flash"
SHRP_EXTERNAL_ADDON_4_SUCCESSFUL_TEXT := "Flashed Successfully"
SHRP_INC_IN_REC_EXTERNAL_ADDON_4 := true
SHRP_EXTERNAL_ADDON_5_NAME := "F2FS Patcher"
SHRP_EXTERNAL_ADDON_5_INFO := "Patch Vendor For Mount F2fs"
SHRP_EXTERNAL_ADDON_5_FILENAME := "F2fs-patcher.zip"
SHRP_EXTERNAL_ADDON_5_BTN_TEXT := "Flash"
SHRP_EXTERNAL_ADDON_5_SUCCESSFUL_TEXT := "Now You Can use DATA and CACHE as f2fs"
SHRP_INC_IN_REC_EXTERNAL_ADDON_5 := true
SHRP_EXTERNAL_ADDON_6_NAME := "Imei Backup"
SHRP_EXTERNAL_ADDON_6_INFO := "Takes Imei backup"
SHRP_EXTERNAL_ADDON_6_FILENAME := "Imei-Backup.zip"
SHRP_EXTERNAL_ADDON_6_BTN_TEXT := "Flash"
SHRP_EXTERNAL_ADDON_6_SUCCESSFUL_TEXT := "Flashed Successfully"
SHRP_INC_IN_REC_EXTERNAL_ADDON_6 := true
SHRP_EXTERNAL_ADDON_7_NAME := "[MIUI]safetynet-fixer "
SHRP_EXTERNAL_ADDON_7_INFO := "Fix your safetynet error"
SHRP_EXTERNAL_ADDON_7_FILENAME := "safetynet-fix.zip"
SHRP_EXTERNAL_ADDON_7_BTN_TEXT := "Flash"
SHRP_EXTERNAL_ADDON_7_SUCCESSFUL_TEXT := "Flashed Successfully"
SHRP_INC_IN_REC_EXTERNAL_ADDON_7 := true
SHRP_EXTERNAL_ADDON_8_NAME := "Unlock-Logo-Remover"
SHRP_EXTERNAL_ADDON_8_INFO := "Remove unlock logo from bootlogo"
SHRP_EXTERNAL_ADDON_8_FILENAME := "Unlock-Logo-Remover.zip"
SHRP_EXTERNAL_ADDON_8_BTN_TEXT := "Flash"
SHRP_EXTERNAL_ADDON_8_SUCCESSFUL_TEXT := "Flashed Successfully"
SHRP_INC_IN_REC_EXTERNAL_ADDON_8 := true
SHRP_EXTERNAL_ADDON_9_NAME := "vbmetapatcher"
SHRP_EXTERNAL_ADDON_9_INFO := "Patch vbmeta for fixing bootloop"
SHRP_EXTERNAL_ADDON_9_FILENAME := "vbmetapatch.zip"
SHRP_EXTERNAL_ADDON_9_BTN_TEXT := "Flash"
SHRP_EXTERNAL_ADDON_9_SUCCESSFUL_TEXT := "Flashed Successfully"
SHRP_INC_IN_REC_EXTERNAL_ADDON_9 := true
SHRP_EXTERNAL_ADDON_10_NAME := "Aroma file manager"
SHRP_EXTERNAL_ADDON_10_INFO := "Flash for using it"
SHRP_EXTERNAL_ADDON_10_FILENAME := "aromafm-2.00b7.zip"
SHRP_EXTERNAL_ADDON_10_BTN_TEXT := "Flash"
SHRP_EXTERNAL_ADDON_10_SUCCESSFUL_TEXT := "Flashed Successfully"
SHRP_INC_IN_REC_EXTERNAL_ADDON_10 := true
SHRP_EXTERNAL_ADDON_11_NAME := "Product and vendor backuper"
SHRP_EXTERNAL_ADDON_11_INFO := "Creat product.img and vendor.img in internal storage"
SHRP_EXTERNAL_ADDON_11_FILENAME := "pv-backuper.zip"
SHRP_EXTERNAL_ADDON_11_BTN_TEXT := "Flash"
SHRP_EXTERNAL_ADDON_11_SUCCESSFUL_TEXT := "Flashed Successfully"
SHRP_INC_IN_REC_EXTERNAL_ADDON_11 := true
SHRP_EXTERNAL_ADDON_12_NAME := "System vendor and product resizer"
SHRP_EXTERNAL_ADDON_12_INFO := "Must flash _Product and vendor backuper_ first because you lose them and must be restore for booting your device. "
SHRP_EXTERNAL_ADDON_12_FILENAME := "spv-resizer.zip"
SHRP_EXTERNAL_ADDON_12_BTN_TEXT := "Flash"
SHRP_EXTERNAL_ADDON_12_SUCCESSFUL_TEXT := "Flashed Successfully"
SHRP_INC_IN_REC_EXTERNAL_ADDON_12 := true
SHRP_EXTERNAL_ADDON_13_NAME := "[A11] System and vendor resizer"
SHRP_EXTERNAL_ADDON_13_INFO := "Flash for resize may not work with a12 for a12 use above zips"
SHRP_EXTERNAL_ADDON_13_FILENAME := "sv_resizer.zip"
SHRP_EXTERNAL_ADDON_13_BTN_TEXT := "Flash"
SHRP_EXTERNAL_ADDON_13_SUCCESSFUL_TEXT := "Flashed Successfully"
SHRP_INC_IN_REC_EXTERNAL_ADDON_13 := true
#SHRP_EXTERNAL_ADDON_14_NAME := "Fingerprint remover"
#SHRP_EXTERNAL_ADDON_14_INFO := "Flash for using it"
#SHRP_EXTERNAL_ADDON_14_FILENAME := "rfp.zip"
#SHRP_EXTERNAL_ADDON_14_BTN_TEXT := "Flash"
#SHRP_EXTERNAL_ADDON_14_SUCCESSFUL_TEXT := "Flashed Successfully"
#SHRP_INC_IN_REC_EXTERNAL_ADDON_14 := true
#SHRP_EXTERNAL_ADDON_15_NAME := "Disable force encryption"
#SHRP_EXTERNAL_ADDON_15_INFO := "Flash for using it"
#SHRP_EXTERNAL_ADDON_15_FILENAME := "Disable_Dm-Verity_ForceEncrypt.zip"
#SHRP_EXTERNAL_ADDON_15_BTN_TEXT := "Flash"
#SHRP_EXTERNAL_ADDON_15_SUCCESSFUL_TEXT := "Flashed Successfully"
#SHRP_INC_IN_REC_EXTERNAL_ADDON_15 := true
