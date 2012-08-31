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
$(call inherit-product, device/common/gps/gps_eu_supl.mk)


#$(call inherit-product-if-exists, vendor/gapps/gapps.mk)



#PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
#PRODUCT_AAPT_PREF_CONFIG := xhdpi

#PRODUCT_LOCALES += xhdpi

PRODUCT_AAPT_CONFIG := large ldpi mdpi
#PRODUCT_AAPT_PREF_CONFIG := ldpi
#PRODUCT_LOCALES += ldpi mdpi
PRODUCT_AAPT_PREF_CONFIG := mdpi
PRODUCT_LOCALES += mdpi hdpi


DEVICE_PACKAGE_OVERLAYS := device/huawei/s7/overlay




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
	device/huawei/s7/init.s7.rc:root/init.s7.rc \
	device/huawei/s7/init.s7.usb.rc:root/init.s7.usb.rc \
	device/huawei/s7/ueventd.s7.rc:root/ueventd.rc


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



# gpu

PRODUCT_COPY_FILES += \
	device/huawei/s7/prebuilt/system/etc/firmware/yamato_pm4.fw:system/etc/firmware/yamato_pm4.fw \
	device/huawei/s7/prebuilt/system/etc/firmware/yamato_pfp.fw:system/etc/firmware/yamato_pfp.fw \
	device/huawei/s7/prebuilt/system/lib/libsc-a2xx.so:system/lib/libsc-a2xx.so \
	device/huawei/s7/prebuilt/system/lib/libgsl.so:system/lib/libgsl.so \
	device/huawei/s7/prebuilt/system/lib/libC2D2.so:system/lib/libC2D2.so \
	device/huawei/s7/prebuilt/system/lib/egl/libGLESv2_adreno200.so:system/lib/egl/libGLESv2_adreno200.so \
	device/huawei/s7/prebuilt/system/lib/egl/eglsubAndroid.so:system/lib/egl/eglsubAndroid.so \
	device/huawei/s7/prebuilt/system/lib/egl/libq3dtools_adreno200.so:system/lib/egl/libq3dtools_adreno200.so \
	device/huawei/s7/prebuilt/system/lib/egl/libGLESv1_CM_adreno200.so:system/lib/egl/libGLESv1_CM_adreno200.so \
	device/huawei/s7/prebuilt/system/lib/egl/libGLES_android.so.old:system/lib/egl/libGLES_android.so.old \
	device/huawei/s7/prebuilt/system/lib/egl/libEGL_adreno200.so:system/lib/egl/libEGL_adreno200.so \
	device/huawei/s7/prebuilt/system/lib/egl/egl.cfg:system/lib/egl/egl.cfg \
	device/huawei/s7/prebuilt/system/lib/libOpenVG.so:system/lib/libOpenVG.so



# wifi
PRODUCT_COPY_FILES += \
    device/huawei/s7/prebuilt/system//lib/modules/dhd.ko:system/lib/modules/dhd.ko \
    device/huawei/s7/prebuilt/system//lib/modules/bcm4329.ko:system/lib/modules/bcm4329.ko \
    device/huawei/s7/prebuilt/system//etc/wifi/nvram_mfgtest-bcm4329.txt:system/etc/wifi/nvram_mfgtest-bcm4329.txt \
    device/huawei/s7/prebuilt/system//etc/wifi/nvram-bcm4329.txt:system/etc/wifi/nvram-bcm4329.txt \
    device/huawei/s7/prebuilt/system//etc/wifi/rtecdc-apsta-bcm4329.bin:system/etc/wifi/rtecdc-apsta-bcm4329.bin \
    device/huawei/s7/prebuilt/system//etc/wifi/rtecdc-bcm4319.bin:system/etc/wifi/rtecdc-bcm4319.bin \
    device/huawei/s7/prebuilt/system//etc/wifi/nvram_mfgtest-bcm4319.txt:system/etc/wifi/nvram_mfgtest-bcm4319.txt \
    device/huawei/s7/prebuilt/system//etc/wifi/nvram-bcm4319.txt:system/etc/wifi/nvram-bcm4319.txt \
    device/huawei/s7/prebuilt/system//etc/wifi/rtecdc-apsta-bcm4319.bin:system/etc/wifi/rtecdc-apsta-bcm4319.bin \
    device/huawei/s7/prebuilt/system//etc/wifi/rtecdc-mfgtest-bcm4319.bin:system/etc/wifi/rtecdc-mfgtest-bcm4319.bin \
    device/huawei/s7/prebuilt/system//etc/wifi/rtecdc-mfgtest-bcm4329.bin:system/etc/wifi/rtecdc-mfgtest-bcm4329.bin \
    device/huawei/s7/prebuilt/system/etc/nv.bin:system/etc/nv.bin



# layout
PRODUCT_COPY_FILES += \
    device/huawei/s7/prebuilt/system/usr/idc/t1320.idc:system/usr/idc/t1320.idc \
    device/huawei/s7/prebuilt/system/usr/keychars/s7_keypad.kcm.bin:system/usr/keychars/s7_keypad.kcm.bin \
    device/huawei/s7/prebuilt/system/usr/keylayout/s7_handset.kl:system/usr/keylayout/s7_handset.kl \
    device/huawei/s7/prebuilt/system/usr/keylayout/s7_keypad.kl:system/usr/keylayout/s7_keypad.kl \
    device/huawei/s7/prebuilt/system/usr/keylayout/Generic.kl:system/usr/keylayout/Generic.kl



# akmd
PRODUCT_COPY_FILES += \
    device/huawei/s7/prebuilt/system/bin/akmd2:system/bin/akmd2 \
    device/huawei/s7/prebuilt/system/lib/hw/sensors.default.so:system/lib/hw/sensors.default.so

# ril stuff
PRODUCT_COPY_FILES += \
    device/huawei/s7/prebuilt/system/bin/qmuxd:system/bin/qmuxd \
    device/huawei/s7/prebuilt/system/lib/libauth.so:system/lib/libauth.so \
    device/huawei/s7/prebuilt/system/lib/libcm.so:system/lib/libcm.so \
    device/huawei/s7/prebuilt/system/lib/libdiag.so:system/lib/libdiag.so \
    device/huawei/s7/prebuilt/system/lib/libdll.so:system/lib/libdll.so \
    device/huawei/s7/prebuilt/system/lib/libdsm.so:system/lib/libdsm.so \
    device/huawei/s7/prebuilt/system/lib/libdss.so:system/lib/libdss.so \
    device/huawei/s7/prebuilt/system/lib/libgsdi_exp.so:system/lib/libgsdi_exp.so \
    device/huawei/s7/prebuilt/system/lib/libgstk_exp.so:system/lib/libgstk_exp.so \
    device/huawei/s7/prebuilt/system/lib/libwms.so:system/lib/libwms.so \
    device/huawei/s7/prebuilt/system/lib/libwmsts.so:system/lib/libwmsts.so \
    device/huawei/s7/prebuilt/system/lib/libril-qc-1.so:system/lib/libril-qc-1.so \
    device/huawei/s7/prebuilt/system/lib/libril-qcril-hook-oem.so:system/lib/libril-qcril-hook-oem.so \
    device/huawei/s7/prebuilt/system/lib/libmmgsdilib.so:system/lib/libmmgsdilib.so \
    device/huawei/s7/prebuilt/system/lib/libnv.so:system/lib/libnv.so \
    device/huawei/s7/prebuilt/system/lib/liboncrpc.so:system/lib/liboncrpc.so \
    device/huawei/s7/prebuilt/system/lib/libpbmlib.so:system/lib/libpbmlib.so \
    device/huawei/s7/prebuilt/system/lib/libqmi.so:system/lib/libqmi.so \
    device/huawei/s7/prebuilt/system/lib/libqueue.so:system/lib/libqueue.so \
    device/huawei/s7/prebuilt/system/etc/apns-conf.xml:system/etc/apns-conf.xml

# gps
PRODUCT_COPY_FILES += \
    device/huawei/s7/prebuilt/system/lib/libcommondefs.so:system/lib/libcommondefs.so \
    device/huawei/s7/prebuilt/system/lib/libloc-rpc.so:system/lib/libloc-rpc.so \
    device/huawei/s7/prebuilt/system/lib/libloc.so:system/lib/libloc.so \
    device/huawei/s7/prebuilt/system/etc/loc_parameter.ini:system/etc/loc_parameter.ini \
    device/huawei/s7/prebuilt/system/lib/libloc_ext.so:system/lib/libloc_ext.so \
    device/huawei/s7/prebuilt/system/lib/libloc_api.so:system/lib/libloc_api.so \
    device/huawei/s7/prebuilt/system/lib/libgps.so:system/lib/libgps.so


PRODUCT_COPY_FILES += \
    device/huawei/s7/prebuilt/system/lib/libcommondefs.so:obj/lib/libcommondefs.so \
    device/huawei/s7/prebuilt/system/lib/libloc-rpc.so:obj/lib/libloc-rpc.so \
    device/huawei/s7/prebuilt/system/lib/libloc.so:obj/lib/libloc.so \
    device/huawei/s7/prebuilt/system/etc/loc_parameter.ini:obj/etc/loc_parameter.ini \
    device/huawei/s7/prebuilt/system/lib/libloc_ext.so:obj/lib/libloc_ext.so \
    device/huawei/s7/prebuilt/system/lib/libloc_api.so:obj/lib/libloc_api.so \
    device/huawei/s7/prebuilt/system/lib/libgps.so:obj/lib/libgps.so


# audio
PRODUCT_COPY_FILES += \
    device/huawei/s7/prebuilt/system/etc/DualMicControl.txt:system/etc/DualMicControl.txt


#camera
xPRODUCT_COPY_FILES += \
    device/huawei/s7/prebuilt/system/lib/libmmipl.so:system/lib/libmmipl.so \
    device/huawei/s7/prebuilt/system/lib/libmmjpeg.so:system/lib/libmmjpeg.so \
    device/huawei/s7/prebuilt/system/lib/libcamera-s7.so:system/lib/libcamera-s7.so \
    device/huawei/s7/prebuilt/system/lib/liboemcamera.so:system/lib/liboemcamera.so \
    device/huawei/s7/prebuilt/system/lib/libcamera-s7.so:obj/lib/libcamera-s7.so


#    device/huawei/s7/prebuilt/system/lib/:system/lib/ \
#    device/huawei/s7/prebuilt/system/lib/:system/lib/ \
#    device/huawei/s7/prebuilt/system/lib/:system/lib/ \
#    device/huawei/s7/prebuilt/system/lib/:system/lib/ \
#    device/huawei/s7/prebuilt/system/lib/:system/lib/ \



# Live wallpaper packages
PRODUCT_PACKAGES += \
        LiveWallpapers \
        LiveWallpapersPicker \
        MagicSmokeWallpapers \
        VisualizationWallpapers \
	Music \
	SoundRecoder

# Publish that we support the live wallpaper feature.

# ICS USB Packages
#PRODUCT_PACKAGES += com.android.future.usb.accessory


# Graphics

PRODUCT_PACKAGES += \
	libgenlock \
	gralloc.qsd8k \
	hwcomposer.qsd8k \
	copybit.qsd8k \
	libQcomUI \


PRODUCT_PACKAGES += \
    audio.primary.s7 \
    audio_policy.s7 \
    audio.a2dp.default \
    libaudioutils

# OMX
PRODUCT_PACKAGES += \
        libmm-omxcore \
        libOmxCore \
        libstagefrighthw \
	libOmxVdec \
        libOmxVidEnc \
        libmm-omxcore \
        libtilerenderer


# Camera
#PRODUCT_PACKAGES += \
#    camera.qsd8k

#PRODUCT_PACKAGES += \
#    camera.s7

#PRODUCT_PACKAGES += \
#        camera.msm7x27


# GPS
PRODUCT_PACKAGES += \
	librpc \
	gps.s7



PRODUCT_PACKAGES += \
    lights.s7 \
    sensors.qsd8k



PRODUCT_PACKAGES += \
        dexpreopt


DISABLE_DEXPREOPT := false

PRODUCT_TAGS += dalvik.gc.type-precise



# These are the hardware-specific features
PRODUCT_COPY_FILES += \
        frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
        frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
        frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
        frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
        frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
        frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
        frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
        frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
        frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

# Bluetooth configuration files
PRODUCT_COPY_FILES += \
        device/huawei/s7/prebuilt/system/etc/init.bt.sh:system/etc/init.bt.sh \
	device/huawei/s7/prebuilt/system/etc/init.brcm.bt.sh:system/etc/init.brcm.bt.sh \
	device/huawei/s7/prebuilt/system/bin/hci_qcomm_init:system/bin/hci_qcomm_init \
	device/huawei/s7/prebuilt/system/etc/init.qcom.bt.sh:system/etc/init.qcom.bt.sh \
        system/bluetooth/data/main.le.conf:system/etc/bluetooth/main.conf \
	device/huawei/s7/prebuilt/system/etc/bluetooth/BCM4329B1_002.002.023.0313.0390.hcd:system/etc/bluetooth/BCM4329B1_002.002.023.0313.0390.hcd


ifneq ($(TARGET_PREBUILT_KERNEL),)
    PRODUCT_COPY_FILES += \
	$(TARGET_PREBUILT_KERNEL):kernel
endif

PRODUCT_COPY_FILES += \
    device/huawei/s7/kernel_legujabb:kernel

$(call inherit-product, frameworks/base/build/phone-hdpi-512-dalvik-heap.mk)

$(call inherit-product-if-exists, hardware/broadcom/wlan/bcm4329/Android.mk)

#$(call inherit-product-if-exists,hardware/broadcom/wlan/bcmdhd/firmware/bcm4329/device-bcm.mk)

#####################################################################################################

$(call inherit-product, build/target/product/full_base.mk)

# Should be after the full_base include, which loads languages_full

PRODUCT_NAME := full_s7
PRODUCT_DEVICE := s7

