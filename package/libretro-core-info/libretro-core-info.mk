################################################################################
#
#
#
################################################################################

LIBRETRO_CORE_INFO_VERSION = HEAD
LIBRETRO_CORE_INFO_SITE = $(call github,libretro,libretro-core-info,$(LIBRETRO_CORE_INFO_VERSION))
LIBRETRO_CORE_INFO_LICENSE = GPL-2.0
LIBRETRO_CORE_INFO_LICENSE_FILES = LICENSE

define LIBRETRO_CORE_INFO_BUILD_CMDS
	true
endef

define LIBRETRO_CORE_INFO_INSTALL_TARGET_CMDS
	mkdir $(TARGET_DIR)/coreinfo
	cp -a $(@D)/*.info $(TARGET_DIR)/coreinfo
endef

$(eval $(generic-package))
