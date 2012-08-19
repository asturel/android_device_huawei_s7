LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

TARGET_PREBUILT_KERNEL := device/huawei/s7/prebuilt/kernel
#ALL_PREBUILT += $(INSTALLED_KERNEL_TARGET)

# include the non-open-source counterpart to this file
-include vendor/huawei/s7/BoardConfigVendor.mk
