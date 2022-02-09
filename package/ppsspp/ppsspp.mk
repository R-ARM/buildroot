################################################################################
#
# PPSSPP
#
################################################################################

PPSSPP_VERSION = v1.12.2
PPSSPP_SITE = git://github.com/hrydgard/ppsspp.git
PPSSPP_LICENSE = GPL-2.0
PPSSPP_LICENSE_FILES = LICENSE.TXT

PPSSPP_GIT_SUBMODULES=y
#PPSSPP_DEPENDENCIES = sdl2 zlib libzip zip ffmpeg snappy

PPSSPP_CONF_OPTS += \
	-DARM64=ON \
	-DUSING_EGL=OFF \
	-DUSING_FBDEV=OFF \
	-DUSING_GLES2=ON \
	-DUSING_X11_VULKAN=PFF \
	-DUSING_QT_UI=OFF \
	-DMOBILE_DEVICE=OFF \
	-DHEADLESS=OFF \
	-DUNITTEST=OFF \
	-DSIMULATOR=OFF \
	-DUSE_DISCORD=OFF \
	-DUSE_MINIUPNPC=OFF \
	-DUSE_SYSTEM_SNAPPY=OFF \
	-DUSE_SYSTEM_FFMPEG=ON \
	-DUSE_SYSTEM_LIBZIP=ON \
	-DUSE_SYSTEM_SDL2=ON \
	-DARM_NO_VULKAN=ON


define PPSSPP_PRE_CONFIGURE
	sed -E -i '/GIT_VERSION/s/unknown/$(PPSSPP_VERSION)/' $(@D)/git-version.cmake
endef

PPSSPP_PRE_CONFIGURE_HOOKS += PPSSPP_PRE_CONFIGURE

$(eval $(cmake-package))
