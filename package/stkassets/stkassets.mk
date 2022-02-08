################################################################################
#
# Rtoybox
#
################################################################################

#STKASSETS_VERSION = a175926c9cb54c60149cd28e23be68df7b8a9e01
STKASSETS_VERSION = r18480
STKASSETS_SITE = http://svn.code.sf.net/p/supertuxkart/code/stk-assets
STKASSETS_SITE_METHOD = svn
STKASSETS_DEPENDENCIES = 

define STKASSETS_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/local/share/games/supertuxkart
	cp -r $(@D)/* $(TARGET_DIR)/local/share/games/supertuxkart
endef


$(eval $(generic-package))
