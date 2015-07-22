# Check for target product
ifeq (slimremix_shamu,$(TARGET_PRODUCT))

# Set bootanimation Size
SLIMREMIX_BOOTANIMATION_NAME := 1600

# Include CM-Remix common configuration
include vendor/slimremix/config/slimremix_common.mk

# Inherit CM device configuration
$(call inherit-product, device/motorola/shamu/slim.mk)

PRODUCT_NAME := slimremix_shamu

endif
