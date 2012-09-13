# Correct bootanimation size for the screen
TARGET_SCREEN_HEIGHT := 800
TARGET_SCREEN_WIDTH := 480

$(call inherit-product, device/huawei/s7/s7.mk)

# Inherit some common CM9 stuff.
$(call inherit-product-if-exists, vendor/cm/config/common_full_phone.mk)

# Inherit some common CM stuff.
$(call inherit-product-if-exists, vendor/cm/config/gsm.mk)

PRODUCT_NAME := cm_s7
PRODUCT_DEVICE := s7
PRODUCT_RELEASE_NAME := S7

UTC_DATE := $(shell date +%s)
DATE     := $(shell date +%Y%m%d)

CM_BUILDTYPE := EXPERIMENTAL
CM_EXTRAVERSION := asturel
