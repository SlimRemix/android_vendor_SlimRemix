#################################
## SlimRemix Required Packages Apps
PRODUCT_PACKAGES += \
    OmniSwitch

# SlimRemixOTA
PRODUCT_PACKAGES += \
    SlimOTA

# SlimRemix Kernel Tweaker
PRODUCT_PACKAGES += \
    KernelAdiutor \
    FloatingActionButton

# CameraNextMod
PRODUCT_PACKAGES += \
    #CameraNextMod \
    #libjni_mosaic_next

# Viper4Android
PRODUCT_COPY_FILES += \
vendor/slimremix/prebuilt/common/etc/viper/ViPER4Android.apk:system/app/ViPER4Android.apk

# KCAL - Advanced color control for Qualcomm MDSS 8x26/8974/8084
PRODUCT_COPY_FILES += \
vendor/slimremix/prebuilt/common/apk/re.codefi.savoca.kcal.apk:system/app/re.codefi.savoca.kcal.apk

