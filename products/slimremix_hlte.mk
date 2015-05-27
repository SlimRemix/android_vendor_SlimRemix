# Check for target product
ifeq (slimremix_hlte,$(TARGET_PRODUCT))

# Set bootanimation Size
SLIMREMIX_BOOTANIMATION_NAME := 1080

# Include CM-Remix common configuration
include vendor/slimremix/config/slimremix_common.mk

# Inherit CM device configuration
$(call inherit-product, device/samsung/hlte/slim.mk)

PRODUCT_NAME := slimremix_hlte

endif
