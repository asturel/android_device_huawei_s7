#
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

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)


## (2) Also get non-open-source files if available (made after in full_s7.mk)
$(call inherit-product-if-exists, vendor/huawei/s7/s7-vendor.mk)

PRODUCT_PROPERTY_OVERRIDES += \
	ro.media.capture.maxres=5m \
	ro.media.capture.flash=led \
	ro.media.capture.flashIntensity=41 \
	ro.media.capture.torchIntensity=25 \
	ro.media.capture.classification=classH \
	ro.media.capture.flip=horizontalandvertical \
	ro.com.google.locationfeatures=1 \
	ro.telephony.call_ring.multiple=false \
	ro.telephony.call_ring.delay=3000 \
	ro.url.safetylegal=http://www.huawei.com/staticfiles/Support/legal/?model=s7 \
	ro.media.dec.jpeg.memcap=20000000 \
	ro.media.dec.aud.wma.enabled=1 \
	ro.media.dec.vid.wmv.enabled=1 \
	dalvik.vm.lockprof.threshold=500 \
	ro.kernel.android.checkjni=0 \
	dalvik.vm.dexopt-data-only=1 \
	ro.vold.umsdirtyratio=20

DEVICE_PACKAGE_OVERLAYS += device/huawei/s7/overlay

#Common packages (gingerbread/ics)
PRODUCT_PACKAGES += \
	librs_jni \
	dspexec \
	libbridge \
	wlan_cu \
	wlan_loader \
	libCustomWifi \
	wpa_supplicant.conf \
	dhcpcd.conf \
	libLCML \
	libOMX_Core \
	libfnc \
	iwmulticall \
	hostap \
	hostapd.conf \
	libhostapdcli \
	static_busybox \
	Usb \
	Superuser \
	su

# for jpeg hw encoder/decoder
PRODUCT_PACKAGES += libskiahw


PRODUCT_PACKAGES += e2fsck

# Add DroidSSHd (dropbear) Management App - tpruvot/android_external_droidsshd @ github
PRODUCT_PACKAGES += DroidSSHd dropbear dropbearkey sftp-server scp ssh

# Missing in CM9
PRODUCT_PACKAGES += AndroidTerm DSPManager

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_COPY_FILES += \
	device/huawei/s7/vold.fstab:system/etc/vold.fstab
	
# Init
PRODUCT_COPY_FILES += \
	device/huawei/s7/init.s7.rc:root/etc/init.s7.rc \
	device/huawei/s7/init.s7.usb.rc:root/etc/init.s7.usb.rc \
	device/huawei/s7/ueventd.s7.rc:root/etc/ueventd.s7.rc
	


# copy all vendor (huawei) kernel modules to system/lib/modules
PRODUCT_COPY_FILES += $(shell test -d vendor/huawei/s7/lib/modules &&  \
	find vendor/huawei/s7/lib/modules -name '*.ko' \
	-printf '%p:system/lib/modules/%f ')
	
PRODUCT_COPY_FILES += $(shell test -d vendor/huawei/s7/lib/modules &&  \
	find vendor/huawei/s7/lib/modules -name '*.ko' \
	-printf '%p:root/lib/modules/%f ')

# copy all others kernel modules under the "modules" directory to system/lib/modules
PRODUCT_COPY_FILES += $(shell test -d device/huawei/s7/modules && \
	find device/huawei/s7/modules -name '*.ko' \
	-printf '%p:system/lib/modules/%f ')

PRODUCT_COPY_FILES += $(shell test -d device/huawei/s7/modules && \
	find device/huawei/s7/modules -name '*.ko' \
	-printf '%p:root/lib/modules/%f ')

# Live wallpaper packages
PRODUCT_PACKAGES += \
        LiveWallpapers \
        LiveWallpapersPicker \
        MagicSmokeWallpapers \
        VisualizationWallpapers

# Publish that we support the live wallpaper feature.

# ICS USB Packages
PRODUCT_PACKAGES += com.android.future.usb.accessory

######################################################################################################################################

$(call inherit-product, build/target/product/full_base.mk)

# Should be after the full_base include, which loads languages_full
PRODUCT_LOCALES += hdpi

PRODUCT_NAME := full_s7
PRODUCT_DEVICE := s7

