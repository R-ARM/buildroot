################################################################################
#
# Rmenu
#
################################################################################

RINPUTER_VERSION = HEAD
RINPUTER_SITE = git@github.com:R-ARM/Rinputer.git
RINPUTER_SITE_METHOD = git
RINPUTER_CFLAGS = -DROS

define RINPUTER_BUILD_CMDS
	$(MAKE) CFLAGS=$(RINPUTER_CFLAGS) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
endef

define RINPUTER_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/rinputer $(TARGET_DIR)/bin/rinputer
endef


$(eval $(generic-package))
