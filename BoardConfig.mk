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


COMMON_GLOBAL_CFLAGS += -DQCOM_LEGACY_OMX

# CAMERA STUFF
BOARD_USES_LEGACY_CAMERA := true
BOARD_USES_LEGACY_OVERLAY := true
BOARD_NEEDS_MEMORYHEAPPMEM := true
TARGET_DISABLE_ARM_PIE := true
COMMON_GLOBAL_CFLAGS += -DBINDER_COMPAT
COMMON_GLOBAL_CFLAGS += -DICS_CAMERA_BLOB
#BOARD_USE_NASTY_PTHREAD_CREATE_HACK := true # rly not needed

# Board properties
ARCH_ARM_HAVE_VFP := true
ARCH_ARM_HAVE_NEON := true
TARGET_NO_BOOTLOADER := true
TARGET_BOOTLOADER_BOARD_NAME := s7
TARGET_BOARD_PLATFORM := qsd8k
TARGET_GRALLOC_USES_ASHMEM := true
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_ARCH_VARIANT_CPU := cortex-a8
TARGET_ARCH_VARIANT_FPU := neon
ARCH_ARM_HAVE_TLS_REGISTER := true
#TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
#TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp
#TARGET_USE_SCORPION_BIONIC_OPTIMIZATION := true

TARGET_GLOBAL_CFLAGS += -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp

# Kernel
BOARD_KERNEL_BASE := 0x20000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_CMDLINE := console=ttyMSM2,115200n8 androidboot.hardware=s7
TARGET_SPECIFIC_HEADER_PATH := device/huawei/s7/include
TARGET_PREBUILT_RECOVERY_KERNEL := device/huawei/s7/kernel_recovery
TARGET_KERNEL_CONFIG := cm_s7_slim_defconfig
#TARGET_PREBUILT_KERNEL := device/huawei/s7/kernel


# QCOM Dependencies
BOARD_USES_QCOM_HARDWARE := true
BOARD_USES_QCOM_LIBS := true
TARGET_QCOM_HDMI_OUT := true
COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE
COMMON_GLOBAL_CFLAGS += -DREFRESH_RATE=60 -DQCOM_NO_SECURE_PLAYBACK  -DMISSING_GRALLOC_BUFFERS

# Sensors
#TARGET_USES_OLD_LIBSENSORS_HAL := true

# EGL
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200
BOARD_EGL_CFG := device/huawei/s7/prebuilt/system/lib/egl/egl.cfg
TARGET_USES_GENLOCK := true
USE_OPENGL_RENDERER := true
BOARD_ADRENO_DECIDE_TEXTURE_TARGET := true
TARGET_FORCE_CPU_UPLOAD := true
TARGET_NO_HW_VSYNC := true
#TARGET_LIBAGL_USE_GRALLOC_COPYBITS := true

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
TARGET_OTA_ASSERT_DEVICE := s7,qsd8k_slim

#BOARD_RECOVERY_HANDLES_MOUNT := true
BOARD_LDPI_RECOVERY := true
BOARD_CUSTOM_RECOVERY_KEYMAPPING:= ../../device/huawei/s7/recovery/recovery_ui.c
TARGET_PROVIDES_INIT := true
TARGET_PROVIDES_INIT_TARGET_RC := true
TARGET_RECOVERY_FSTAB := device/huawei/s7/recovery/recovery.fstab
BOARD_CUSTOM_GRAPHICS  := ../../../device/huawei/s7/recovery/graphics.c
TARGET_RECOVERY_INITRC := device/huawei/s7/recovery/recovery.rc

# TWRP
DEVICE_RESOLUTION := 800x480
TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"
TW_INTERNAL_STORAGE_PATH := "/sdcard"
TW_INTERNAL_STORAGE_MOUNT_POINT := "sdcard"
TW_EXTERNAL_STORAGE_PATH := "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"
RECOVERY_GRAPHICS_USE_LINELENGTH := true


# USB sheezle
BOARD_UMS_LUNFILE := /sys/devices/platform/msm_hsusb/gadget/lun0/file
BOARD_MASS_STORAGE_FILE_PATH := /sys/devices/platform/msm_hsusb/gadget/lun0/file
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/msm_hsusb/gadget/lun0/file
BOARD_USE_USB_MASS_STORAGE_SWITCH := true

# Input
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_USE_LEGACY_TOUCHSCREEN := true


# Browser
WITH_JIT := true
ENABLE_JSC_JIT := true
JS_ENGINE := v8
HTTP := chrome
ENABLE_WEBGL := true
TARGET_WEBKIT_USE_MORE_MEMORY := true


# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_CUSTOM_HCIATTACH := true

# GPS
BOARD_GPS_LIBRARIES = libloc
BOARD_USES_GPSSHIM := true
BOARD_GPS_NEEDS_XTRA := true

# RADIO
BOARD_MOBILEDATA_INTERFACE_NAME := "rmnet0"
BOARD_PROVIDES_LIBRIL := true


# Bootanimation
TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true

# Wifi related defines
BOARD_WPA_SUPPLICANT_DRIVER := WEXT
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_wext
WPA_SUPPLICANT_VERSION      := VER_0_8_X
BOARD_WLAN_DEVICE           := bcm4329
WIFI_DRIVER_MODULE_PATH     := "/system/lib/modules/dhd.ko"
WIFI_DRIVER_FW_PATH_STA     := "/system/etc/wifi/rtecdc-bcm4319.bin"
WIFI_DRIVER_FW_PATH_AP      := "/system/etc/wifi/rtecdc-apsta-bcm4319.bin"
WIFI_DRIVER_MODULE_ARG      := "firmware_path=/system/etc/wifi/rtecdc-bcm4319.bin nvram_path=/system/etc/wifi/nvram-bcm4319.txt firmware_softap_path=/system/etc/wifi/rtecdc-apsta-bcm4319.bin"
WIFI_DRIVER_MODULE_NAME     := "dhd"

# fix work on old kernel
BOARD_WEXT_NO_COMBO_SCAN    := true


# HOSTAPD
#BOARD_HOSTAPD_DRIVER        := WEXT
#BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_wext


SMALLER_FONT_FOOTPRINT := true

ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.secure=0 \
    service.adb.enable=1 \
    sys.usb.config=adb
