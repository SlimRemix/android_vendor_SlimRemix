# Check for target product
ifeq (slimremix_ls990,$(TARGET_PRODUCT))

# Synapse 
TARGET_ENABLE_UKM := true

# Disable ADB authentication and set root access to Apps and ADB
DISABLE_ADB_AUTH := true

# Set bootanimation Size
SLIMREMIX_BOOTANIMATION_NAME := 1440

# Include CM-Remix common configuration
include vendor/slimremix/config/slimremix_common.mk

# Inherit CM device configuration
$(call inherit-product, device/lge/ls990/slim.mk)

PRODUCT_NAME := slimremix_ls990

endif
