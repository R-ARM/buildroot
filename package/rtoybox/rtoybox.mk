################################################################################
#
# Rtoybox
#
################################################################################

#RTOYBOX_VERSION = a175926c9cb54c60149cd28e23be68df7b8a9e01
RTOYBOX_VERSION = master
RTOYBOX_SITE = git@github.com:R-ARM/Rtoybox.git
RTOYBOX_SITE_METHOD = git
RTOYBOX_DEPENDENCIES = sdl2 sdl2_ttf
TARGET_CFLAGS += -DROS

define RTOYBOX_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) 
endef

define RTOYBOX_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/Rmenu2/rmenu2 $(TARGET_DIR)/bin/rmenu
	mkdir -p $(TARGET_DIR)/etc/rmenu
	$(INSTALL) -D -m 0644 $(@D)/Rmenu2/programs $(TARGET_DIR)/etc/rmenu/programs
	$(INSTALL) -D -m 0644 $(@D)/Rmenu2/emulators $(TARGET_DIR)/etc/rmenu/emulators
	$(INSTALL) -D -m 0755 $(@D)/Rmedia/rmedia $(TARGET_DIR)/bin/rmedia
endef


$(eval $(generic-package))
