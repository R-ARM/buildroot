################################################################################
#
# Rdaemon
#
################################################################################

RDAEMON_VERSION = 59c3f14f7a705824aa00b99bec8843882c5247be
RDAEMON_SITE = git://github.com/R-ARM/Rdaemon.git
RDAEMON_SITE_METHOD = git
RDAEMON_CFLAGS = -DROS

define RDAEMON_BUILD_CMDS
	$(MAKE) CFLAGS=$(RDAEMON_CFLAGS) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
endef

define RDAEMON_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0777 $(@D)/rdaemon $(TARGET_DIR)/bin/rdaemon
	$(INSTALL) -D -m 0777 package/rdaemon/S50rdaemon $(TARGET_DIR)/etc/init.d/S50rdaemon
endef


$(eval $(generic-package))
