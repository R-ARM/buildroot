################################################################################
#
# Rtoybox
#
################################################################################

RTOYBOX_VERSION = main
RTOYBOX_SITE = git@github.com:R-ARM/Rtoybox.git
RTOYBOX_SITE_METHOD = git
RTOYBOX_DEPENDENCIES = sdl2 sdl2_ttf
RTOYBOX_CFLAGS = -DROS

define RTOYBOX_BUILD_CMDS
	$(MAKE) CFLAGS=$(RTOYBOX_CFLAGS) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
endef

define RTOYBOX_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/Rmenu2/rmenu2 $(TARGET_DIR)/bin/rmenu
	mkdir $(TARGET_DIR)/etc/rmenu
	$(INSTALL) -D -m 0644 $(@D)/Rmenu2/programs $(TARGET_DIR)/etc/rmenu/programs
	$(INSTALL) -D -m 0644 $(@D)/Rmenu2/emulators $(TARGET_DIR)/etc/rmenu/emulators
	$(INSTALL) -D -m 0755 $(@D)/Rmenu2/rmedia $(TARGET_DIR)/bin/rmedia
endef


$(eval $(generic-package))
