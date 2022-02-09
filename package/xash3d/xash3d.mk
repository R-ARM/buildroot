################################################################################
#
# xash3d
#
################################################################################

XASH3D_VERSION = HEAD
XASH3D_SITE = https://github.com/FWGS/xash3d-fwgs
XASH3D_SITE_METHOD = git
XASH3D_DEPENDENCIES += sdl2
XASH3D_GIT_SUBMODULES = y
#XASH3D_LICENSE = GPL-2.0+
#XASH3D_LICENSE_FILES = LICENSE.GPL
#XASH3D_CPE_ID_VENDOR = xash3d
#XASH3D_INSTALL_STAGING = YES
#XASH3D_NEEDS_EXTERNAL_WAF = YES
#XASH3D_CONF_ENV = PATH="$(PATH):$(STAGING_DIR)/usr/bin/"

XASH3D_CONF_OPTS = -T release -8 --enable-gles2 --disable-menu-changegame --prefix=/usr

$(eval $(waf-package))
