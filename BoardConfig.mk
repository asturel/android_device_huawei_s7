# Copyright (C) 2009 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).
USE_CAMERA_STUB := true


BOARD_PROVIDES_LIBRIL := true



#DEVICE_PROVISIONED := true

TARGET_USES_OLD_LIBSENSORS_HAL := true
#BOARD_VENDOR_USE_AKMD := akm8973

TARGET_SPECIFIC_HEADER_PATH := device/huawei/s7/include

TARGET_PREBUILT_RECOVERY_KERNEL := device/huawei/s7/kernel_recovery


TARGET_PREBUILT_KERNEL := device/huawei/s7/kernel

BOARD_USE_LEGACY_TOUCHSCREEN := true

# hdmi
TARGET_USES_OVERLAY := false
TARGET_QCOM_HDMI_OUT := true




TARGET_GRALLOC_USES_ASHMEM := true
ARCH_ARM_HAVE_NEON := true


# Board properties
ARCH_ARM_HAVE_VFP := true
TARGET_NO_BOOTLOADER := true
TARGET_BOOTLOADER_BOARD_NAME := s7
TARGET_BOARD_PLATFORM := qsd8k
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_ARCH_VARIANT_CPU := cortex-a5
TARGET_ARCH_VARIANT_FPU := neon
ARCH_ARM_HAVE_TLS_REGISTER := false
TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_USE_SCORPION_BIONIC_OPTIMIZATION := true

# Kernel
#TARGET_KERNEL_CONFIG := cyanogenmod_s7_defconfig
#BOARD_KERNEL_CMDLINE := console=ttyMSM0,115200,n8 androidboot.hardware=s7 no_console_suspend=1 msmsdcc_sdioirq=1
BOARD_KERNEL_CMDLINE := console=ttyMSM2,115200n8 androidboot.hardware=s7

BOARD_KERNEL_BASE := 0x20000000
BOARD_KERNEL_PAGESIZE := 2048

# EGL
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200
BOARD_EGL_CFG := device/huawei/s7/prebuilt/system/lib/egl/egl.cfg
TARGET_USES_GENLOCK := true
USE_OPENGL_RENDERER := true
BOARD_ADRENO_DECIDE_TEXTURE_TARGET := true
TARGET_FORCE_CPU_UPLOAD := true
TARGET_NO_HW_VSYNC := true


# Filesystem
#cat /proc/mtd
#dev:    size   erasesize  name
#mtd0: 00500000 00020000 "boot"
#mtd1: 00500000 00020000 "recovery"
#mtd2: 0fa00000 00020000 "system"
#mtd3: 02100000 00020000 "cache"
#mtd4: 0a000000 00020000 "userdata"
#mtd5: 00200000 00020000 "logo"
#mtd6: 000e0000 00020000 "splash"
#mtd7: 00200000 00020000 "misc"

BOARD_BOOTIMAGE_PARTITION_SIZE := 5242880
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 5242880
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 262144000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 167772160
BOARD_FLASH_BLOCK_SIZE := 131072
#TARGET_USERIMAGES_USE_EXT4 := true
BOARD_USES_MMCUTILS := true

# Internal storage
BOARD_HAS_SDCARD_INTERNAL := true
BOARD_SDCARD_DEVICE_PRIMARY := /dev/block/mmcblk0p1
BOARD_SDCARD_DEVICE_SECONDARY := /dev/block/mmcblk1k1
BOARD_SDEXT_DEVICE := /dev/block/mmcblk0p2

# Recovery
TARGET_BOOTLOADER_BOARD_NAME := s7
TARGET_OTA_ASSERT_DEVICE := s7
#BOARD_RECOVERY_HANDLES_MOUNT := true
BOARD_LDPI_RECOVERY := true
BOARD_CUSTOM_RECOVERY_KEYMAPPING:= ../../device/huawei/s7/recovery/recovery_ui.c
TARGET_PROVIDES_INIT := true
TARGET_PROVIDES_INIT_TARGET_RC := true
TARGET_RECOVERY_FSTAB := device/huawei/s7/recovery/recovery.fstab
BOARD_CUSTOM_GRAPHICS  := ../../../device/huawei/s7/recovery/graphics.c
TARGET_RECOVERY_INITRC := device/huawei/s7/recovery/recovery.rc

# USB sheezle
BOARD_UMS_LUNFILE := /sys/devices/platform/msm_hsusb/gadget/lun0/file
BOARD_MASS_STORAGE_FILE_PATH := /sys/devices/platform/msm_hsusb/gadget/lun0/file
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/msm_hsusb/gadget/lun0/file
BOARD_USE_USB_MASS_STORAGE_SWITCH := true

# Input
BOARD_HAS_NO_SELECT_BUTTON := true

# Browser
WITH_JIT := true
ENABLE_JSC_JIT := true
JS_ENGINE := v8
HTTP := chrome
ENABLE_WEBGL := true
TARGET_WEBKIT_USE_MORE_MEMORY := true

# QCOM Dependencies
BOARD_USES_QCOM_HARDWARE := true
BOARD_USES_QCOM_LIBS := true
COMMON_GLOBAL_CFLAGS += -DQCOM_ICS_COMPAT -DQCOM_NO_SECURE_PLAYBACK
#COMMON_GLOBAL_CFLAGS += -DREFRESH_RATE=60 -DQCOM_HARDWARE -DUSES_LEGACY_EGL
COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE -DREFRESH_RATE=60 -DUSES_LEGACY_EGL -DQCOM_NO_SECURE_PLAYBACK

#COMMON_GLOBAL_CFLAGS += -DMISSING_EGL_PIXEL_FORMAT_YV12 -DMISSING_GRALLOC_BUFFERS -DUNABLE_TO_DEQUEUE -DMISSING_EGL_EXTERNAL_IMAGE


# -DQCOM_ICS_COMPAT -DBINDER_COMPAT -DICS_CAMERA_BLOB

#BOARD_NEEDS_MEMORYHEAPPMEM := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true

# GPS
BOARD_GPS_LIBRARIES = libloc
BOARD_USES_GPSSHIM := true
BOARD_GPS_NEEDS_XTRA := true

# Data
BOARD_MOBILEDATA_INTERFACE_NAME := "rmnet0"

# Bootanimation
TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true
TARGET_RECOVERY_PIXEL_FORMAT = RGB_565

# Wifi related defines


BOARD_WPA_SUPPLICANT_DRIVER := WEXT
WPA_SUPPLICANT_VERSION      := VER_0_6_X
BOARD_WLAN_DEVICE           := bcm4329
WIFI_DRIVER_MODULE_PATH     := "/system/lib/modules/dhd.ko"
WIFI_DRIVER_FW_STA_PATH     := "/system/etc/wifi/rtecdc-bcm4329.bin"
WIFI_DRIVER_FW_AP_PATH      := "/system/etc/wifi/rtecdc-apsta-bcm4329.bin"
WIFI_DRIVER_MODULE_ARG      := "firmware_path=/system/etc/wifi/rtecdc-bcm4329.bin nvram_path=/system/etc/wifi/nvram-bcm4329.txt"
WIFI_DRIVER_MODULE_NAME     := "dhd"

# fix work on old kernel
BOARD_WEXT_NO_COMBO_SCAN    := true

#BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_wext

BOARD_HOSTAPD_DRIVER        := WEXT
#BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_wext

ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.secure=0 \
    service.adb.enable=1 \
    sys.usb.config=adb
