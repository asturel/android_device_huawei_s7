# Copyright (C) 2011 The Android Open Source Project
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
# This file is the build configuration for a full Android
# build for toro hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps). Except for a few implementation
# details, it only fundamentally contains two inherit-product
# lines, full and toro, hence its name.
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from s7 device
$(call inherit-product, device/huawei/s7/device.mk)

# Set those variables here to overwrite the inherited values.

PRODUCT_NAME := s7
PRODUCT_DEVICE := s7
PRODUCT_BRAND := Huawei
PRODUCT_MODEL := S7
PRODUCT_MANUFACTURER := HUAWEI

#PRODUCT_BUILD_PROP_OVERRIDES += BUILD_FINGERPRINT=google/soju/crespo:4.0.4/IMM76D/299849:user/release-keys PRIVATE_BUILD_DESC="soju-user 4.0.4 IMM76D 299849 release-keys"



#PRODUCT_NAME := cm_s7
#PRODUCT_DEVICE := s7
#PRODUCT_BRAND := huawei
#PRODUCT_MODEL := IDEOS S7 Slim
#PRODUCT_MANUFACTURER := HUAWEI


#PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_MODEL="IDEOS S7 Slim" PRODUCT_MANUFACTURER=HUAWEI PRODUCT_NAME=SLIM_HW_SE TARGET_DEVICE=qsd8k_slim BUILD_FINGERPRINT=Huawei/SLIM_HW_SE/qsd8k_slim/slim:2.2.2/FRG83G/hid.20110919.193625:user/release-keys PRIVATE_BUILD_DESC="SLIM_HW_SE-user 2.2.2 FRG83G hid.20110919.193625 release-keys"
#PRODUCT_BUILD_PROP_OVERRIDES += BUILD_FINGERPRINT=google/soju/crespo:4.0.4/IMM76D/299849:user/release-keys PRIVATE_BUILD_DESC="soju-user 4.0.4 IMM76D 299849 release-keys"

