################################################################################
#
# Rmenu
#
################################################################################

RMENU_VERSION = main
RMENU_SITE = git@github.com:R-ARM/Rmenu.git
RMENU_SITE_METHOD = git
RMENU_DEPENDENCIES = sdl2 sdl2_ttf
RMENU_CFLAGS = -DROS

define RMENU_BUILD_CMDS
	$(MAKE) CFLAGS=$(RMENU_CFLAGS) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
endef

define RMENU_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/rmenu $(TARGET_DIR)/bin/rmenu
endef


$(eval $(generic-package))
