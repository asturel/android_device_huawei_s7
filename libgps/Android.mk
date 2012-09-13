$(shell mkdir -p $(OUT)/obj/SHARED_LIBRARIES/libloc_intermediates)
$(shell touch $(OUT)/obj/SHARED_LIBRARIES/libloc_intermediates/export_includes)

LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE := gps.$(TARGET_BOOTLOADER_BOARD_NAME)

LOCAL_SHARED_LIBRARIES:= \
    liblog \
    libloc \

LOCAL_SRC_FILES += \
    gps.c

LOCAL_CFLAGS += \
    -fno-short-enums \
    -DNEEDS_INITIAL_XTRA

LOCAL_PRELINK_MODULE := false
LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/hw

include $(BUILD_SHARED_LIBRARY)
