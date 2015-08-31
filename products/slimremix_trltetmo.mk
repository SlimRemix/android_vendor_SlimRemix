# Check for target product
ifeq (slimremix_trltetmo,$(TARGET_PRODUCT))

# Synapse 
TARGET_ENABLE_UKM := true

# Set bootanimation Size
SLIMREMIX_BOOTANIMATION_NAME := 1600

# Include CM-Remix common configuration
include vendor/slimremix/config/slimremix_common.mk

# Inherit CM device configuration
$(call inherit-product, device/samsung/trltetmo/slim.mk)

PRODUCT_NAME := slimremix_trltetmo

endif
