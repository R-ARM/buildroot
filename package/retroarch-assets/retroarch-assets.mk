################################################################################
#
# RETROARCH ASSETS | https://gitlab.com/recalbox/recalbox/-/blob/master/package/retroarch-assets
#
################################################################################

RETROARCH_ASSETS_VERSION = 8d114dd55b0a357efec12d34d02dfe190a6ccc3a
RETROARCH_ASSETS_SITE = $(call github,libretro,retroarch-assets,$(RETROARCH_ASSETS_VERSION))
RETROARCH_ASSETS_LICENSE = GPL
RETROARCH_ASSETS_DEPENDENCIES = retroarch

define RETROARCH_ASSETS_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/retroarch_assets/xmb
	cp -r $(@D)/ozone $(TARGET_DIR)/retroarch_assets
	cp -r $(@D)/rgui $(TARGET_DIR)/retroarch_assets
	cp -r $(@D)/glui $(TARGET_DIR)/retroarch_assets
	cp -r $(@D)/xmb/monochrome $(TARGET_DIR)/retroarch_assets/xmb
	cp -r $(@D)/menu_widgets $(TARGET_DIR)/retroarch_assets
endef

$(eval $(generic-package))
