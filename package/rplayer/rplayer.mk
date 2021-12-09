################################################################################
#
# Rmenu
#
################################################################################

RPLAYER_VERSION = HEAD
RPLAYER_SITE = git@github.com:R-ARM/Rplayer.git
RPLAYER_SITE_METHOD = git
RPLAYER_CFLAGS = -DROS

define RPLAYER_BUILD_CMDS
	$(MAKE) CFLAGS=$(RPLAYER_CFLAGS) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
endef

define RPLAYER_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/raudio $(TARGET_DIR)/bin/raudio
	$(INSTALL) -D -m 0755 $(@D)/rvideo $(TARGET_DIR)/bin/rvideo
endef


$(eval $(generic-package))
