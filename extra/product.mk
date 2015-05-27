#################################
## SlimRemix Required Packages Apps
PRODUCT_PACKAGES += \
    OmniSwitch

# CMRemixOTA
PRODUCT_PACKAGES += \
    SlimRemixOTA

# slim Apps
PRODUCT_PACKAGES += \
    SlimFileManager \
    DashClock \
    SlimLauncher

# CMRemix Kernel Tweaker
PRODUCT_PACKAGES += \
    KernelAdiutor \
    FloatingActionButton

# Viper4Android
PRODUCT_COPY_FILES += \
vendor/slimremix/prebuilt/common/etc/viper/ViPER4Android.apk:system/app/ViPER4Android.apk

# KCAL - Advanced color control for Qualcomm MDSS 8x26/8974/8084
PRODUCT_COPY_FILES += \
vendor/slimremix/prebuilt/common/apk/re.codefi.savoca.kcal.apk:system/app/re.codefi.savoca.kcal.apk

