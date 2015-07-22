# Check for target product
ifeq (slimremix_falcon,$(TARGET_PRODUCT))

# Set bootanimation Size
SLIMREMIX_BOOTANIMATION_NAME := 720

# Include Slim-Remix common configuration
include vendor/slimremix/config/slimremix_common.mk

# Inherit CM device configuration
$(call inherit-product, device/motorola/falcon/slim.mk)

PRODUCT_NAME := slimremix_falcon

endif
