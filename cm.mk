# Correct bootanimation size for the screen
TARGET_SCREEN_HEIGHT := 800
TARGET_SCREEN_WIDTH := 480

$(call inherit-product, device/huawei/s7/s7.mk)

# Inherit some common CM9 stuff.
$(call inherit-product-if-exists, vendor/cm/config/common_mini_phone.mk)

# Inherit some common CM stuff.
$(call inherit-product-if-exists, vendor/cm/config/gsm.mk)

PRODUCT_NAME := cm_s7
PRODUCT_DEVICE := s7
PRODUCT_RELEASE_NAME := S7

UTC_DATE := $(shell date +%s)
DATE     := $(shell date +%Y%m%d)

CM_BUILDTYPE := EXPERIMENTAL
CM_EXTRAVERSION := asturel

#PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=yakju BUILD_FINGERPRINT="google/yakju/maguro:4.1.1/JRO03C/398337:user/release-keys" PRIVATE_BUILD_DESC="yakju-user 4.1.1 JRO03C 398337 release-keys"
#PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=SLIM_HW_SE BUILD_ID=JRO03C BUILD_FINGERPRINT=Huawei/MediaPad/hws7300u:4.0.3/HuaweiMediaPad/C002B010SP10:user/release-keys PRIVATE_BUILD_DESC="MediaPad-user 4.0.3 HuaweiMediaPad C002B010SP10 release-keys"
#PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=soju BUILD_FINGERPRINT="google/soju/crespo:4.1.2/JZO54K/485486:user/release-keys" PRIVATE_BUILD_DESC="soju-user 4.1.2 JZO54K 485486 release-keys"
#PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=espressorfxx TARGET_DEVICE=espressorf BUILD_FINGERPRINT=samsung/espressorfxx/espressorf:4.0.3/IML74K/P3100XWALE2:user/release-keys PRIVATE_BUILD_DESC="espressorfxx-user 4.0.3 IML74K P3100XWALE2 release-keys"


PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=SLIM_HW_SE TARGET_DEVICE=qsd8k_slim