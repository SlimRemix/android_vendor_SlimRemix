# SlimRemix Configuration

PRODUCT_PACKAGES += \
    OmniSwitch \
    LockClock \
    Eleven

# SlimRemixOTA
PRODUCT_PACKAGES += \
    SlimOTA \
    SlimRemixUpdater

#Music Player
PRODUCT_PACKAGES += \
    Apollo

# SlimRemix Kernel Tweaker
PRODUCT_PACKAGES += \
    KernelAdiutor \
    FloatingActionButton

# Screen recorder package and lib
PRODUCT_PACKAGES += \
    ScreenRecorder \
    libscreenrecorder

# Viper4Android
PRODUCT_COPY_FILES += \
vendor/slimremix/prebuilt/common/apk/ViPER4Android/ViPER4Android_FX_A4.x/ViPER4Android_FX_A4.x.apk:system/app/ViPER4Android/ViPER4Android_FX_A4.x.apk
vendor/slimremix/prebuilt/common/apk/ViPER4Android/addon.d/95-LolliViPER.sh:system/addon.d/95-LolliViPER.sh
vendor/slimremix/prebuilt/common/apk/ViPER4Android/audio_policy.sh:system/audio_policy.sh

# KCAL - Advanced color control for Qualcomm MDSS 8x26/8974/8084
PRODUCT_COPY_FILES += \
vendor/slimremix/prebuilt/common/apk/Savoca-Kcal/Savoca-Kcal.apk:system/app/Savoca-Kcal/Savoca-Kcal.apk

# MDNIE-tuner
PRODUCT_COPY_FILES += \
vendor/slimremix/prebuilt/common/apk/MDNIE-tuner/MDNIE-tuner.apk:system/app/MDNIE-tuner/MDNIE-tuner.apk

# OpenCamra
PRODUCT_COPY_FILES += \
vendor/slimremix/prebuilt/common/apk/OpenCamera/OpenCamera.apk:system/app/OpenCamera/OpenCamera.apk

# Layers Manager
PRODUCT_COPY_FILES += \
vendor/slimremix/prebuilt/common/apk/LayersManager/LayersManager.apk:system/app/LayersManager/LayersManager.apk

# SuperSU
PRODUCT_COPY_FILES += \
    vendor/slimremix/prebuilt/common/etc/UPDATE-SuperSU.zip:system/addon.d/UPDATE-SuperSU.zip \
    vendor/slimremix/prebuilt/common/etc/init.d/99SuperSUDaemon:system/etc/init.d/99SuperSUDaemon

# HFM Files
PRODUCT_COPY_FILES += \
    vendor/slimremix/prebuilt/etc/hosts.alt:system/etc/hosts.alt \
    vendor/slimremix/prebuilt/etc/hosts.og:system/etc/hosts.og

# WakeGestures
PRODUCT_COPY_FILES += \
vendor/slimremix/prebuilt/common/apk/WakeGestures/WakeGestures.apk:system/app/WakeGestures/WakeGestures.apk

# Synapse
PRODUCT_COPY_FILES += \
vendor/slimremix/prebuilt/common/apk/Synapse/Synapse.apk:system/app/Synapse/Synapse.apk

# SlimRemix Overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/slimremix/overlay/common

# Bootanimation
PRODUCT_COPY_FILES += vendor/slimremix/prebuilt/common/bootanimation/$(SLIMREMIX_BOOTANIMATION_NAME).zip:system/media/bootanimation.zip

# Init script file with SlimRemix extras
PRODUCT_COPY_FILES += \
vendor/slimremix/prebuilt/common/etc/init.local.rc:root/init.slimremix.rc

# easy way to extend to add more packages
-include vendor/slimremix/extra/product.mk

# Debugs Script
-include vendor/slimremix/products/debug.mk

# SlimRemix version
SLIMREMIXVERSION := $(shell echo $(SLIMREMIX_VERSION) | sed -e 's/^[ \t]*//;s/[ \t]*$$//;s/ /./g')
BOARD := $(subst slimremix_,,$(TARGET_PRODUCT))
SLIMREMIX_BUILD_VERSION := SlimRemix-$(BOARD)-$(SLIMREMIXVERSION)-$(shell date +%Y%m%d-%H%M%S)

# Set the board version
SLIM_BUILD := $(BOARD)

# Lower RAM devices
ifeq ($(SLIMREMIX_LOW_RAM_DEVICE),true)
MALLOC_IMPL := dlmalloc
TARGET_BOOTANIMATION_TEXTURE_CACHE := false

PRODUCT_PROPERTY_OVERRIDES += \
    config.disable_atlas=true \
    dalvik.vm.jit.codecachesize=0 \
    persist.sys.force_highendgfx=true \
    ro.config.low_ram=true \
    ro.config.max_starting_bg=8 \
    ro.sys.fw.bg_apps_limit=16
endif

# ROMStats Properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.slimremixstats.name=SlimRemix Rom \
    ro.slimremixstats.version=$(SLIMREMIXVERSION) \
    ro.slimremixstats.tframe=1

# statistics identity
PRODUCT_PROPERTY_OVERRIDES += \
    ro.slimremix.version=$(SLIMREMIXVERSION) \
    ro.modversion=$(SLIMREMIX_BUILD_VERSION) \
    slimremix.ota.version=$(SLIMREMIX_BUILD_VERSION)

# Disable ADB authentication and set root access to Apps and ADB
ifeq ($(DISABLE_ADB_AUTH),true)
    ADDITIONAL_DEFAULT_PROPERTIES += \
        ro.adb.secure=3 \
        persist.sys.root_access=3
endif

# TWRP Recovery
ifeq ($(RECOVERY_VARIANT),twrp)
    ifeq ($(CMREMIX_MAKE),recoveryimage)
        BOARD_SEPOLICY_IGNORE += external/sepolicy/domain.te
        BOARD_SEPOLICY_DIRS += vendor/cmremix/sepolicy/twrp
        BOARD_SEPOLICY_UNION += domain.te init.te recovery.te
    endif
endif

EXTENDED_POST_PROCESS_PROPS := vendor/slimremix/tools/slimremix_process_props.py
SQUISHER_SCRIPT := vendor/slimremix/tools/squisher

# Viper4Android Tweaks
PRODUCT_PROPERTY_OVERRIDES += \
    lpa.decode=false \
    lpa.releaselock=false \
    lpa.use-stagefright=false \
    tunnel.decode=false

ifeq ($(TARGET_ENABLE_UKM),true)
-include vendor/slimremix/config/common_ukm.mk
endif

# Inherite sabermod vendor
SM_VENDOR := vendor/sm
include $(SM_VENDOR)/Main.mk
