# Check for target product
ifeq (slimremix_trltespr,$(TARGET_PRODUCT))

# Set bootanimation Size
SLIMREMIX_BOOTANIMATION_NAME := 1600

# Include CM-Remix common configuration
include vendor/slimremix/config/slimremix_common.mk

# Inherit CM device configuration
$(call inherit-product, device/samsung/trltespr/slim.mk)

PRODUCT_NAME := slimremix_trltespr

endif
