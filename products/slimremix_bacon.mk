# Check for target product
ifeq (slimremix_bacon,$(TARGET_PRODUCT))

# Set bootanimation Size
SLIMREMIX_BOOTANIMATION_NAME := 1080

# Include Slim-Remix common configuration
include vendor/slimremix/config/slimremix_common.mk

# Inherit CM device configuration
$(call inherit-product, device/oneplus/bacon/slim.mk)

PRODUCT_NAME := slimremix_bacon

endif
