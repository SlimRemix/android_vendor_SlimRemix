# SlimRemix Configuration

# SuperSU
PRODUCT_COPY_FILES += \
    vendor/cmremix/prebuilt/common/etc/UPDATE-SuperSU.zip:system/addon.d/UPDATE-SuperSU.zip \
    vendor/cmremix/prebuilt/common/etc/init.d/99SuperSUDaemon:system/etc/init.d/99SuperSUDaemon

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

# Chromium Prebuilt
ifeq ($(PRODUCT_PREBUILT_WEBVIEWCHROMIUM),yes)
-include prebuilts/chromium/$(TARGET_DEVICE)/chromium_prebuilt.mk
endif

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

EXTENDED_POST_PROCESS_PROPS := vendor/slimremix/tools/slimremix_process_props.py

# Inherite sabermod vendor
SM_VENDOR := vendor/sm
include $(SM_VENDOR)/Main.mk
