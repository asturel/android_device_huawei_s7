#
# Copyright (C) 2011 The Android Open-Source Project
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

TARGET_BOOTANIMATION_NAME := vertical-480x800

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



#PRODUCT_BUILD_PROP_OVERRIDES += BUILD_FINGERPRINT=google/soju/crespo:4.0.4/IMM76D/299849:user/release-keys PRIVATE_BUILD_DESC="soju-user 4.0.4 IMM76D 299849 release-keys"
