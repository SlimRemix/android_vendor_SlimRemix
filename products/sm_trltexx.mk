# Copyright (C) 2015 The SaberMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
#

# Find host os
UNAME := $(shell uname -s)

ifeq ($(strip $(UNAME)),Linux)
  HOST_OS := linux
endif

# Only use these compilers on linux host.
ifeq ($(strip $(HOST_OS)),linux)

  # Sabermod configs
  TARGET_ARCH := arm
  TARGET_NDK_VERSION := 4.9
  TARGET_SM_AND := 4.9
  TARGET_SM_KERNEL := 4.9
  USE_CLANG_QCOM := true
  TRLTEXX_THREADS := 4
  PRODUCT_THREADS := $(TRLTEXX_THREADS)
  ENABLE_STRICT_ALIASING := true
  export ENABLE_PTHREAD := false

GRAPHITE_KERNEL_FLAGS := \
    -floop-parallelize-all \
    -ftree-parallelize-loops=$(PRODUCT_THREADS) \
    -fopenmp
endif

# General flags for gcc 4.9 to allow compilation to complete.
MAYBE_UNINITIALIZED := \
  hwcomposer.msm8974 \
  libbt-brcm_stack

# Extra SaberMod GCC C flags for arch target and Kernel
export EXTRA_SABERMOD_GCC_VECTORIZE_CFLAGS := \
         -ftree-vectorize \
         -mvectorize-with-neon-quad

ifeq ($(strip $(ENABLE_STRICT_ALIASING)),true)
  # strict-aliasing kernel flags
  export KERNEL_STRICT_FLAGS := \
           -fstrict-aliasing \
           -Wstrict-aliasing=3 \
           -Werror=strict-aliasing

  # Enable strict-aliasing kernel flags
#export CONFIG_ARCH_APQ8084_TRLTE_STRICT_ALIASING := y
#LOCAL_DISABLE_STRICT_ALIASING := \
   #libmmcamera_interface\
   #camera.hammerhead
endif
