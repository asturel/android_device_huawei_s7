DEVICE_PACKAGE_OVERLAYS := device/huawei/s7/overlay

$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk) 

ifeq ($(TARGET_PREBUILT_KERNEL),)
    LOCAL_KERNEL := device/huawei/s7/prebuilt/kernel
else
    LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel
