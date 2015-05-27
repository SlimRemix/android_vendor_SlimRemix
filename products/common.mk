SlimRemix_Version=5.1.1_R3
SlimRemix_BUILD=$(SlimRemix_Version)

ifeq ($(RELEASE),)
ifneq ($(FORCE_BUILD_DATE),)
BUILD_DATE:=.$(FORCE_BUILD_DATE)
else
BUILD_DATE:=$(shell date +".%m%d%y")
endif
SLIMREMIX_BUILD=$(SlimRemix_Version)$(BUILD_DATE)
endif
