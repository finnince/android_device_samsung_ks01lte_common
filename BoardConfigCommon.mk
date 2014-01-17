# Copyright (C) 2009 The CyanogenMod Project
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
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# inherit from common msm8960
-include device/samsung/msm8960-common/BoardConfigCommon.mk

TARGET_SPECIFIC_HEADER_PATH := device/samsung/ks01lte-common/include


# overrides  msm8960
TARGET_BOARD_PLATFORM := msm8974
TARGET_BOARD_PLATFORM_GPU := qcom-adreno330
TARGET_BOOTLOADER_BOARD_NAME := MSM8974


PRODUCT_PROPERTY_OVERRIDES += ro.sf.lcd_density=361
ADDITIONAL_DEFAULT_PROPERTIES += ro.adb.secure=0
ADDITIONAL_DEFAULT_PROPERTIES += ro.secure=0
ADDITIONAL_DEFAULT_PROPERTIES += ro.allow.mock.location=1

DEFAULT_PROPERTY_OVERRIDES += ro.adb.secure=0
DEFAULT_PROPERTY_OVERRIDES += ro.secure=0
DEFAULT_PROPERTY_OVERRIDES += ro.allow.mock.location=1
#DEFAULT_PROPERTY_OVERRIDES += debug.mdpcomp.logs=1
#PRODUCT_COPY_FILES += device/samsung/ks01lte-common/default.prop:/root/default.prop

PRODUCT_COPY_FILES += vendor/samsung/ks01lte-common/proprietary/vendor/lib/libqc-opt.so:/system/lib/libqc-opt.so
PRODUCT_COPY_FILES += device/samsung/ks01lte-common/rootdir/system/bin/p2p_supplicant:/system/bin/p2p_supplicant
PRODUCT_COPY_FILES += device/samsung/ks01lte-common/rootdir/system/CSCVersion.txt:/system/CSCVersion.txt
PRODUCT_COPY_FILES += device/samsung/ks01lte-common/rootdir/system/kern_sec_info:/system/kern_sec_info
PRODUCT_COPY_FILES += device/samsung/ks01lte-common/rootdir/system/SW_Configuration.xml:/system/SW_Configuration.xml
PRODUCT_COPY_FILES += device/samsung/ks01lte-common/rootdir/system/tima_measurement_info:/system/tima_measurement_info


# Kernel Configs
TARGET_KERNEL_SOURCE := kernel/samsung/ks01lte
TARGET_KERNEL_CONFIG := msm8974_sec_defconfig
TARGET_KERNEL_SELINUX_CONFIG := selinux_defconfig

# Kernel
BOARD_KERNEL_CMDLINE := console=null androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x3F
#BOARD_KERNEL_CMDLINE := androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x3F


BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := --kernel_offset 0x00008000 --ramdisk_offset 0x02000000 --tags_offset 0x01e00000 --second_offset 0x00f00000
BOARD_KERNEL_SEPARATED_DT := true
BOARD_CUSTOM_BOOTIMG_MK := device/samsung/ks01lte-common/mkbootimg.mk

# Graphics
BOARD_EGL_CFG := device/samsung/ks01lte-common/egl.cfg

# Recovery
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
BOARD_CUSTOM_RECOVERY_KEYMAPPING := ../../device/samsung/ks01lte-common/recovery/recovery_keys.c
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_23x41.h\"
BOARD_USES_MMCUTILS := true
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_HAS_NO_MISC_PARTITION := true
BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_RECOVERY_FSTAB := device/samsung/ks01lte-common/rootdir/etc/fstab.qcom

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 20971520
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 20971520
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2390753280
BOARD_USERDATAIMAGE_PARTITION_SIZE := 12685655040
BOARD_FLASH_BLOCK_SIZE := 131072

# Flags
#COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE

# bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/samsung/ks01lte-common/bluetooth
BOARD_BLUEDROID_VENDOR_CONF := device/samsung/ks01lte-common/bluetooth/vnd_hlte-common.txt
BOARD_BLUETOOTH_USES_HCIATTACH_PROPERTY := false

# NFC
BOARD_NFC_HAL_SUFFIX := msm8974

#  camera and sensor fixes
COMMON_GLOBAL_CFLAGS += -DNEEDS_VECTORIMPL_SYMBOLS
SENSORS_NEED_SETRATE_ON_ENABLE := true

# Samsung's nonstandard csd-client
BOARD_HAVE_NEW_QCOM_CSDCLIENT := true

# QCOM support
BOARD_USES_QCOM_HARDWARE := true
TARGET_QCOM_MEDIA_VARIANT :=
TARGET_QCOM_DISPLAY_VARIANT :=
BOARD_USES_LEGACY_ALSA_AUDIO := 
TARGET_QCOM_AUDIO_VARIANT := caf

# Audio settings
BOARD_USES_ALSA_AUDIO := true
#BOARD_USES_CUSTOM_AUDIO_PLATFORM_PATH := device/samsung/ks01lte-common/audio/platform
AUDIO_FEATURE_DISABLED_MULTI_VOICE_SESSIONS := true
#
#AUDIO_FEATURE_DISABLED_ANC_HEADSET := true
#AUDIO_FEATURE_DISABLED_SSR := true
#AUDIO_FEATURE_DISABLED_INCALL_MUSIC := true
#AUDIO_FEATURE_DISABLED_SPKR_PROTECTION := true
#AUDIO_FEATURE_DISABLED_DS1_DOLBY_DDP := true
#AUDIO_FEATURE_DISABLED_FM := true

WIFI_DRIVER_FW_PATH_P2P     := 

# Don't use qcom camera HAL
#USE_DEVICE_SPECIFIC_CAMERA := true

# Build lights 
TARGET_PROVIDES_LIBLIGHT := true

# Time services
BOARD_USES_QC_TIME_SERVICES := true

# Display
#NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
OVERRIDE_RS_DRIVER := libRSDriver_adreno.so
TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true
TARGET_DISPLAY_USE_RETIRE_FENCE := true


USE_OPENGL_RENDERER := true
TARGET_USES_ION := true
TARGET_USES_CM_POWERHAL := true


# Shader cache config options
# Maximum size of the  GLES Shaders that can be cached for reuse.
# Increase the size if shaders of size greater than 12KB are used.
MAX_EGL_CACHE_KEY_SIZE := 12*1024

# Maximum GLES shader cache size for each app to store the compiled shader
# binaries. Decrease the size if RAM or Flash Storage size is a limitation
# of the device.
MAX_EGL_CACHE_SIZE := 2048*1024
