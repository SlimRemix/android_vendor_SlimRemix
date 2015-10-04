# Check for target product
ifeq (slimremix_sprout4,$(TARGET_PRODUCT))

# Set bootanimation Size
SLIMREMIX_BOOTANIMATION_NAME := 480

# Include Slim-Remix common configuration
include vendor/slimremix/config/slimremix_common.mk

# Inherit CM device configuration
$(call inherit-product, device/google/sprout4/slim.mk)

PRODUCT_NAME := slimremix_sprout4

endif
