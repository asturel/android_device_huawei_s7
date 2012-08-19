# Release name
PRODUCT_RELEASE_NAME := s7

# Inherit device configuration
$(call inherit-product, device/huawei/s7/device.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := s7
PRODUCT_NAME := full_s7
PRODUCT_BRAND := Huawei
PRODUCT_MODEL := s7

