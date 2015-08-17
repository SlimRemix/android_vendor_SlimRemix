#################################
## SlimRemix Required Packages Apps
PRODUCT_PACKAGES += \
    OmniSwitch \
    LockClock

# SlimRemixOTA
PRODUCT_PACKAGES += \
    SlimOTA \
    SlimRemixUpdater

#Music Player
PRODUCT_PACKAGES += \
    Apollo

# SlimRemix Kernel Tweaker
PRODUCT_PACKAGES += \
    KernelAdiutor \
    FloatingActionButton

# Screen recorder package and lib
PRODUCT_PACKAGES += \
    ScreenRecorder \
    libscreenrecorder

# Viper4Android
PRODUCT_COPY_FILES += \
vendor/slimremix/prebuilt/common/apk/ViPER4Android/ViPER4Android_FX_A4.x/ViPER4Android_FX_A4.x.apk:system/app/ViPER4Android/ViPER4Android_FX_A4.x.apk
vendor/slimremix/prebuilt/common/apk/ViPER4Android/addon.d/95-LolliViPER.sh:system/addon.d/95-LolliViPER.sh
vendor/slimremix/prebuilt/common/apk/ViPER4Android/audio_policy.sh:system/audio_policy.sh

# KCAL - Advanced color control for Qualcomm MDSS 8x26/8974/8084
PRODUCT_COPY_FILES += \
vendor/slimremix/prebuilt/common/apk/Savoca-Kcal/Savoca-Kcal.apk:system/app/Savoca-Kcal/Savoca-Kcal.apk

# MDNIE-tuner
PRODUCT_COPY_FILES += \
vendor/slimremix/prebuilt/common/apk/MDNIE-tuner/MDNIE-tuner.apk:system/app/MDNIE-tuner/MDNIE-tuner.apk

# OpenCamra
PRODUCT_COPY_FILES += \
vendor/slimremix/prebuilt/common/apk/OpenCamera/OpenCamera.apk:system/app/OpenCamera/OpenCamera.apk

# Layers Manager
PRODUCT_COPY_FILES += \
vendor/slimremix/prebuilt/common/apk/layersmanager.apk:system/app/layersmanager.apk
